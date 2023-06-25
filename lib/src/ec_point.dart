part of elliptic_curves_facade;
///Class for EC point implementation
class ECPoint {
  late BigInt x, y;
  late int bitLength;

  int get _hexLength => bitLength >> 2;

  ///Creates instance of a point with BigInt  and y coordinates
  ECPoint(this.x, this.y, [this.bitLength = 256]);

  ///Comparing operator
  @override
  operator ==(Object other) {
    return (other is ECPoint) && (other.x == x) && (other.y == y)
        && bitLength == other.bitLength;
  }

  ///Hash code override
  @override
  int get hashCode => Object.hash(x, y);

  ///toString override
  @override
  String toString() {
    return x.toRadixString(16).padLeft(_hexLength, '0') + y.toRadixString(16).padLeft(_hexLength, '0');
  }
}