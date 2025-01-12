import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomMyPercentResult extends StatelessWidget {
  const CustomMyPercentResult({
    super.key,
    this.number = 0,
    this.title = '',
    this.isColor = false,
    required this.percent,
    this.isSingleWidget = false,
    required this.radius,
  });
  final int number;
  final String title;
  final bool isColor;
  final double percent;
  final double radius;
  final bool isSingleWidget;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: 8.0,
      percent: percent,
      center: isSingleWidget
          ? Text(
              "${80}0%",
              style: AppTextStyle.textStyle(
                  appFontSize: 16.sp,
                  appFontHeight: 20.16.sp,
                  appFontWeight: FontWeight.w700,
                  color: ColorResources.primaryColor),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isColor ? '%$number' : "$number",
                  style: AppTextStyle.textStyle(
                    isPlusJakartaSans: true,
                    appFontSize: 40.sp,
                    appFontHeight: 50.4.sp,
                    appFontWeight: FontWeight.w700,
                    color: isColor
                        ? ColorResources.greenColor
                        : ColorResources.primaryColor,
                  ),
                ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyle(
                    isPlusJakartaSans: true,
                    appFontSize: 10.sp,
                    appFontHeight: 12.6.sp,
                    appFontWeight: FontWeight.w700,
                    color: isColor
                        ? ColorResources.greenColor
                        : ColorResources.primaryColor,
                  ),
                ),
              ],
            ),
      backgroundColor: isColor
          ? ColorResources.greenColor.withOpacity(0.10)
          : ColorResources.primaryColor.withOpacity(0.10),
      progressColor:
          isColor ? ColorResources.greenColor : ColorResources.primaryColor,
    );
  }
}
