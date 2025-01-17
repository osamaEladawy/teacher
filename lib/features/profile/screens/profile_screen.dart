import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/classes/responsive_screen.dart';
import 'package:teacher/features/profile/cubit/profile_cubit.dart';
import 'package:teacher/features/profile/widgets/display_about_teacher.dart';
import 'package:teacher/features/profile/widgets/display_courses_profile.dart';
import 'package:teacher/shared/widgets/custom_card_dailog.dart';
import 'package:teacher/features/students/widgets/details/custom_container_display_students_or_degree.dart';
import 'package:teacher/features/students/widgets/details/select_title_to_details.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 22.w),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: CustomCardDialog(
                      isProfile: true,
                      height: ProfileCubit.instance.currentIndex == 0
                          ? 270.h
                          : null,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomContainerDisplayStudentsOrDegree(
                              child: Row(
                                children: [
                                  ...List.generate(
                                      ProfileCubit.instance.words.length,
                                      (index) {
                                    return SelectTitleToDetails(
                                      currentIndex:
                                          ProfileCubit.instance.currentIndex,
                                      onTap: () {
                                        ProfileCubit.instance.selectCard(index);
                                      },
                                      title: ProfileCubit.instance.words[index]
                                          ['title'],
                                      image: ProfileCubit.instance.words[index]
                                          ['imageUrl'],
                                      colorContainer:
                                          ProfileCubit.instance.currentIndex ==
                                                  index
                                              ? ColorResources.primaryColor
                                              : ColorResources.whiteColor,
                                      colorText:
                                          ProfileCubit.instance.currentIndex ==
                                                  index
                                              ? ColorResources.whiteColor
                                              : ColorResources.primaryColor,
                                    );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            if (ProfileCubit.instance.currentIndex == 0)
                              DisplayAboutTeacher(),
                            if (ProfileCubit.instance.currentIndex == 1)
                              DisplayCoursesProfile(),
                          ],
                        ),
                      ),
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
