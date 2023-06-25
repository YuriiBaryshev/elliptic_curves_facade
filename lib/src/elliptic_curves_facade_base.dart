
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
}
