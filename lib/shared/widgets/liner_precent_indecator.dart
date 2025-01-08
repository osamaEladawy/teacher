import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomLinerPercentIndicator extends StatelessWidget {
  const CustomLinerPercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1200,
      width: 270.w,
      lineHeight: 6.h,
      barRadius: Radius.circular(5.r),
      linearStrokeCap: LinearStrokeCap.roundAll,
      percent: 0.8,
      isRTL: true,
      backgroundColor: Colors.grey.shade400,
      progressColor: ColorResources.greenColor,
    );
  }
}
