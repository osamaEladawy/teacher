import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/classes/responsive_screen.dart';
import 'package:teacher/features/students/cubit/students_cubit.dart';
import 'package:teacher/features/students/models/student_model.dart';
import 'package:teacher/shared/widgets/custom_card_dailog.dart';
import 'package:teacher/features/students/widgets/details/custom_card_details_students.dart';
import 'package:teacher/features/students/widgets/details/custom_container_display_students_or_degree.dart';
import 'package:teacher/features/students/widgets/details/if_display_degrees.dart';
import 'package:teacher/features/students/widgets/details/if_display_students.dart';
import 'package:teacher/features/students/widgets/details/select_title_to_details.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class DetailsStudentsScreen extends StatelessWidget {
  const DetailsStudentsScreen({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize();
    return BlocBuilder<StudentsCubit, StudentsState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                CustomCardDetailsStudents(
                  name: student.name,
                  image: student.image,
                ),
                SizedBox(height: 16.h),
                CustomCardDialog(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomContainerDisplayStudentsOrDegree(
                          child: Row(
                            children: [
                              ...List.generate(
                                  StudentsCubit.instance.words.length, (index) {
                                return SelectTitleToDetails(
                                  currentIndex:
                                      StudentsCubit.instance.currentIndex,
                                  onTap: () {
                                    StudentsCubit.instance.selectCard(index);
                                  },
                                  title: StudentsCubit.instance.words[index]
                                      ['title'],
                                  image: StudentsCubit.instance.words[index]
                                      ['imageUrl'],
                                  colorContainer:
                                      StudentsCubit.instance.currentIndex ==
                                              index
                                          ? ColorResources.primaryColor
                                          : ColorResources.whiteColor,
                                  colorText:
                                      StudentsCubit.instance.currentIndex ==
                                              index
                                          ? ColorResources.whiteColor
                                          : ColorResources.primaryColor,
                                );
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        if (StudentsCubit.instance.currentIndex == 0)
                          IfDisplayStudents(),
                        if (StudentsCubit.instance.currentIndex == 1)
                          IfDisplayDegrees(),
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
