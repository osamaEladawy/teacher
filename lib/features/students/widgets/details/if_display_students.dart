import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/features/students/widgets/details/custom_my_card_capabilities.dart';
import 'package:teacher/features/students/widgets/details/custom_row_Dailog.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';

class IfDisplayStudents extends StatelessWidget {
  const IfDisplayStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowDialog(
          title: tr.theLine,
          subTitle: tr.thirdSecondary,
        ),
        SizedBox(height: 8.h),
        Divider(
          color: ColorResources.blackColor.withOpacity(0.10),
        ),
        SizedBox(height: 8.h),
        CustomRowDialog(
          title: tr.devicesUsed,
          subTitle: tr.phone,
        ),
        SizedBox(height: 8.h),
        Divider(
          color: ColorResources.blackColor.withOpacity(0.10),
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
    );
  }
}
