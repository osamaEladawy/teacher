import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher/shared/widgets/custom_myprecent_result.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomMyCardCapabilities extends StatelessWidget {
  const CustomMyCardCapabilities({
    super.key,
    required this.title,
    required this.course,
    required this.hour,
    required this.duration,
    required this.month,
    required this.daysOfWeek,
    required this.icon,
    this.isDegree = false,
  });
  final String title;
  final String course;
  final String hour;
  final String duration;
  final String month;
  final String daysOfWeek;
  final String icon;
  final bool isDegree;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.h,
      width: 310.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: ColorResources.whiteColor,
        borderRadius: BorderRadius.circular(25.r),
        border: isDegree
            ? null
            : Border.all(
                color: ColorResources.primaryColor,
                width: 1.w,
              ),
        boxShadow: [
          BoxShadow(
            color: ColorResources.blackColor.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 2.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // textAlign: TextAlign.center,
                    style: AppTextStyle.textStyle(
                      appFontSize: 18.sp,
                      appFontHeight: 22.68.sp,
                      appFontWeight: FontWeight.w600,
                      color: ColorResources.primaryColor,
                    ),
                  ),
                  Text(
                    course,
                    // textAlign: TextAlign.center,
                    style: AppTextStyle.textStyle(
                      appFontSize: 14.sp,
                      appFontHeight: 17.64.sp,
                      appFontWeight: FontWeight.w500,
                      color: ColorResources.blackColor.withOpacity(0.50),
                    ),
                  ),
                  Text(
                    hour,
                    // textAlign: TextAlign.center,
                    style: AppTextStyle.textStyle(
                      appFontSize: 14.sp,
                      appFontHeight: 17.64.sp,
                      appFontWeight: FontWeight.w500,
                      color: ColorResources.blackColor.withOpacity(0.50),
                    ),
                  ),
                ],
              ),
              Spacer(),
              CustomMyPercentResult(
                radius: 40,
                percent: 0.80,
                isSingleWidget: true,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: 8.w),
              Text(
                duration,
                // textAlign: TextAlign.center,
                style: AppTextStyle.textStyle(
                  appFontSize: 14.sp,
                  appFontHeight: 16.94.sp,
                  appFontWeight: FontWeight.w600,
                  color: ColorResources.blackColor,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                month,
                // textAlign: TextAlign.center,
                style: AppTextStyle.textStyle(
                  appFontSize: 16.sp,
                  appFontHeight: 20.16.sp,
                  appFontWeight: FontWeight.w500,
                  color: ColorResources.blackColor.withOpacity(0.50),
                ),
              ),
              Spacer(),
              Container(
                height: 31.h,
                width: 90.w,
                alignment: Alignment.center,
                //padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: ColorResources.primaryColor.withOpacity(0.05),
                ),
                child: Text(
                  daysOfWeek,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyle(
                    appFontSize: 12.sp,
                    appFontHeight: 15.12.sp,
                    appFontWeight: FontWeight.w500,
                    color: ColorResources.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
