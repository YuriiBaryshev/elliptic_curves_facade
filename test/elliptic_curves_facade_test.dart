import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'package:elliptic/elliptic.dart';
import 'package:test/test.dart';

void main() {
  group('An elliptic curve facade tests', ()
  {
    final facade = EllipticCurveFacade(getSecp256k1() as EllipticCurve);
    final ECPoint somePoint = ECPoint(BigInt.one, BigInt.one);
    final ECPoint G = ECPoint(facade.curve.G.X, facade.curve.G.Y);

    test('check curve settings', () {
      expect(facade.curve, getSecp256k1());
      expect(facade.curve.p, BigInt.parse(
          "fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f",
          radix: 16));
      expect(facade.curve.a, BigInt.zero);
      expect(facade.curve.b, BigInt.from(7));
    });


    test('check whenever point is on curve', () {
      expect(facade.isOnCurve(somePoint), isFalse);
      expect(facade.isOnCurve(G), isTrue);
    });


    test('returns G', () {
      expect(facade.getG(), G);
    });


    test('returns ECPoint toString', () {
      expect(G.toString(), "79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f"
          "2815b16f81798483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08"
          "ffb10d4b8");
      expect(somePoint.toString(), "0000000000000000000000000000000000000000000"
          "00000000000000000000100000000000000000000000000000000000000000000000"
          "00000000000000001");
    });


    test('returns ECPoint from', () {
      expect(ECPoint.fromString(
          "79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f"
              "2815b16f81798483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08"
              "ffb10d4b8"), G);
      expect(ECPoint.fromString("0000000000000000000000000000000000000000000"
          "00000000000000000000100000000000000000000000000000000000000000000000"
          "00000000000000001"), somePoint);
    });


    test('creates point for whatever reason', () {
      ECPoint cEC = facade.addPoint(G, G);
      AffinePoint cAF = getSecp256k1().scalarBaseMul([2]);
      expect(cEC, ECPoint.createPoint(cAF.X, cAF.Y));
    });


    test('multiply point for scalar', () {
      AffinePoint cAF = getSecp256k1().scalarBaseMul([42]);
      expect(facade.mulScalar(G, BigInt.from(42)),
          ECPoint.createPoint(cAF.X, cAF.Y));

      cAF = getSecp256k1().scalarBaseMul([142]);
      expect(facade.mulScalar(G, BigInt.from(142)),
          ECPoint.createPoint(cAF.X, cAF.Y));

      cAF = getSecp256k1().scalarBaseMul([1, 1]);
      expect(facade.mulScalar(G, BigInt.from(257)),
          ECPoint.createPoint(cAF.X, cAF.Y));
    });


    test('double point', () {
      AffinePoint cAF = getSecp256k1().scalarBaseMul([2]);
      expect(facade.doublePoint(G), ECPoint.createPoint(cAF.X, cAF.Y));
    });
  });
}
