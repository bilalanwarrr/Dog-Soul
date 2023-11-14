import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../../widgets/CustomText.dart';

import '../ContactView/ContactView.dart';
import '../PrivacyView/PrivacyView.dart';

class TabletView extends StatefulWidget {
  const TabletView({Key? key}) : super(key: key);

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation.index == 0
              ? _portraitView(orientation.index)
              : _landscapeView(orientation.index);
        },
      ),
    );
  }

  Widget _portraitView(orientation) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset('assets/images/pattern2.png'),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image.asset('assets/images/logo2.png'),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            'assets/logo.png',
                            height: 70.h,
                            width: 45.w,
                            fit: BoxFit.fill,
                          )),
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset('assets/images/close.png')),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 40.w,
                        leading: Image.asset('assets/images/chat.png', color: blackColor,),
                        title: CustomText(
                          txt: 'Contact',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactView()));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap: 40.w,
                        leading: Image.asset('assets/images/resources.png'),
                        title: CustomText(
                          txt: 'Privacy Policy',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyView()));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Image.asset('assets/images/pattern2.png', height: 300.h,),
          ),
          Positioned(
              right: -150.w,
              bottom: 0.h,
              child: Image.asset(
                'assets/images/DOG1.png',
                height: 250.h,
                width: 450.w,
              )),
        ],
      ),
    );
  }

  Widget _landscapeView(orientation) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset('assets/images/pattern2.png'),
          Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image.asset('assets/images/logo2.png'),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 100.h,
                          width: 40.w,
                          fit: BoxFit.fill,
                        )),
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset('assets/images/close.png')),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    ListTile(
                      horizontalTitleGap: 40.w,
                      leading: Image.asset('assets/images/chat.png', color: blackColor,),
                      title: CustomText(
                        txt: 'Contact',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ContactView()));
                      },
                    ),
                    ListTile(
                      horizontalTitleGap: 40.w,
                      leading: Image.asset('assets/images/resources.png'),
                      title: CustomText(
                        txt: 'Privacy Policy',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyView()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child:         Image.asset('assets/images/pattern2.png',),
          // ),
          // Positioned(
          //     right: -100.w,
          //     bottom: 0.h,
          //     child: Image.asset(
          //       'assets/images/DOG1.png',
          //       height: 250.h,
          //       width: 450.w,
          //     )),
        ],
      ),
    );
  }
}