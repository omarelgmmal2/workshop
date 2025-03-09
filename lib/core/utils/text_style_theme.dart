import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';
import 'font_weight_helper.dart';

class TextStyleTheme {

  static TextStyle textStyle32SemiBold = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.black,
  );

  static TextStyle textStyle26Bold = GoogleFonts.poppins(
    fontSize: 26.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.primary,
  );

  static TextStyle textStyle30Bold = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.primary,
  );

  static TextStyle textStyle18SemiBold = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.white,
  );

  static TextStyle textStyle16SemiBold = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.black,
  );

  static TextStyle textStyle32medium = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );

  static TextStyle textStyle16Regular = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.black,
  );

  static TextStyle textStyle14SemiBold = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.black,
  );

  static TextStyle textStyle14Regular = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.primary,
  );

  static TextStyle textStyle18medium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );

  static TextStyle textStyle13medium = GoogleFonts.poppins(
    color: AppColor.primary,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle textStyle12regular = GoogleFonts.poppins(
    color: AppColor.black,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
  );

}