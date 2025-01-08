import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomTitleStudents extends StatelessWidget {
  const CustomTitleStudents({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.textStyle(
        appFontSize: 16.sp,
        appFontHeight: 19.36.sp,
        appFontWeight: FontWeight.w500,
        color: ColorResources.blackColor,
      ),
    );
  }
}
