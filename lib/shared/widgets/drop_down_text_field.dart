import 'package:dropdown_textfield/dropdown_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';

List<String> models = [
  '2020',
  '2021',
  '2022',
  '2023',
  '2023',
  '2019',
];

class CustomDropDownTextField extends StatelessWidget {
  final dynamic controller;
  final dynamic initialValue;
  final String hintText;
  final void Function(dynamic)? onChanged;
  final void Function()? onTap;
  final List<String>? items;
  const CustomDropDownTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    required this.hintText,
    this.onTap,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: ColorResources.blackColor.withOpacity(0.10),
            width: 1.w,
          ),
        ),
        height: 56.h,
        child: DropDownTextField(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          textStyle: AppTextStyle.textStyle(
            appFontSize: 16.sp,
            appFontHeight: 19.36.sp,
            appFontWeight: FontWeight.w400,
            color: ColorResources.blackColor.withOpacity(
              0.25,
            ),
          ),
          initialValue: initialValue,
          controller: controller,
          //clearOption: true,
          //enableSearch: true,
          //isEnabled: true,
          clearIconProperty: IconProperty(color: Colors.green),
          searchTextStyle: const TextStyle(color: Colors.red),

          textFieldDecoration: InputDecoration(
            fillColor: ColorResources.whiteColor,
            filled: true,
            hintStyle: AppTextStyle.textStyle(
              appFontSize: 16.sp,
              appFontHeight: 19.36.sp,
              appFontWeight: FontWeight.w400,
              color: ColorResources.blackColor.withOpacity(
                0.25,
              ),
            ),
            suffixIcon: SizedBox(),
            prefixIcon: Image.asset(
              ImageResources.arrowDown,
              height: 16.h,
              width: 16.w,
            ),
            hintText: hintText,
            border: InputBorder.none,
            // OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(16.r),
            //   borderSide: BorderSide(
            //     color: ColorResources.blackColor.withOpacity(0.10),
            //     width: 1.w,
            //   ),
            // ),
          ),
          // searchDecoration: InputDecoration(
          //   hintText: "enter your custom hint text here",
          // ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Required field";
            } else {
              return null;
            }
          },
          dropDownItemCount: items!.length,
          dropDownList: [
            ...List.generate(items!.length, (index) {
              return DropDownValueModel(
                  // ignore: unnecessary_string_interpolations
                  name: '${items![index]}',
                  value: "$index");
            })
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
