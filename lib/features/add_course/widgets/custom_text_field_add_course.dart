import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomTextFieldAddCourse extends StatelessWidget {
  const CustomTextFieldAddCourse({
    super.key,
    this.hintText,
    this.isMine = false,
    this.isAddTest = false,
  });
  final String? hintText;
  final bool isMine;
  final bool isAddTest;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: isAddTest ? 45.h : 32.h,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
            hintText: hintText,
            hintStyle: AppTextStyle.textStyle(
              appFontSize: 10.sp,
              appFontHeight: 12.6.sp,
              appFontWeight: FontWeight.w500,
              color: ColorResources.blackColor.withOpacity(0.50),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: ColorResources.blackColor.withOpacity(0.05),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: ColorResources.blackColor.withOpacity(0.05),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(
                color: ColorResources.blackColor.withOpacity(0.05),
              ),
            ),
            fillColor: ColorResources.whiteColor,
            filled: true,
          ),
        ),
      ),
    );
  }
}
