import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Other/MobileView.dart';
import '../Other/TabletView.dart';

class OtherView extends StatelessWidget {
  const OtherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().deviceType() == DeviceType.mobile ? MobileView() : TabletView();
  }
}
