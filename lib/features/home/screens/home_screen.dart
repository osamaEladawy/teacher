import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/classes/responsive_screen.dart';
import 'package:teacher/core/functions/check_for_current_language.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/add_course/screens/add_course_screen.dart';
import 'package:teacher/features/home/cubit/home_cubit.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/widgets/display_courses.dart';

import '../widgets/Custom_card_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.h),
            child: Column(
              children: [
                Align(
                  alignment: isArabic ? Alignment.topRight : Alignment.topLeft,
                  child: Text(
                    tr.welcome,
                    style: AppTextStyle.textStyle(
                      appFontSize: 24.sp,
                      appFontHeight: 29.05.sp,
                      appFontWeight: FontWeight.w600,
                      color: ColorResources.blackColor,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: isArabic ? Alignment.topRight : Alignment.topLeft,
                  child: Text(
                    tr.enterYourCourse,
                    style: AppTextStyle.textStyle(
                      appFontSize: 14.sp,
                      appFontHeight: 16.94.sp,
                      appFontWeight: FontWeight.w400,
                      color: ColorResources.blackColor.withOpacity(0.50),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  spacing: 8.w,
                  children: [
                    ...List.generate(HomeCubit.instance.words.length, (index) {
                      return CustomCardHome(
                        onTap: () {
                          HomeCubit.instance.selectCard(index);
                        },
                        title: HomeCubit.instance.words[index],
                        colorContainer: HomeCubit.instance.currentIndex == index
                            ? ColorResources.primaryColor
                            : ColorResources.primaryColor.withOpacity(0.10),
                        colorText: HomeCubit.instance.currentIndex == index
                            ? ColorResources.whiteColor
                            : ColorResources.blackColor,
                      );
                    }),
                  ],
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return DisplayCourses(
                        courses: HomeCubit.instance.courses[index],
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    itemCount: HomeCubit.instance.courses.length,
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddCourseScreen();
                  });
            },
            child: Container(
              height: 65.h,
              width: 200.w,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                color: ColorResources.greenColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorResources.blackColor.withOpacity(0.3),
                    blurRadius: 3.0,
                    spreadRadius: 2.0,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Row(
                spacing: 8.w,
                children: [
                  Icon(
                    Icons.add,
                    color: ColorResources.whiteColor,
                    size: 24,
                    weight: 24.w,
                  ),
                  Text(
                    tr.addNewCourse,
                    style: AppTextStyle.textStyle(
                      appFontSize: 16.sp,
                      appFontHeight: 19.36.sp,
                      appFontWeight: FontWeight.w400,
                      color: ColorResources.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
