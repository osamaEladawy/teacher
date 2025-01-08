import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/books/cubit/books_cubit.dart';
import 'package:teacher/shared/widgets/display_courses.dart';
import 'package:teacher/shared/widgets/titleAppBar.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocBuilder<BooksCubit, BooksState>(
            builder: (context, state) {
              return ListView.separated(
                itemCount: BooksCubit.instance.courses.length,
                itemBuilder: (_, index) {
                  return DisplayCourses(
                    courses: BooksCubit.instance.courses[index],
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
