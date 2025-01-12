import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/classes/responsive_screen.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/home/models/course_model.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class DisplayCourses extends StatelessWidget {
  const DisplayCourses({super.key, required this.courses});
  final CourseModel courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97.h,
      width: 342.w,
      //alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8.h, right: 8.w, bottom: 8.h, left: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: ColorResources.whiteColor,
        border: Border.all(
          color: ColorResources.primaryColor,
          width: 1.5.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(courses.imageUrl!),
          SizedBox(width: 16.w),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveScreen.width - 170,
              minWidth: ResponsiveScreen.width - 170,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      courses.title!,
                      style: AppTextStyle.textStyle(
                          appFontSize: 18.sp,
                          appFontHeight: 22.68.sp,
                          appFontWeight: FontWeight.w600,
                          color: ColorResources.primaryColor),
                    ),
                    Container(
                      //height: 28.h,
                      //width: 73.w,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorResources.primaryColor.withOpacity(0.10),
                      ),
                      child: Text(
                        "${courses.students} ${tr.student}",
                        style: AppTextStyle.textStyle(
                          appFontSize: 14.sp,
                          appFontHeight: 17.64.sp,
                          appFontWeight: FontWeight.w500,
                          color: ColorResources.blackColor.withOpacity(0.50),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  courses.description!,
                  style: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontHeight: 17.64.sp,
                    appFontWeight: FontWeight.w500,
                    color: ColorResources.blackColor.withOpacity(0.50),
                  ),
                ),
                Text(
                  tr.hour,
                  style: AppTextStyle.textStyle(
                    appFontSize: 14.sp,
                    appFontHeight: 17.64.sp,
                    appFontWeight: FontWeight.w500,
                    color: ColorResources.blackColor.withOpacity(0.50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
