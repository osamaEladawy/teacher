import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/features/courses/cubit/books_cubit.dart';
import 'package:teacher/shared/widgets/display_courses.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              return ListView.separated(
                itemCount: CoursesCubit.instance.courses.length,
                itemBuilder: (_, index) {
                  return DisplayCourses(
                    courses: CoursesCubit.instance.courses[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 16.h,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
