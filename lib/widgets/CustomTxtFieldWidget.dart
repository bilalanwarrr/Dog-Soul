import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hunter/constant.dart';

class CustomTxtFieldWidget extends StatelessWidget {
  const CustomTxtFieldWidget({Key? key, required this.hintTxt, required this.txt}) : super(key: key);

  final String hintTxt;
  final TextEditingController txt;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txt,
      decoration: InputDecoration(
          hintText: hintTxt,
          filled: true,
          fillColor: whiteColor,
          hintStyle: GoogleFonts.manrope(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: lightBackgroundColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: whiteColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: whiteColor)
          )
      ),
    );
  }
}
