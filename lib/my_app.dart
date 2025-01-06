import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher/app_injections.dart';
import 'package:teacher/core/routes/routes_generator.dart';
import 'package:teacher/features/onboard/cubit/onboard_cubit.dart';
import 'package:teacher/features/splash/cubit/theme_cubit.dart';
import 'package:teacher/features/splash/screen/splash_screen.dart';
import 'package:teacher/generated/l10n.dart';

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
            BlocProvider<ThemeCubit>(create: (context)=>getIt<ThemeCubit>()),
            BlocProvider<OnboardCubit>(create: (context)=>getIt<OnboardCubit>()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
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
