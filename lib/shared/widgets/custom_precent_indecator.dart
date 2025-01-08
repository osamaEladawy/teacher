import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomPercentIndicator extends StatelessWidget {
  final double percentage;
  final Widget? center;
  final Widget? footer;
  final Color backgroundColor;
  const CustomPercentIndicator({
    super.key,
    this.percentage = 0.0,
    this.center,
    this.footer,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor: backgroundColor,
      progressColor: ColorResources.primaryColor,
      animation: true,
      animationDuration: 1200,
      percent: percentage,
      radius: 35.sp,
      center: center,
      footer: footer,
    );
  }
}
