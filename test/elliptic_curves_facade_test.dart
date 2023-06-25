import 'dart:math';

import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'package:elliptic/elliptic.dart';
import 'package:test/test.dart';

void main() {
  group('An elliptic curve facade tests', () {
    final facade = EllipticCurveFacade(getSecp256k1() as EllipticCurve);

    test('check curve settings', () {
      expect(facade.curve, getSecp256k1());
      expect(facade.curve.p, BigInt.parse("fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f", radix: 16));
      expect(facade.curve.a, BigInt.zero);
      expect(facade.curve.b, BigInt.from(7));
    });
  });
}
