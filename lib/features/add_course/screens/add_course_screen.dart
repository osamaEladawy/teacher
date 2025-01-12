import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/add_course/screens/content_course_screen.dart';
import 'package:teacher/features/add_course/widgets/custom_container_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_drop_list_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_text_field_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_title_add_course.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/extentions/navigations.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/widgets/build_button_widget.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Container(
        height: 388.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: ColorResources.whiteColor,
        ),
        child: Column(
          children: [
            Text(
              tr.enterCourseContent,
              style: AppTextStyle.textStyle(
                isPlusJakartaSans: true,
                appFontSize: 20.sp,
                appFontHeight: 25.2.sp,
                appFontWeight: FontWeight.w600,
                color: ColorResources.primaryColor,
              ),
            ),
            SizedBox(height: 16.h),
            CustomContainerAddCourse(
              child: Row(
                children: [
                  CustomTitleAddCourse(title: "${tr.educationalMaterial}:"),
                  SizedBox(width: 8.w),
                  CustomTextFieldAddCourse(
                    hintText: tr.enterTheNameOfTheEducationalMaterial,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.w),
            CustomContainerAddCourse(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTitleAddCourse(title: "${tr.duration}:"),
                      SizedBox(width: 8.w),
                      CustomDropListAddCourse(
                        initialValue: "شهر",
                        items: [
                          "شهر",
                          "شهرين",
                          "3 أشهر",
                          "4 أشهر",
                          "5 أشهر",
                          "6 أشهر",
                          "7 أشهر",
                          "8 أشهر",
                          "9 أشهر",
                          "10 أشهر",
                          "11 أشهر",
                          "12 أشهر",
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      CustomTitleAddCourse(title: "${tr.from}:"),
                      SizedBox(width: 8.w),
                      CustomDropListAddCourse(
                        isMine: true,
                        initialValue: "4/29/2024",
                        items: ["4/29/2024", "5/29/2024"],
                      ),
                      SizedBox(width: 8.w),
                      CustomTitleAddCourse(title: "${tr.to}:"),
                      SizedBox(width: 8.w),
                      CustomDropListAddCourse(
                        isMine: true,
                        initialValue: "5/29/2024",
                        items: ["4/29/2024", "5/29/2024"],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.w),
            CustomContainerAddCourse(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTitleAddCourse(title: "${tr.numberOfDays}:"),
                      SizedBox(width: 8.w),
                      CustomDropListAddCourse(
                        initialValue: "2",
                        items: [
                          "1",
                          "2",
                          "3",
                          "4",
                          "5",
                          "6",
                          "7",
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Row(
                    children: [
                      CustomTextFieldAddCourse(
                        isMine: true,
                        hintText: tr.sunday,
                      ),
                      SizedBox(width: 8.w),
                      CustomDropListAddCourse(
                        // isMine: true,
                        initialValue: "2:00 مساء",
                        items: [
                          "2:00 مساء",
                          "4:00 مساء",
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.w),
                  Row(
                    children: [
                      CustomTextFieldAddCourse(
                        isMine: true,
                        hintText: tr.enterToday,
                      ),
                      SizedBox(width: 8.w),
                      CustomDropListAddCourse(
                        //isMine: true,
                        initialValue: "4:00 مساء",
                        items: [
                          "2:00 مساء",
                          "4:00 مساء",
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 33.h,
              width: 310.w,
              child: BuildButtonWidget(
                txt: tr.next,
                onTap: () {
                  context.pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ContentCourseScreen();
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
