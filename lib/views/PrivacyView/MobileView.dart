import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../../widgets/CustomText.dart';
class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/pattern2.png'))),
          child: MediaQuery.of(context).orientation.index == 0
              ? _portraitView(MediaQuery.of(context).orientation.index)
              : _landscapeView(MediaQuery.of(context).orientation.index),
        ),
      ),
    );
  }

  Widget _portraitView(orientation) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios, color: blackColor, size: 22.sp,)),
                    SizedBox(width: 30.w,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset('assets/logo.png', height: 65.h,
                        width: 65.w,
                        fit: BoxFit.fill,),
                    ),
                  ],
                ),

                // GestureDetector(
                //     onTap: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => OtherView()));
                //     }, child: Image.asset('assets/images/menu.png')),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w,),
            decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            child: CustomText(txt: privacyTxt, fontSize: 14.sp,),
          ),
        ],
      ),
    );
  }

  Widget _landscapeView(orientation) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios, color: blackColor, size: 14.sp,)),
                    SizedBox(width: 30.w,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset('assets/logo.png', height: 70.h,
                        width: 45.w,
                        fit: BoxFit.fill,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: lightBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r))),
              child: CustomText(txt: privacyTxt, fontSize: 8.sp,)
          ),
        ],
      ),
    );
  }
}
