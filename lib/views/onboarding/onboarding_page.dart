import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/core/constants/icons_set.dart';
import 'package:udevs_task/utils/widgets/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  IconsSet.onboarding,
                  height: 195.65.h,
                  width: 179.79.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Center(
              child: Text(
                'Reminders made simple',
                style: AppTextStyle.w500.copyWith(
                    color: AppColor.c554E8F,
                    fontSize: 22.sp
                ),
              ),
            ),
          ),
          CustomButton(
            onTab: (){
              context.go('/MainView');
            },
            text: 'Get Started',
          ),
        ],
      ),
    );
  }
}
