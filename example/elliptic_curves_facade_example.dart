import 'package:elliptic/elliptic.dart';
import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'dart:math';

void main() {
  final facade = EllipticCurveFacade(getSecp256k1() as EllipticCurve);
  String hexPresentation = "";
  Random rand = Random.secure();
  for(int i = 0; i < 32; i++) {
    hexPresentation = hexPresentation + rand.nextInt(255).toRadixString(16).padLeft(2, "0");
  }
  BigInt privateKey = BigInt.parse(hexPresentation, radix: 16);
  ECPoint publicKey = facade.mulScalar(facade.getG(), privateKey);
  publicKey.printPoint();
}
