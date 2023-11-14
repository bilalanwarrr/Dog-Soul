import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ContactView/MobileView.dart';
import '../ContactView/TabletView.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().deviceType() == DeviceType.mobile ? MobileView() : TabletView();
  }
}
