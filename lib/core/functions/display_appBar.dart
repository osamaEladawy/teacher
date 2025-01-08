import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher/core/functions/check_for_current_language.dart';
import 'package:teacher/core/functions/translate.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';
import 'package:teacher/shared/widgets/titleAppBar.dart';

AppBar displayAppBar(int index, Widget leading) {
  switch (index) {
    case 0:
      return AppBar(
        leading: leading,
        title: Image.asset(ImageResources.appBarLogo),
        centerTitle: true,
        actions: [
          SvgPicture.asset(IconsResources.cart),
          SizedBox(width: 8.w),
          Padding(
            padding: isArabic
                ? EdgeInsets.only(left: 24.w)
                : EdgeInsets.only(right: 24.w),
            child: SvgPicture.asset(IconsResources.bell),
          ),
        ],
      );
    case 1:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.statistics),
      );
    case 2:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.books),
      );
    case 3:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.students),
      );
    case 4:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.cart),
      );
    case 5:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.profile),
      );
    case 6:
      return AppBar(
        leading: leading,
        centerTitle: true,
        title: TitleAppBar(title: tr.settings),
      );
    default:
      return AppBar(
        title: Image.asset(ImageResources.appBarLogo),
        centerTitle: true,
        actions: [
          SvgPicture.asset(IconsResources.cart),
          SizedBox(width: 8.w),
          Padding(
            padding: isArabic
                ? EdgeInsets.only(left: 24.w)
                : EdgeInsets.only(right: 24.w),
            child: SvgPicture.asset(IconsResources.bell),
          ),
        ],
      );
  }
}
