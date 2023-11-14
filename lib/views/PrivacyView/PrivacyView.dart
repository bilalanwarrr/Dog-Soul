import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../PrivacyView/MobileView.dart';
import '../PrivacyView/TabletView.dart';

class PrivacyView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   return ScreenUtil().deviceType() == DeviceType.mobile ? MobileView() : TabletView();;
  }
}
