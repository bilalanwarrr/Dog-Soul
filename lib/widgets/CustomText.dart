import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunter/constant.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key,
      required this.txt,
      this.fontWeight,
      this.fontColor = blackColor,
      this.fontSize, this.textAlign = TextAlign.left})
      : super(key: key);

  final String txt;
  FontWeight? fontWeight = FontWeight.w500;
  double? fontSize = 14.sp;
  final Color fontColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: textAlign,
      style: GoogleFonts.oxygen(
          textStyle: TextStyle(
              fontWeight: fontWeight, fontSize: fontSize, color: fontColor)),
    );
  }
}
