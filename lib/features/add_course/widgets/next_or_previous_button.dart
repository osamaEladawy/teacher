import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class NextOrPreviousButton extends StatelessWidget {
  const NextOrPreviousButton({
    super.key,
    required this.title,
    required this.isNext,
    this.onTap,
  });
  final String title;
  final bool isNext;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 33.h,
        // width: 87.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isNext
              ? ColorResources.primaryColor
              : ColorResources.blackColor.withOpacity(0.05),
        ),
        child: Text(
          title,
          style: AppTextStyle.textStyle(
            appFontSize: 14.sp,
            appFontHeight: 16.94.sp,
            appFontWeight: FontWeight.w500,
            color:
                isNext ? ColorResources.whiteColor : ColorResources.blackColor,
          ),
        ),
      ),
    );
  }
}
