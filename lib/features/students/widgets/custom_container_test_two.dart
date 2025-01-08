import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/widgets/liner_precent_indecator.dart';

class CustomContainerTestTwo extends StatelessWidget {
  const CustomContainerTestTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117.h,
      width: 310.w,
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          width: 1.w,
          color: ColorResources.primaryColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(IconsResources.test),
              SizedBox(width: 8.w),
              Text(
                "${tr.test} 2",
                style: AppTextStyle.textStyle(
                  appFontSize: 14.sp,
                  appFontHeight: 16.94.sp,
                  appFontWeight: FontWeight.w600,
                  color: ColorResources.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomLinerPercentIndicator(),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "80%",
                style: AppTextStyle.textStyle(
                  appFontSize: 10.sp,
                  appFontHeight: 12.6.sp,
                  appFontWeight: FontWeight.w500,
                  color: ColorResources.greenColor,
                ),
              ),
              Text(
                '100% من',
                style: AppTextStyle.textStyle(
                  appFontSize: 10.sp,
                  appFontHeight: 12.6.sp,
                  appFontWeight: FontWeight.w500,
                  color: ColorResources.greenColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr.answers,
                style: AppTextStyle.textStyle(
                  appFontSize: 14.sp,
                  appFontHeight: 16.94.sp,
                  appFontWeight: FontWeight.w600,
                  color: ColorResources.primaryColor,
                ),
              ),
              SvgPicture.asset(IconsResources.arrowDown2),
            ],
          ),
        ],
      ),
    );
  }
}
