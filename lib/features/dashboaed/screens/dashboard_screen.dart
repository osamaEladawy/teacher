import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teacher/core/functions/check_for_current_language.dart';
import 'package:teacher/core/functions/display_appBar.dart';
import 'package:teacher/core/functions/display_widgets.dart';
import 'package:teacher/features/dashboaed/cubit/dashboard_cubit.dart';
import 'package:teacher/features/dashboaed/widgets/custom_drawer.dart';
import 'package:teacher/shared/resources/color_resources.dart';
import 'package:teacher/shared/resources/icons_resources.dart';
import 'package:teacher/shared/resources/image_resources.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<DashboardCubit, DashboardState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              key: DashboardCubit.instance.scaffoldKey,
              drawer: CustomDrawer(),
              appBar: displayAppBar(
                DashboardCubit.instance.currentIndex,
                GestureDetector(
                  onTap: () => DashboardCubit.instance.scaffoldKey.currentState
                      ?.openDrawer(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: ColorResources.primaryColor,
                        image: DecorationImage(
                          image: AssetImage(ImageResources.menu),
                        ),
                      ),
                      child: SvgPicture.asset(IconsResources.menu),
                    ),
                  ),
                ),
              ),
              body: displayWidgets(DashboardCubit.instance.currentIndex),
            );
          },
        );
      },
    );
  }
}
