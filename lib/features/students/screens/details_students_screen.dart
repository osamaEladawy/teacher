import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class DetailsStudentsScreen extends StatelessWidget {
  const DetailsStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 264.h,
              width: 390.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
                color: ColorResources.primaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "التفاصيل",
                        style: AppTextStyle.textStyle(
                          appFontSize: 20.sp,
                          appFontHeight: 24.2.sp,
                          appFontWeight: FontWeight.w600,
                          color: ColorResources.whiteColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
