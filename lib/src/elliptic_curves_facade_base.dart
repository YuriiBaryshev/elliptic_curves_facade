part of elliptic_curves_facade;

/// Elliptic curves facade
class EllipticCurveFacade {
  late EllipticCurve curve;

  EllipticCurveFacade(EllipticCurve? underlyingCurve) {
    curve = underlyingCurve ?? getSecp256k1() as EllipticCurve;
  }

  ///Determines whenever the point is on curve
  bool isOnCurve(ECPoint point) {
    return (point.y * point.y) % curve.p ==
        ((((point.x * point.x) % curve.p) * point.x + curve.a * point.x + curve.b) % curve.p);
  }

  ///Returns G point of elliptic curve
  ECPoint getG() {
    return ECPoint(curve.G.X, curve.G.Y);
  }

  ///Adds two points
  ECPoint addPoint(ECPoint a, ECPoint b) {
    if(!isOnCurve(a) && !isOnCurve(b)) {
      throw ArgumentError("ECCurveFacade: cannot add point from another curve");
    }

    AffinePoint c = curve.add(
        AffinePoint.fromXY(a.x, a.y),
        AffinePoint.fromXY(b.x, b.y)
    );
    return ECPoint(c.X, c.Y, curve.bitSize);
  }

  ///Multiply to scalar
  ECPoint mulScalar(ECPoint point, BigInt scalar) {
    if(!isOnCurve(point)) {
      throw ArgumentError("ECCurveFacade: cannot add point from another curve");
    }
    BigInt mask = BigInt.one << (scalar.bitLength - 2);
    ECPoint intermediatePoint = point;
    for(; mask != BigInt.zero; mask = mask >> 1) {
      intermediatePoint = addPoint(intermediatePoint, intermediatePoint);
      if((scalar & mask) != BigInt.zero) {
        intermediatePoint = addPoint(intermediatePoint, point);
      }
    }
    return intermediatePoint;
  }

  ///Double provided point
  ECPoint doublePoint(ECPoint point) {
    if(!isOnCurve(point)) {
      throw ArgumentError("ECCurveFacade: cannot add point from another curve");
    }

    return addPoint(point, point);
  }
}
