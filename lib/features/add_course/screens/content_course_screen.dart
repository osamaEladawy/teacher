import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/add_course/cubit/add_course_cubit.dart';
import 'package:teacher/features/add_course/screens/add_test_screen.dart';
import 'package:teacher/features/add_course/widgets/custom_container_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_drop_list_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_title_add_course.dart';
import 'package:teacher/features/add_course/widgets/next_or_previous_button.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/extentions/navigations.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class ContentCourseScreen extends StatelessWidget {
  const ContentCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCourseCubit, AddCourseState>(
      builder: (context, state) {
        return PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: AddCourseCubit.instance.instanceController,
          itemCount: AddCourseCubit.instance.courses.length,
          onPageChanged: (page) {
            AddCourseCubit.instance.setIndex(page);
          },
          itemBuilder: (context, index) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Container(
                height: 415.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorResources.whiteColor,
                ),
                child: Column(
                  children: [
                    Text(
                      AddCourseCubit.instance.courses[index].title,
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
                          CustomTitleAddCourse(
                              title:
                                  "${AddCourseCubit.instance.courses[index].subtitle}:"),
                          SizedBox(width: 8.w),
                          CustomDropListAddCourse(
                            initialValue: "8",
                            items: [
                              "1",
                              "2",
                              "3 ",
                              "4 ",
                              "5 ",
                              "6 ",
                              "7 ",
                              "8 ",
                              "9 ",
                              "10 ",
                              "11 ",
                              "12 ",
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Image.asset(
                      AddCourseCubit.instance.courses[index].image,
                    ),
                    SizedBox(height: 12.h),
                    SmoothPageIndicator(
                      controller: AddCourseCubit
                          .instance.instanceController, // PageController
                      count: AddCourseCubit.instance.courses.length,
                      effect: WormEffect(
                        activeDotColor: ColorResources.primaryColor,
                        dotColor: Color(0xFFD9D9D9),
                      ), // your preferred effect
                      onDotClicked: (index) {
                        AddCourseCubit.instance.setController(index);
                      },
                    ),
                    SizedBox(height: 12.h),
                    AddCourseCubit.instance.currentIndex == 2
                        ? NextOrPreviousButton(
                            onTap: () {
                              context.pop();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AddTestScreen();
                                  });
                            },
                            isNext: true,
                            title: tr.complete,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NextOrPreviousButton(
                                onTap: () {
                                  AddCourseCubit.instance.backToPage();
                                },
                                isNext: AddCourseCubit.instance.currentIndex > 0
                                    ? true
                                    : false,
                                title: tr.thePrevious,
                              ),
                              NextOrPreviousButton(
                                onTap: () {
                                  AddCourseCubit.instance.nextPage();
                                },
                                isNext: true,
                                title: tr.next,
                              ),
                            ],
                          )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
