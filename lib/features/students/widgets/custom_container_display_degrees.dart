import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/students/cubit/students_cubit.dart';
import 'package:teacher/features/students/models/answers_model.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/widgets/liner_precent_indecator.dart';

class CustomContainerDisplayDegrees extends StatelessWidget {
  const CustomContainerDisplayDegrees({super.key});

  @override
  Widget build(BuildContext context) {
    print(StudentsCubit.instance.exams);
    return BlocBuilder<StudentsCubit, StudentsState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: StudentsCubit.instance.exams.length,
            itemBuilder: (context, index) => Container(
              height: StudentsCubit.instance.isClickOnArrowDown ? 556.h : 120.h,
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
                        StudentsCubit.instance.exams[index].name,
                        style: AppTextStyle.textStyle(
                          appFontSize: 14.sp,
                          appFontHeight: 16.94.sp,
                          appFontWeight: FontWeight.w600,
                          color: ColorResources.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  CustomLinerPercentIndicator(),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "65%",
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
                      GestureDetector(
                        onTap: () {
                          StudentsCubit.instance.displayAnswers();
                        },
                        child: SvgPicture.asset(
                          StudentsCubit.instance.isClickOnArrowDown
                              ? IconsResources.arrowDown2
                              : IconsResources.arrowLeft,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  if (StudentsCubit.instance.currentIndex == index &&
                      StudentsCubit.instance.isClickOnArrowDown)
                    Column(
                      children: [
                        Text(
                          StudentsCubit
                              .instance.exams[index].answers[index].name,
                        ),
                      ],
                    ),
                  CustomWidget(
                    answers: StudentsCubit.instance.exams[index].answers,
                  ),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: 16.h),
          ),
        );
      },
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key, required this.answers});
  final List<AnswersModel> answers;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: answers.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorResources.blackColor.withOpacity(0.10),
                  width: 1.w,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  answers[index].name,
                  style: AppTextStyle.textStyle(
                    appFontSize: 12.sp,
                    appFontHeight: 14.52.sp,
                    appFontWeight: FontWeight.w400,
                    color: ColorResources.blackColor,
                  ),
                ),
                Container(
                  height: 24.w,
                  width: 24.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: Color(0xff3C7098),
                  ),
                  child: Text(
                    answers[index].type,
                    style: AppTextStyle.textStyle(
                      appFontSize: 10.sp,
                      appFontHeight: 12.1.sp,
                      appFontWeight: FontWeight.w400,
                      color: ColorResources.whiteColor,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  answers[index].mark,
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 8.h),
      ),
    );
  }
}
