import 'package:flutter/material.dart';
import 'package:hunter/provider/dataProvider.dart';
import 'package:hunter/views/HomeView/MobileView.dart';
import 'package:hunter/views/HomeView/TabletView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.header}) : super(key: key);

  String? header;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {
    var dataPro = Provider.of<DataProvider>(context, listen: false);
    await dataPro.fetchCateg(widget.header!);
    await dataPro.fetchDocs();
    await dataPro.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().deviceType() == DeviceType.mobile
        ? MobileView()
        : TabletView();
  }
}
