import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher/core/classes/responsive_screen.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/students/cubit/students_cubit.dart';
import 'package:teacher/features/students/models/student_model.dart';
import 'package:teacher/features/students/widgets/custom_card_details_students.dart';
import 'package:teacher/features/students/widgets/custom_card_info.dart';
import 'package:teacher/features/students/widgets/custom_container_display_degrees.dart';
import 'package:teacher/features/students/widgets/custom_my_card_capabilities.dart';
import 'package:teacher/features/students/widgets/custom_row_Dailog.dart';
import 'package:teacher/features/students/widgets/custom_title_degree.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';

class DetailsStudentsScreen extends StatelessWidget {
  const DetailsStudentsScreen({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize(context);
    return BlocBuilder<StudentsCubit, StudentsState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                CustomCardDetailsStudents(
                    name: student.name, image: student.image),
                SizedBox(height: 16.h),
                Container(
                  height: 550.h,
                  width: 345.w,
                  padding: EdgeInsets.only(bottom: 24.h),
                  decoration: BoxDecoration(
                    color: ColorResources.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(221, 255, 255, 255),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                    border: Border.all(
                      width: 1.w,
                      color: ColorResources.blackColor.withOpacity(0.10),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomCardInfo(
                          widget: Row(
                            children: [
                              ...List.generate(
                                  StudentsCubit.instance.words.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    StudentsCubit.instance.selectCard(index);
                                  },
                                  child: Container(
                                    height: 56.h,
                                    decoration: BoxDecoration(
                                      color:
                                          StudentsCubit.instance.currentIndex ==
                                                  index
                                              ? ColorResources.primaryColor
                                              : ColorResources.whiteColor,
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                    width: 170.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 10.w,
                                      children: [
                                        SvgPicture.asset(
                                          StudentsCubit.instance.words[index]
                                              ['imageUrl'],
                                          color: StudentsCubit
                                                      .instance.currentIndex ==
                                                  index
                                              ? ColorResources.whiteColor
                                              : ColorResources.primaryColor,
                                        ),
                                        Text(
                                          StudentsCubit.instance.words[index]
                                              ['title'],
                                          style: AppTextStyle.textStyle(
                                            appFontSize: 20.sp,
                                            appFontHeight: 25.2.sp,
                                            appFontWeight: FontWeight.w600,
                                            color: StudentsCubit.instance
                                                        .currentIndex ==
                                                    index
                                                ? ColorResources.whiteColor
                                                : ColorResources.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        if (StudentsCubit.instance.currentIndex == 0)
                          Column(
                            children: [
                              CustomRowDialog(
                                title: tr.theLine,
                                subTitle: tr.thirdSecondary,
                              ),
                              SizedBox(height: 8.h),
                              Divider(
                                color:
                                    ColorResources.blackColor.withOpacity(0.10),
                              ),
                              SizedBox(height: 8.h),
                              CustomRowDialog(
                                title: tr.devicesUsed,
                                subTitle: tr.phone,
                              ),
                              SizedBox(height: 8.h),
                              Divider(
                                color:
                                    ColorResources.blackColor.withOpacity(0.10),
                              ),
                              SizedBox(height: 8.h),
                              CustomRowDialog(
                                title: tr.courses,
                                subTitle: '2 ${tr.course}',
                              ),
                              SizedBox(height: 16.h),
                              CustomMyCardCapabilities(
                                title: tr.capabilities,
                                course: '4 ${tr.lesson}',
                                hour: tr.hour,
                                duration: tr.duration,
                                month: 'شهرين',
                                daysOfWeek: 'يومين في الاسبوع',
                                icon: IconsResources.clock,
                              ),
                              SizedBox(height: 16.h),
                              CustomMyCardCapabilities(
                                title: tr.achievement,
                                course: '4 ${tr.lesson}',
                                hour: tr.hour,
                                duration: tr.duration,
                                month: 'شهرين',
                                daysOfWeek: 'يومين في الاسبوع',
                                icon: IconsResources.clock,
                              ),
                            ],
                          ),
                        if (StudentsCubit.instance.currentIndex == 1)
                          Column(
                            children: [
                              CustomMyCardCapabilities(
                                isDegree: true,
                                title: tr.capabilities,
                                course: '4 ${tr.lesson}',
                                hour: tr.hour,
                                duration: tr.duration,
                                month: 'شهرين',
                                daysOfWeek: 'يومين في الاسبوع',
                                icon: IconsResources.clock,
                              ),
                              SizedBox(height: 8.h),
                              CustomTitleDegree(),
                              SizedBox(height: 8.h),
                              CustomContainerDisplayDegrees(),
                              SizedBox(height: 16.h),
                              CustomMyCardCapabilities(
                                isDegree: true,
                                title: tr.achievement,
                                course: '4 ${tr.lesson}',
                                hour: tr.hour,
                                duration: tr.duration,
                                month: 'شهرين',
                                daysOfWeek: 'يومين في الاسبوع',
                                icon: IconsResources.clock,
                              ),
                              SizedBox(height: 16.h),
                              CustomTitleDegree(),
                              SizedBox(height: 8.h),
                              CustomContainerDisplayDegrees(),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
