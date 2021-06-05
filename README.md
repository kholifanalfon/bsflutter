# bs_flutter

Simple widget from Bootstrap v5 component, including responsive grid layout with bootstrap grid system

## Getting Started

![Alt text](Screenshot_1.png?raw=true "Screenshot Example")
The best way to make responsive and catchy layout.

## Responsive Layout

```dart
import 'package:flutter/material.dart';
import 'package:bs_flutter/bs_flutter.dart';

BsContainer(
  child: BsRow(
    children: [
      BsCol(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.only(left: 10.0),
        sizes: ColSize.all(Col.col_12),
        child: Container()
      ),
      BsCol(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.only(left: 10.0),
        sizes: ColSize.all(Col.col_12),
        child: Container()
      )
    ]
  )
);
```

