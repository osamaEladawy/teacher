import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/app_injections.dart';
import 'package:teacher/core/routes/routes_generator.dart';
import 'package:teacher/features/add_course/cubit/add_course_cubit.dart';
import 'package:teacher/features/auth/cubit/auth_cubit.dart';
import 'package:teacher/features/courses/cubit/books_cubit.dart';
import 'package:teacher/features/dashboaed/cubit/dashboard_cubit.dart';
import 'package:teacher/features/home/cubit/home_cubit.dart';
import 'package:teacher/features/onboard/cubit/onboard_cubit.dart';
import 'package:teacher/features/profile/cubit/profile_cubit.dart';
import 'package:teacher/features/splash/cubit/theme_cubit.dart';
import 'package:teacher/features/splash/screen/splash_screen.dart';
import 'package:teacher/features/statistics/cubit/statistics_cubit.dart';
import 'package:teacher/features/students/cubit/students_cubit.dart';
import 'package:teacher/generated/l10n.dart';

//! when you want using localization in this app
//* please install the flutter intl (extention) from plugins in android studio or visual studio

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(create: (context) => getIt<ThemeCubit>()),
            BlocProvider<OnboardCubit>(
                create: (context) => getIt<OnboardCubit>()),
            BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
            BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
            BlocProvider<DashboardCubit>(
                create: (context) => getIt<DashboardCubit>()),
            BlocProvider<CoursesCubit>(
                create: (context) => getIt<CoursesCubit>()),
            BlocProvider<StudentsCubit>(
                create: (context) => getIt<StudentsCubit>()),
            BlocProvider<ProfileCubit>(
                create: (context) => getIt<ProfileCubit>()),
            BlocProvider<StatisticsCubit>(
                create: (context) => getIt<StatisticsCubit>()),
            BlocProvider<AddCourseCubit>(
                create: (context) => getIt<AddCourseCubit>()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesGenerator.onGenerateRoute,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale("ar"),
            home: child,
          ),
        );
      },
      child: SplashScreen(),
    );
  }
}
