import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/resources/color_resources.dart';

class PhoneNumberInput extends StatelessWidget {
  final String hintText;

  const PhoneNumberInput({super.key, required this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ColorResources.blackColor.withOpacity(0.10),
          width: 1.w,
        ),
      ),
      height: 56.h,
      child: IntlPhoneField(
        disableLengthCheck: true,
        style: AppTextStyle.textStyle(
          appFontSize: 16.sp,
          appFontHeight: 19.36.sp,
          appFontWeight: FontWeight.w400,
          color: ColorResources.blackColor.withOpacity(
            0.25,
          ),
        ),
        decoration: InputDecoration(
          fillColor: ColorResources.whiteColor,
          filled: true,
          labelText: hintText,
          hintStyle: AppTextStyle.textStyle(
            appFontSize: 16.sp,
            appFontHeight: 19.36.sp,
            appFontWeight: FontWeight.w400,
            color: ColorResources.blackColor.withOpacity(
              0.25,
            ),
          ),
          border: InputBorder.none,
          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(16.r),
          //   borderSide: BorderSide(
          //     width: 1.w,
          //     color: ColorResources.blackColor.withOpacity(0.10),
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: ColorResources.blackColor.withOpacity(0.10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: ColorResources.blackColor.withOpacity(0.10),
            ),
          ),
        ),
        initialCountryCode: 'EG',
        //showCursor: false, // Set default country to Egypt
        onChanged: (phone) {
          print(phone.completeNumber); // Prints full phone number
        },
      ),
    );
  }
}
