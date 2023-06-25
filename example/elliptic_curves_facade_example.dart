import 'package:elliptic_curves_facade/elliptic_curves_facade.dart';
import 'package:elliptic/elliptic.dart';

void main() {
  final facade = EllipticCurveFacade(getSecp256k1() as EllipticCurve);

}
