import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/add_course/cubit/add_course_cubit.dart';
import 'package:teacher/features/add_course/widgets/custom_container_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_drop_list_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_text_field_add_course.dart';
import 'package:teacher/features/add_course/widgets/custom_title_add_course.dart';
import 'package:teacher/features/add_course/widgets/next_or_previous_button.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/extentions/navigations.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class AddTestScreen extends StatelessWidget {
  const AddTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCourseCubit, AddCourseState>(
      builder: (context, state) {
        return PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: AddCourseCubit.instance.instanceController,
          itemCount: AddCourseCubit.instance.tests.length,
          onPageChanged: (page) {
            AddCourseCubit.instance.setIndex(page);
          },
          itemBuilder: (context, index) {
            return Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Container(
                height: 570.h,
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 16.h,
                  bottom: 16.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorResources.whiteColor,
                ),
                child: Column(
                  children: [
                    Text(
                      AddCourseCubit.instance.tests[index].title,
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
                          CustomTitleAddCourse(title: "${tr.numberOfTests}:"),
                          SizedBox(width: 8.w),
                          CustomDropListAddCourse(
                            initialValue: "4",
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
                    SizedBox(height: 8.h),
                    CustomContainerAddCourse(
                      child: Column(
                        children: [
                          Text(
                            "الاختبار الاول",
                            style: AppTextStyle.textStyle(
                              isPlusJakartaSans: true,
                              appFontSize: 14.sp,
                              appFontHeight: 17.64.sp,
                              appFontWeight: FontWeight.w600,
                              color: ColorResources.primaryColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              CustomTitleAddCourse(
                                  isAddText: true,
                                  title: "${tr.theAppointment}:"),
                              SizedBox(width: 8.w),
                              CustomDropListAddCourse(
                                isMine: true,
                                initialValue: "4/29/2024",
                                items: ["4/29/2024", "5/29/2024"],
                              ),
                              SizedBox(width: 8.w),
                              CustomTitleAddCourse(
                                isAddText: true,
                                title: "${tr.time}:",
                              ),
                              SizedBox(width: 8.w),
                              CustomDropListAddCourse(
                                isMine: true,
                                initialValue: "5/29/2024",
                                items: ["4/29/2024", "5/29/2024"],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.primaryColor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              children: [
                                CustomTitleAddCourse(
                                    isAddText: true,
                                    isColor: true,
                                    title: "${tr.testDuration}:"),
                                SizedBox(width: 8.w),
                                CustomDropListAddCourse(
                                  isAddText: true,
                                  initialValue: "1:00:00",
                                  items: [
                                    "1:00:00",
                                    "2:00:00",
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.w),
                          Row(
                            children: [
                              CustomTitleAddCourse(
                                  title: "${tr.numberOfQuestions}:"),
                              SizedBox(width: 8.w),
                              CustomDropListAddCourse(
                                initialValue: "18",
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
                                  "12 ",
                                  "13 ",
                                  "14 ",
                                  "15 ",
                                  "16 ",
                                  "17 ",
                                  "18 ",
                                  "19 ",
                                  "20 ",
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              CustomTitleAddCourse(
                                  title: "${tr.enterQuestion}:"),
                              SizedBox(width: 8.w),
                              CustomTextFieldAddCourse(
                                isAddTest: true,
                                hintText: tr.writeQuestionHere,
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Image.asset(
                            AddCourseCubit.instance.tests[index].image,
                            height: 124.h,
                            width: 294.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SmoothPageIndicator(
                      controller: AddCourseCubit
                          .instance.instanceController, // PageController
                      count: AddCourseCubit.instance.tests.length,
                      effect: WormEffect(
                        activeDotColor: ColorResources.primaryColor,
                        dotColor: Color(0xFFD9D9D9),
                      ), // your preferred effect
                      onDotClicked: (index) {
                        AddCourseCubit.instance.setControllerAddTest(index);
                      },
                    ),
                    SizedBox(height: 16.h),
                    AddCourseCubit.instance.addTestIndex == 3
                        ? NextOrPreviousButton(
                            onTap: () {
                              context.pop();
                            },
                            isNext: true,
                            title: tr.goToTheNextTest,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NextOrPreviousButton(
                                onTap: () {
                                  AddCourseCubit.instance.backToPageAddTest();
                                },
                                isNext: AddCourseCubit.instance.addTestIndex > 0
                                    ? true
                                    : false,
                                title: tr.thePrevious,
                              ),
                              NextOrPreviousButton(
                                onTap: () {
                                  AddCourseCubit.instance.nextPageAddText();
                                },
                                isNext: true,
                                title: AddCourseCubit.instance.addTestIndex == 2
                                    ? tr.complete
                                    : tr.next,
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
