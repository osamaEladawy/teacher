import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/functions/check_for_current_language.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/profile/widgets/custom_hint_container.dart';
import 'package:teacher/shared/widgets/custom_myprecent_result.dart';
import 'package:teacher/features/profile/widgets/custom_row_to_display_info.dart';
import 'package:teacher/features/profile/widgets/custom_row_under_liner_precent.dart';
import 'package:teacher/features/profile/widgets/text_begin_course.dart';
import 'package:teacher/features/statistics/cubit/statistics_cubit.dart';
import 'package:teacher/features/statistics/widgets/custom_green_container.dart';
import 'package:teacher/features/students/widgets/details/custom_container_display_students_or_degree.dart';
import 'package:teacher/features/students/widgets/details/select_title_to_details.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/widgets/custom_card_dailog.dart';
import 'package:teacher/shared/widgets/liner_precent_indecator.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StatisticsCubit, StatisticsState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 22.w),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  CustomContainerDisplayStudentsOrDegree(
                    child: Row(
                      children: [
                        ...List.generate(StatisticsCubit.instance.words.length,
                            (index) {
                          return SelectTitleToDetails(
                            currentIndex: StatisticsCubit.instance.currentIndex,
                            onTap: () {
                              StatisticsCubit.instance.selectCard(index);
                            },
                            title: StatisticsCubit.instance.words[index]
                                ['title'],
                            image: StatisticsCubit.instance.words[index]
                                ['imageUrl'],
                            colorContainer:
                                StatisticsCubit.instance.currentIndex == index
                                    ? ColorResources.primaryColor
                                    : ColorResources.whiteColor,
                            colorText:
                                StatisticsCubit.instance.currentIndex == index
                                    ? ColorResources.whiteColor
                                    : ColorResources.primaryColor,
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  if (StatisticsCubit.instance.currentIndex == 0)
                    SingleChildScrollView(
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            // First custom card dialog
                            CustomCardDialog(
                              isProfile: true,
                              height: 670.h,
                              child: Column(
                                children: [
                                  SizedBox(height: 16.h),
                                  Text(
                                    tr.capabilities,
                                    style: AppTextStyle.textStyle(
                                        appFontSize: 18.sp,
                                        appFontHeight: 22.68.sp,
                                        appFontWeight: FontWeight.w600,
                                        color: ColorResources.primaryColor),
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomHintContainer(
                                    title: tr.thirdSecondary,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomHintContainer(
                                    widget: CustomRowToDisplayInfo(
                                      title: tr.duration,
                                      subTitle: 'شهرين',
                                      trainingText: 'يومين في الاسبوع',
                                      icon: IconsResources.clock,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ...List.generate(
                                          StatisticsCubit.instance.days.length,
                                          (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            StatisticsCubit.instance
                                                .selectDay1(index);
                                          },
                                          child: Container(
                                            height: 31.h,
                                            width: 151.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: StatisticsCubit.instance
                                                          .currentDay1 ==
                                                      index
                                                  ? ColorResources.primaryColor
                                                  : ColorResources.primaryColor
                                                      .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                            child: Text(
                                              StatisticsCubit
                                                  .instance.days[index],
                                              style: AppTextStyle.textStyle(
                                                appFontSize: 12.sp,
                                                appFontHeight: 15.12.sp,
                                                appFontWeight: FontWeight.w500,
                                                color: StatisticsCubit.instance
                                                            .currentDay1 ==
                                                        index
                                                    ? ColorResources.whiteColor
                                                    : ColorResources
                                                        .primaryColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomHintContainer(
                                    widget: CustomRowToDisplayInfo(
                                      title: tr.theLectures,
                                      subTitle: '',
                                      trainingText: '8 ${tr.lectures}',
                                      icon: IconsResources.note,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 155.h,
                                    width: 330.w,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 16.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                        color: ColorResources.primaryColor
                                            .withOpacity(0.10),
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tr.remainingCourse,
                                          style: AppTextStyle.textStyle(
                                            appFontSize: 12.sp,
                                            appFontHeight: 15.12.sp,
                                            appFontWeight: FontWeight.w500,
                                            color: ColorResources.blackColor
                                                .withOpacity(0.50),
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        CustomLinerPercentIndicator(
                                            percent: 0.65, isProfile: true),
                                        SizedBox(height: 2.h),
                                        CustomRowUnderLinerPercent(
                                          title: '65% ${tr.completed}',
                                          subTitle: '35% ${tr.remaining}',
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          spacing: 10.w,
                                          children: [
                                            TextBeginCourse(
                                              title: tr.from,
                                              subTitle: '4/29/2024',
                                            ),
                                            TextBeginCourse(
                                              title: tr.to,
                                              subTitle: '4/29/2024',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        CustomHintContainer(
                                          title: "2  ${tr.ofTheWeeks}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10.w,
                                    children: [
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.10,
                                        number: StatisticsCubit
                                            .instance.results[0]['number'],
                                        title: StatisticsCubit
                                            .instance.results[0]['title'],
                                      ),
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.25,
                                        number: StatisticsCubit
                                            .instance.results[1]['number'],
                                        title: StatisticsCubit
                                            .instance.results[1]['title'],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10.w,
                                    children: [
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.10,
                                        number: StatisticsCubit
                                            .instance.results[2]['number'],
                                        title: StatisticsCubit
                                            .instance.results[2]['title'],
                                      ),
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.15,
                                        number: StatisticsCubit
                                            .instance.results[3]['number'],
                                        title: StatisticsCubit
                                            .instance.results[3]['title'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Spacing between cards
                            SizedBox(height: 16.h),
                            // Second custom card dialog
                            CustomCardDialog(
                              isProfile: true,
                              height: 670.h,
                              child: Column(
                                children: [
                                  SizedBox(height: 16.h),
                                  Text(
                                    tr.achievement,
                                    style: AppTextStyle.textStyle(
                                      appFontSize: 18.sp,
                                      appFontHeight: 22.68.sp,
                                      appFontWeight: FontWeight.w600,
                                      color: ColorResources.primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomHintContainer(
                                    title: tr.thirdSecondary,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomHintContainer(
                                    widget: CustomRowToDisplayInfo(
                                      title: tr.duration,
                                      subTitle: 'شهرين',
                                      trainingText: 'يومين في الاسبوع',
                                      icon: IconsResources.clock,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ...List.generate(
                                          StatisticsCubit.instance.days.length,
                                          (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            StatisticsCubit.instance
                                                .selectDay2(index);
                                          },
                                          child: Container(
                                            height: 31.h,
                                            width: 151.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: StatisticsCubit.instance
                                                          .currentDay2 ==
                                                      index
                                                  ? ColorResources.primaryColor
                                                  : ColorResources.primaryColor
                                                      .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                            child: Text(
                                              StatisticsCubit
                                                  .instance.days[index],
                                              style: AppTextStyle.textStyle(
                                                appFontSize: 12.sp,
                                                appFontHeight: 15.12.sp,
                                                appFontWeight: FontWeight.w500,
                                                color: StatisticsCubit.instance
                                                            .currentDay2 ==
                                                        index
                                                    ? ColorResources.whiteColor
                                                    : ColorResources
                                                        .primaryColor,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomHintContainer(
                                    widget: CustomRowToDisplayInfo(
                                      title: tr.theLectures,
                                      subTitle: '',
                                      trainingText: '8 ${tr.lectures}',
                                      icon: IconsResources.note,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 155.h,
                                    width: 310.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 16.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                        color: ColorResources.primaryColor
                                            .withOpacity(0.10),
                                        width: 1.w,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tr.remainingCourse,
                                          style: AppTextStyle.textStyle(
                                            appFontSize: 12.sp,
                                            appFontHeight: 15.12.sp,
                                            appFontWeight: FontWeight.w500,
                                            color: ColorResources.blackColor
                                                .withOpacity(0.50),
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        CustomLinerPercentIndicator(
                                            percent: 0.65, isProfile: true),
                                        SizedBox(height: 2.h),
                                        CustomRowUnderLinerPercent(
                                          title: '65% ${tr.completed}',
                                          subTitle: '35% ${tr.remaining}',
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          spacing: 10.w,
                                          children: [
                                            TextBeginCourse(
                                              title: tr.from,
                                              subTitle: '4/29/2024',
                                            ),
                                            TextBeginCourse(
                                              title: tr.to,
                                              subTitle: '4/29/2024',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        CustomHintContainer(
                                          title: "2 ${tr.ofTheWeeks}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10.w,
                                    children: [
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.10,
                                        number: StatisticsCubit
                                            .instance.results[0]['number'],
                                        title: StatisticsCubit
                                            .instance.results[0]['title'],
                                      ),
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.25,
                                        number: StatisticsCubit
                                            .instance.results[1]['number'],
                                        title: StatisticsCubit
                                            .instance.results[1]['title'],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10.w,
                                    children: [
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.10,
                                        number: StatisticsCubit
                                            .instance.results[2]['number'],
                                        title: StatisticsCubit
                                            .instance.results[2]['title'],
                                      ),
                                      CustomMyPercentResult(
                                        radius: 60,
                                        percent: 0.15,
                                        number: StatisticsCubit
                                            .instance.results[3]['number'],
                                        title: StatisticsCubit
                                            .instance.results[3]['title'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (StatisticsCubit.instance.currentIndex == 1)
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomCardDialog(
                            isProfile: true,
                            height: 182.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10.w,
                              children: [
                                CustomMyPercentResult(
                                  radius: isArabic ? 60 : 70,
                                  percent: 0.50,
                                  number: StatisticsCubit.instance.sales[0]
                                      ['number'],
                                  title: StatisticsCubit.instance.sales[0]
                                      ['title'],
                                ),
                                SizedBox(width: 10.w),
                                CustomMyPercentResult(
                                  radius: isArabic ? 60 : 70,
                                  percent: 0.25,
                                  number: StatisticsCubit.instance.sales[1]
                                      ['number'],
                                  title: StatisticsCubit.instance.sales[1]
                                      ['title'],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CustomCardDialog(
                            isProfile: true,
                            height: isArabic ? 305.h : 325.h,
                            child: Column(
                              children: [
                                SizedBox(height: 16.h),
                                CustomGreenContainer(
                                  title: tr.totalSales,
                                  subTitle: '10000.00 ر.س',
                                ),
                                SizedBox(height: 10.h),
                                CustomGreenContainer(
                                  title: tr.totalProfit,
                                  subTitle: '20000.00 ر.س',
                                ),
                                SizedBox(height: isArabic ? 10.h : 22.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 30.w,
                                  children: [
                                    CustomMyPercentResult(
                                      radius: isArabic ? 60 : 67,
                                      percent: 0.65,
                                      isColor: true,
                                      number: StatisticsCubit
                                          .instance.salesPercent[0]['number'],
                                      title: StatisticsCubit
                                          .instance.salesPercent[0]['title'],
                                    ),
                                    CustomMyPercentResult(
                                      radius: isArabic ? 60 : 70,
                                      percent: 0.80,
                                      isColor: true,
                                      number: StatisticsCubit
                                          .instance.salesPercent[1]['number'],
                                      title: StatisticsCubit
                                          .instance.salesPercent[1]['title'],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
