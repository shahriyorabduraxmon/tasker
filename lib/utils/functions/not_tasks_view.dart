import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';
import '../../core/constants/icons_set.dart';

class NotTasksView extends StatelessWidget {
  const NotTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            IconsSet.clipboard,
            height: 164.94.h,
            width: 119.96.w,
          ),
        ),
        70.verticalSpace,
        Text(
          'No tasks',
          style: AppTextStyle.w500.copyWith(
              fontSize: 22.sp,
              color: AppColor.c554E8F
          ),
        )
      ],
    );
  }
}
