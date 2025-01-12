import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher/core/functions/check_for_current_language.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/core/routes/routes.dart';
import 'package:teacher/features/students/cubit/students_cubit.dart';
import 'package:teacher/features/students/widgets/custom_search_text_field.dart';
import 'package:teacher/features/students/widgets/custom_title_students.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/extentions/navigations.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            CustomSearchTextField(hintText: tr.search),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTitleStudents(
                  title: tr.theStudents,
                ),
                CustomTitleStudents(
                  title: tr.organization,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.detailsForStudent,
                          arguments: StudentsCubit.instance.students[index]);
                    },
                    child: Container(
                      height: 97.h,
                      width: 342.w,
                      padding: EdgeInsets.only(
                          top: 8.h, right: 8.w, bottom: 8.h, left: 16.w),
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
                          Image.asset(
                              StudentsCubit.instance.students[index].image),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                StudentsCubit.instance.students[index].name,
                                style: AppTextStyle.textStyle(
                                  appFontSize: 20.sp,
                                  appFontHeight: 25.2.sp,
                                  appFontWeight: FontWeight.w600,
                                  color: ColorResources.blackColor,
                                ),
                              ),
                              Container(
                                //height: 28.h,
                                //width: 84.w,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: ColorResources.primaryColor
                                      .withOpacity(0.10),
                                ),
                                child: Text(
                                  StudentsCubit.instance.students[index]
                                      .educationalStage,
                                  style: AppTextStyle.textStyle(
                                    appFontSize: 16.sp,
                                    appFontHeight: 20.16.sp,
                                    appFontWeight: FontWeight.w500,
                                    color: ColorResources.blackColor
                                        .withOpacity(0.60),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          isArabic
                              ? SvgPicture.asset(IconsResources.arrowLeft)
                              : SvgPicture.asset(
                                  IconsResources.arrowRight,
                                  color: ColorResources.primaryColor,
                                ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemCount: StudentsCubit.instance.students.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
