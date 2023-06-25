Facade of elliptic lib created as an task of educational courses

## Features

Consists of the following classes:
- ECPoint - represents elliptic curve point
- EllipticCurveFacade - represents elliptic curve

ECPoint methods:
* toString - override of Object's method serialize coordinates as hex string
* fromString - creates ECPoint from hex string
* createPoint - points factory
* printPoint - print ECPoint.toString presentation

EllipticCurveFacade methods:
* isOnCurve - determine whenever the given point is on curve
* getG - returns base point
* addPoint - adds two points
* mulScalar - multiply point and scalar
* doublePoint - doubles given point
* 
## Getting started

1. Install Dart SDK and Flutter framework.
2. Install IDE (this was developed using Android studio, but any Dart-supporting will do).
3. Run command flutter test in project's folder in order to see that every thing is alright (all tests passed).

## Usage

```dart
import 'package:elliptic/elliptic.dart';
//...
final facade = EllipticCurveFacade(
  EllipticCurve(
    "some curve",     //name
    5,                //bitLength
    BigInt.from(31),  //p
    BigInt.from(7),   //a
    BigInt.one,       //b
    BigInt.zero,      //seed - not used
    AffinePoint.fromXY(BigInt.one, BigInt.from(3)), // G
    BigInt.from(31),  // n - didn't compute it - just random number for example TODO: compute
    27                // cofactor - didn't compute it - just random number for example TODO: compute
  )
); //or any other curve
facade.getG().printPoint(); // 13
//i.e. x = 1, y = 3 
```

One may refer to [example](./example) folder for more examples
