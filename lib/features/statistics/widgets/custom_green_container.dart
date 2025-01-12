import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomGreenContainer extends StatelessWidget {
  const CustomGreenContainer(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: 320.w,
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: ColorResources.greenColor,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.textStyle(
              appFontSize: 16.sp,
              appFontHeight: 19.36.sp,
              appFontWeight: FontWeight.w500,
              color: ColorResources.whiteColor,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            height: 36.h,
            width: 184.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: ColorResources.whiteColor,
            ),
            child: Text(
              subTitle,
              style: AppTextStyle.textStyle(
                appFontSize: 16.sp,
                appFontHeight: 20.16.sp,
                appFontWeight: FontWeight.w600,
                color: ColorResources.greenColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
