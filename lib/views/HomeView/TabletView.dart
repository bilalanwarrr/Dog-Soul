import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunter/constant.dart';
import 'package:hunter/views/HomeView/HomeView.dart';
import 'package:hunter/widgets/CustomText.dart';
import 'package:easy_refresh/easy_refresh.dart';
import '../../provider/dataProvider.dart';
import '../ItemDetail/ItemDetailView.dart';
import '../Other/OtherView.dart';
import 'package:provider/provider.dart';

import 'web_view_container.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    var dataPro = Provider.of<DataProvider>(context); 

    return Scaffold(

    floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Heree");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WebViewContainer("https://www.chatnode.ai/embed/ebcb996e120b4cae")),
  );
},
        backgroundColor: primaryColor,
        child: Icon(Icons.message),
      ),
      body: EasyRefresh(
        footer: NotLoadFooter(),
        onLoad: () {},
        onRefresh: () {
          dataPro.fetchCateg("base");
          dataPro.fetchVideos();
          dataPro.fetchDocs();
          print('onRefresh------');
        },
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    scale: 1.1,
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/bone_pattern.png'))),
            child: MediaQuery.of(context).orientation.index == 0
                ? _portraitView(
                    MediaQuery.of(context).orientation.index, dataPro.categList)
                : _landscapeView(MediaQuery.of(context).orientation.index,
                    dataPro.categList),
          ),
        ),
      ),
    );
  }

  Widget _portraitView(orientation, categList) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 120.h),
          decoration: BoxDecoration(
              color: lightBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r))),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: categList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var c = categList[index];

                      return Column(
                        children: [
                          c.get('title') != null && c.get('img') != null
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailView(
                                                  uid: c.get('uid'),
                                                  title: c.get('title'),
                                                )));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: (categList.length - 1) == index
                                            ? 0
                                            : 20.h),
                                    child: _mainItem(
                                        '${c.get('title')}', '${c.get('img')}'),
                                  ),
                                )
                              : Container(),
                          (categList.length - 1) == index
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeView(header: "5")));

                                    // var dataPro = Provider.of<DataProvider>(
                                    //     context,
                                    //     listen: false);

                                    // dataPro.fetchCateg("6");
                                    // dataPro.fetchVideos();
                                    // dataPro.fetchDocs();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20.w, right: 20.w, top: 20.h),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 25.h, horizontal: 20.w),
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            colorFilter: ColorFilter.mode(
                                                primaryColor,
                                                BlendMode.overlay),
                                            image: AssetImage(
                                                'assets/images/more.png'))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 110.h,
                                          width: 180.w,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(
                                                txt: 'More...',
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                fontColor: whiteColor,
                                              ),
                                              Image.asset(
                                                'assets/images/bt.png',
                                                color: whiteColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
        Positioned(
            right: MediaQuery.of(context).size.width * 0.3,
            top: 30,
            child: Image.asset(
              'assets/images/DOG.png',
              height: 180.h,
              width: 160.w,
              fit: BoxFit.fill,
            )),
        Positioned(
            right: 20.w,
            left: 20.w,
            top: 30.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset('assets/images/logo.png'),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 70.h,
                      width: 45.w,
                      fit: BoxFit.fill,
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtherView()));
                    },
                    child: Image.asset('assets/images/menu.png')),
              ],
            ))
      ],
    );
  }

  Widget _landscapeView(orientation, categList) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 140.h),
          padding: EdgeInsets.only(top: 30.h),
          decoration: BoxDecoration(
              color: lightBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r))),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    itemCount: categList.length + 1,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    // physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.0,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 8.w),
                    itemBuilder: (context, index) {
                      var c;
                      if (index != categList.length) {
                        c = categList[index];
                      }

                      return index == categList.length
                          ? GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeView(header: "5")));
                              },
                              child: Container(
                                // margin: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
                                padding: EdgeInsets.symmetric(
                                    vertical: 35.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/more.png'),
                                        colorFilter: ColorFilter.mode(
                                            primaryColor, BlendMode.overlay),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 110.h,
                                      width: 92.w,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            txt: 'More...',
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold,
                                            fontColor: Colors.white,
                                          ),
                                          Image.asset(
                                            'assets/images/bt.png',
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : c.get('title') != null && c.get('img') != null
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ItemDetailView(
                                                    uid: c.get('uid'),
                                                    title: c.get('title'))));
                                  },
                                  child: _mainItem1(
                                      '${c.get('title')}', c.get('img')))
                              : Container();
                    }),
              ),
              // GestureDetector(
              //   onTap: () {
              //     var dataPro =
              //         Provider.of<DataProvider>(context, listen: false);

              //     dataPro.fetchCateg("6");
              //     dataPro.fetchVideos();
              //     dataPro.fetchDocs();

              //     // Navigator.pushReplacement(
              //     //     context, MaterialPageRoute(builder: (context) => HomeView(header: "5")));
              //     // var dataPro =
              //     //     Provider.of<DataProvider>(context, listen: false);

              //     // dataPro.fetchCateg("6");
              //     // dataPro.fetchVideos();
              //     // dataPro.fetchDocs();
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(
              //         left: 20.w, right: 20.w, top: 20.h, bottom: 20.h),
              //     padding:
              //         EdgeInsets.symmetric(vertical: 45.h, horizontal: 10.w),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20.r),
              //         image: DecorationImage(
              //             colorFilter:
              //                 ColorFilter.mode(primaryColor, BlendMode.overlay),
              //             fit: BoxFit.cover,
              //             image: AssetImage('assets/images/more.png'))),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         SizedBox(
              //           height: 150.h,
              //           width: 92.w,
              //           child: Row(
              //             crossAxisAlignment: CrossAxisAlignment.end,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               CustomText(
              //                 txt: 'More...',
              //                 fontSize: 8.sp,
              //                 fontWeight: FontWeight.bold,
              //                 fontColor: whiteColor,
              //               ),
              //               Image.asset(
              //                 'assets/images/bt.png',
              //                 color: whiteColor,
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
            right: MediaQuery.of(context).size.width * 0.3,
            top: 0,
            child: Image.asset(
              'assets/images/DOG.png',
              height: 200.h,
              width: 140.w,
              fit: BoxFit.fill,
            )),
        Positioned(
            right: 25.w,
            left: 30.w,
            top: 30.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 90.h,
                      width: 30.w,
                      fit: BoxFit.fill,
                    )),
                // Image.asset('assets/images/logo.png'),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtherView()));
                    },
                    child: Image.asset('assets/images/menu.png')),
              ],
            ))
      ],
    );
  }

  Widget _mainItem(txt, img) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 110.h,
            width: 160.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  txt: txt,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                Image.asset('assets/images/bt.png')
              ],
            ),
          ),
          img == null || img == ''
              ? Container(
                  height: 0,
                  width: 0,
                )
              : Image.network(
                  '${img}',
                  height: 120.h,
                  width: 100.w,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                )
        ],
      ),
    );
  }

  Widget _mainItem1(txt, img) {
    return Container(
      // margin: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 110.h,
            width: 92.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  txt: txt,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                ),
                Image.asset('assets/images/bt.png')
              ],
            ),
          ),
          img == null || img == ''
              ? Container(
                  height: 0,
                  width: 0,
                )
              : Image.network(
                  '${img}',
                  height: 100.h,
                  width: 50.w,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                )
        ],
      ),
    );
  }
}
