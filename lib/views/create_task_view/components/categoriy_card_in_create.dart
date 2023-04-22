import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';

import '../../../core/constants/app_color.dart';

class CategoriyCardInCreate extends StatelessWidget {
  CategoriyCardInCreate({
    Key? key,
    required this.title,
  }) : super(key: key);

  bool isActiv = false;

  String title;
  late Color color;

  _changeColor(){
    switch (title) {
      case 'Personal' : {
        color = AppColor.personal;
      }
      case 'Work' : {
        color = AppColor.work;
      }
      case 'Meeting' : {
        color = AppColor.meeting;
      }
      case 'Shopping' : {
        color = AppColor.shopping;
      }
      case 'Study' : {
        color = AppColor.study;
      }
      case 'Party' : {
        color = AppColor.party;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    _changeColor();
    return isActiv
        ? Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.w
      ),
      height: 27.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0.sp, 3.sp),
            blurRadius: 6.r,
            spreadRadius: 0.r,
            color: color.withOpacity(0.33)
          )
        ],
        color: color
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.w400.copyWith(
            fontSize: 15.sp,
            color: AppColor.cFFFFFF
          ),
        ),
      ),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10.h,
          width: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
            color: color,
          ),
        ),
        5.horizontalSpace,
        SizedBox(
          height: 26,
          child: Text(
            title,
            style: AppTextStyle.w400.copyWith(
              fontSize: 15.sp,
              color: AppColor.c8E8E8E
            ),
          ),
        )
      ],
    );
  }
}
