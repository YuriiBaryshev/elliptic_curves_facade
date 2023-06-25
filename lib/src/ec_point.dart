part of elliptic_curves_facade;
///Class for EC point implementation
class ECPoint {
  late BigInt x, y;

  ///Creates instance of a point with BigInt  and y coordinates
  ECPoint(this.x, this.y);

  ///Comparing operator
  @override
  operator ==(Object other) {
    return (other is ECPoint) && (other.x == x) && (other.y == y);
  }

  ///Hash code override
  @override
  int get hashCode => Object.hash(x, y);
}