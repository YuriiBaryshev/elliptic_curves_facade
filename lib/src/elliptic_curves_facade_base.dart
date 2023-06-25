
part of elliptic_curves_facade;

/// Elliptic curves facade
class EllipticCurveFacade {
  late EllipticCurve curve;

  EllipticCurveFacade(EllipticCurve? underlyingCurve) {
    curve = underlyingCurve ?? getSecp256k1() as EllipticCurve;
  }
}
