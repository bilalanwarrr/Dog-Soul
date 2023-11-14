import 'package:flutter/cupertino.dart';

class OrientationService{
  ValueNotifier valueOrientation = ValueNotifier(0);

  void setOrientation(val) {
    valueOrientation.value = val;
  }
}