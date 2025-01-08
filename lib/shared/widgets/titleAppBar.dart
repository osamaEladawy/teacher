import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/resources/color_resources.dart';

import '../classes/text_style.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.textStyle(
        appFontSize: 20.sp,
        color: ColorResources.primaryColor,
        appFontWeight: FontWeight.w600,
        appFontHeight: 24.2.sp,
      ),
    );
  }
}
