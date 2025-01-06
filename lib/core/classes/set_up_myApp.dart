

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/core/constant/appStrings.dart';
import 'package:teacher/shared/classes/text_style.dart';
import 'package:teacher/shared/cubits/location_bloc/location_cubit.dart';
import 'package:teacher/shared/models/language_model.dart';

const Locale arabic = Locale('ar');
const Locale english = Locale('en');

class SetUpMyApp {
  static LanguageModel? languageModel;
  static List<LanguageModel> languageList = [
    LanguageModel(id: 1, txt: AppStrings.english),
    LanguageModel(id: 2, txt: AppStrings.arabic),
  ];
  static Future<bool> getLocation(BuildContext context) async {
    // LocationCubit locationCubit = BlocProvider.of(context,listen: false);
    bool? getLocation = await LocationCubit.instance.getGeoLocation(context);
    if (getLocation == true) {
      return true;
    } else {
      return false;
    }
  }
}

final titleAppBar = TextStyle(
  fontWeight: AppFontWeight.bold,
  fontSize: 18.sp,
  fontFamily: 'Inter',
);
