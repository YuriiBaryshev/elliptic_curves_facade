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


  ///from hex string
  static ECPoint fromString(String pointHexString, [int? bitLength]) {
    bitLength ??= pointHexString.length << 1; // *4 and /2
    BigInt otherX = BigInt.parse(pointHexString.substring(0, bitLength >> 2), radix: 16);
    BigInt otherY = BigInt.parse(pointHexString.substring(bitLength >> 2), radix: 16);
    return ECPoint(otherX, otherY, bitLength);
  }


  ///Creates ECPoint on the basis of coordinates
  ///for 256 bit length module of curve by default
  static createPoint(BigInt otherX, BigInt otherY, [int bitLength = 256]) {
    return ECPoint(otherX, otherY, bitLength);
  }


  ///printPoint
  void printPoint() {
    print(this);
  }
}