import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/classes/responsive_screen.dart';
import 'package:teacher/core/routes/routes.dart';
import 'package:teacher/features/auth/cubit/auth_cubit.dart';
import 'package:teacher/features/auth/widgets/custom_icons.dart';
import 'package:teacher/features/auth/widgets/custom_text_field.dart';
import 'package:teacher/features/auth/widgets/custom_title_login.dart';
import 'package:teacher/features/onboard/widgets/custom_button.dart';
import 'package:teacher/generated/l10n.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/extentions/navigations.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';
import 'package:teacher/shared/widgets/drop_down_text_field.dart';
import 'package:teacher/shared/widgets/text_field_phone.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    ResponsiveScreen.initialize(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: ResponsiveScreen.height,
            width: ResponsiveScreen.width,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageResources.onboard),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTitleLogin(title: S.of(context).theLogin),
                  SizedBox(height: 40.h),
                  CustomTextField(hintText: S.of(context).enterName),
                  SizedBox(height: 16.h),
                  CustomTextField(hintText: S.of(context).email),
                  SizedBox(height: 16.h),
                  PhoneNumberInput(hintText: S.of(context).enterPhoneNumber),
                  //CustomTextField(hintText: S.of(context).enterPhoneNumber),
                  SizedBox(height: 16.h),
                  CustomDropDownTextField(
                    hintText: S.of(context).enterDateOfBirth,
                    items: [S.of(context).male, S.of(context).female],
                  ),
                  SizedBox(height: 16.h),
                  CustomDropDownTextField(
                    hintText: S.of(context).gender,
                    items: [S.of(context).male, S.of(context).female],
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    obscureText: AuthCubit.instance.isShowPassword,
                    hintText: S.of(context).enterPassword,
                    suffixIcon: AuthCubit.instance.isShowPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixIconOnTap: () {
                      AuthCubit.instance.showPassword();
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    obscureText: AuthCubit.instance.isShowConfirmPassword,
                    hintText: S.of(context).confirmPassword,
                    suffixIcon: AuthCubit.instance.isShowConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixIconOnTap: () {
                      AuthCubit.instance.showConfirmPassword();
                    },
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    title: S.of(context).login,
                    isLogin: true,
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).or,
                      style: AppTextStyle.textStyle(
                        appFontSize: 14.sp,
                        appFontHeight: 16.8.sp,
                        appFontWeight: FontWeight.w600,
                        color: ColorResources.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    spacing: 16.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcons(image: IconsResources.apple),
                      CustomIcons(image: IconsResources.google),
                      CustomIcons(image: IconsResources.facebook),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(Routes.login);
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: " ${S.of(context).iAlreadyHaveAnAccount}؟  ",
                            style: AppTextStyle.textStyle(
                              appFontSize: 16.sp,
                              appFontHeight: 19.36.sp,
                              appFontWeight: FontWeight.w400,
                              color: ColorResources.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: S.of(context).login,
                            style: AppTextStyle.textStyle(
                                appFontSize: 16.sp,
                                appFontHeight: 19.36.sp,
                                appFontWeight: FontWeight.w400,
                                color: ColorResources.greenColor),
                          ),
                        ],
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
