import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({
    super.key,
    // required this.title,
    // required this.image,
    // required this.colorContainer,
    // required this.colorText,
    // this.onTap,
    //required this.currentIndex,
    this.widget,
  });
  // final String title;
  // final String image;
  // final Color colorContainer;
  // final Color colorText;
  // final void Function()? onTap;
  // final int currentIndex;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 345,
      alignment: Alignment.center,
      //padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorResources.blackColor.withOpacity(0.10),
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: widget,
    );
  }
}
