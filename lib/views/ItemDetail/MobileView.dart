import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunter/provider/dataProvider.dart';
import 'package:hunter/views/VideoView.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:hunter/views/PdfDocViewer.dart';
import 'package:path_provider/path_provider.dart';

import '../../constant.dart';
import '../../widgets/CustomText.dart';
import '../Other/OtherView.dart';
import 'package:provider/provider.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class MobileView extends StatefulWidget {
  const MobileView({Key? key, required this.uid, required this.title})
      : super(key: key);

  final String title;
  final int uid;

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  bool _videos = true;

  generateThumbnail(url) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.PNG,
      quality: 100,
    );

    return fileName;
  }
  

  @override
  Widget build(BuildContext context) {
    var dataPro = Provider.of<DataProvider>(context);
    

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/images/pattern2.png'))),
            child: MediaQuery.of(context).orientation.index == 0
                ? _portraitView(MediaQuery.of(context).orientation.index,
                    dataPro.videoList, dataPro.docsList)
                : _landscapeView(MediaQuery.of(context).orientation.index,
                    dataPro.videoList, dataPro.docsList),
          ),
        ),
      ),
    );
  }

  Widget _portraitView(orientation, videosList, docsList) {
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
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: blackColor,
                          size: 22.sp,
                        )),
                    SizedBox(
                      width: 30.w,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 65.h,
                          width: 65.w,
                          fit: BoxFit.fill,
                        )),
                    // Image.asset('assets/images/logo2.png'),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtherView()));
                    },
                    child: Image.asset('assets/images/menu.png')),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            child: Column(
              children: [
                CustomText(
                  txt: '${widget.title}',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _videos = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: _videos == true
                                  ? whiteColor
                                  : lightBackgroundColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: _videos == true
                                      ? primaryColor
                                      : Colors.transparent),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor
                                      .withOpacity(_videos == true ? 0.1 : 0),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_circle_outline,
                                color:
                                    _videos == true ? primaryColor : blackColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                txt: 'Videos',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                fontColor:
                                    _videos == true ? primaryColor : blackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _videos = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: _videos == false
                                  ? whiteColor
                                  : lightBackgroundColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: _videos == false
                                      ? primaryColor
                                      : Colors.transparent),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor
                                      .withOpacity(_videos == false ? 0.1 : 0),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sticky_note_2_outlined,
                                color:
                                    _videos == false ? primaryColor : blackColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                txt: 'Documents',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                fontColor:
                                    _videos == false ? primaryColor : blackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    itemCount: _videos == true
                        ? videosList
                            .where((v) => v.get('category') == widget.uid)
                            .length
                        : docsList
                            .where((d) => d.get('category') == widget.uid)
                            .length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 400.h),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var vd = _videos == true
                          ? videosList
                              .where((v) => v.get('category') == widget.uid)
                              .toList()[index]
                          : docsList
                              .where((d) => d.get('category') == widget.uid)
                              .toList()[index];
    
                      return _videos == true
                          ? FutureBuilder(
                              future: generateThumbnail(vd.get('video')),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200.h,
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.r),
                                        color: Colors.grey.shade200),
                                    child: Center(
                                      child: SizedBox(
                                          height: 30.h,
                                          width: 28.w,
                                          child: CircularProgressIndicator(
                                            color: blackColor,
                                          )),
                                    ),
                                  );
                                } else {
                                  return Stack(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideosView(
                                                          path:
                                                              vd.get('video'))));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 220.h,
                                          margin: EdgeInsets.only(bottom: 10.h),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12.r),
                                                  child: Image.file(
                                                    File(
                                                        snapshot.data.toString()),
                                                    width: double.infinity,
                                                    fit: BoxFit.fill,
                                                  )),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 35.h,
                                                  width: 35.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: whiteColor
                                                          .withOpacity(0.3)),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 30.h,
                                          left: 20.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                txt: vd.get('title'),
                                                fontWeight: FontWeight.bold,
                                                fontColor: whiteColor,
                                                fontSize: 12.sp,
                                              ),
                                              CustomText(
                                                txt: vd.get('desc'),
                                                fontWeight: FontWeight.normal,
                                                fontColor: whiteColor,
                                                fontSize: 10.sp,
                                              ),
                                            ],
                                          ))
                                    ],
                                  );
                                }
                              })
                          : Container(
                              height: 150.h,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade500,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${vd.get('cover')}'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          txt: '${vd.get('title')}',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                        ),
                                        CustomText(
                                            txt: '${vd.get('desc')}',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () async {
                                            PDFDocument doc =
                                                await PDFDocument.fromURL(
                                                    '${vd.get('file')}');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PdfDocViewer(
                                                            document: doc)));
                                          },
                                          child: Container(
                                            height: 60.h,
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(12.r)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                    txt: 'Discover',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp),
                                                Image.asset(
                                                    'assets/images/bt.png')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }),
                    SizedBox(height: 50,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _landscapeView(orientation, videosList, docsList) {
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
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: blackColor,
                          size: 14.sp,
                        )),
                    SizedBox(
                      width: 30.w,
                    ),
                    // Image.asset('assets/images/logo2.png'),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 70.h,
                          width: 45.w,
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtherView()));
                    },
                    child: Image.asset('assets/images/menu.png')),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r))),
            child: Column(
              children: [
                CustomText(
                  txt: '${widget.title}',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _videos = true;
                        });
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                            color: _videos == true
                                ? whiteColor
                                : lightBackgroundColor,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor
                                    .withOpacity(_videos == true ? 0.1 : 0),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                                color: _videos == true
                                    ? primaryColor
                                    : Colors.transparent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle_outline,
                              size: 12.sp,
                              color: _videos == true ? primaryColor : blackColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              txt: 'Videos',
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                              fontColor:
                                  _videos == true ? primaryColor : blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _videos = false;
                        });
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                            color: _videos == false
                                ? whiteColor
                                : lightBackgroundColor,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor
                                    .withOpacity(_videos == false ? 0.1 : 0),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                                color: _videos == false
                                    ? primaryColor
                                    : Colors.transparent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sticky_note_2_outlined,
                              size: 12.sp,
                              color: _videos == false ? primaryColor : blackColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              txt: 'Documents',
                              fontSize: 8.sp,
                              fontWeight: FontWeight.bold,
                              fontColor:
                                  _videos == false ? primaryColor : blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _videos == true
                    ? GridView.builder(
                        itemCount: videosList
                            .where((v) => v.get('category') == widget.uid)
                            .length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 20.h, bottom: 300.h),
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.h,
                            childAspectRatio: 1.8),
                        itemBuilder: (context, index) {
                          var vd = videosList
                              .where((v) => v.get('category') == widget.uid)
                              .toList()[index];
                      
                          return FutureBuilder(
                              future: generateThumbnail(vd.get('video')),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.r),
                                        color: Colors.grey.shade200),
                                    child: Center(
                                      child: SizedBox(
                                          height: 25.h,
                                          width: 15.w,
                                          child: CircularProgressIndicator(
                                            color: blackColor,
                                          )),
                                    ),
                                  );
                                } else {
                                  return Stack(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => VideosView(
                                                    path: vd.get('video'))));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 220.h,
                                        margin: EdgeInsets.only(bottom: 10.h),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.r),
                                                child: Image.file(
                                                  File(snapshot.data.toString()),
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                )),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: 35.h,
                                                width: 35.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: whiteColor
                                                        .withOpacity(0.3)),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.play_arrow,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(bottom: 25.h, left: 5.w, child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(txt: vd.get('title'), fontWeight: FontWeight.bold, fontColor: whiteColor, fontSize: 6.sp,),
                                        CustomText(txt: vd.get('desc'), fontWeight: FontWeight.normal, fontColor: whiteColor, fontSize: 5.sp,),
                                      ],
                                    ))
                                  ]);
                                }
                              });
                        })
                    : Container(
                        height: 220.h,
                        child: ListView.builder(
                            itemCount: docsList
                                .where((d) => d.get('category') == widget.uid)
                                .length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 20.h),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var vd = docsList
                                  .where((d) => d.get('category') == widget.uid)
                                  .toList()[index];
    
                              return Container(
                                height: 150.h,
                                width: MediaQuery.of(context).size.width * 0.5,
                                margin: EdgeInsets.only(right: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 180.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade500,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  '${vd.get('cover')}'))),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            txt: '${vd.get('title')}',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8.sp,
                                          ),
                                          CustomText(
                                              txt: '${vd.get('desc')}',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 6.sp),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () async {
                                              PDFDocument doc =
                                                  await PDFDocument.fromURL(
                                                      '${vd.get('file')}');
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PdfDocViewer(
                                                              document: doc)));
                                            },
                                            child: Container(
                                              height: 60.h,
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              decoration: BoxDecoration(
                                                  color: whiteColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomText(
                                                      txt: 'Discover',
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 8.sp),
                                                  Image.asset(
                                                      'assets/images/bt.png')
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
