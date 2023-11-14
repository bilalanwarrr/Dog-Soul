import 'package:flutter/material.dart';
import 'package:hunter/views/ItemDetail/MobileView.dart';
import 'package:hunter/views/ItemDetail/TabletView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailView extends StatelessWidget {
  const ItemDetailView({Key? key, required this.uid, required this.title}) : super(key: key);

  final String title;
  final int uid;

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().deviceType() == DeviceType.mobile ? MobileView(uid: uid, title: title,) : TabletView(uid: uid, title: title,);
  }
}
