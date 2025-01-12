import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomContainerAddCourse extends StatelessWidget {
  const CustomContainerAddCourse({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: ColorResources.blackColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: child,
    );
  }
}
