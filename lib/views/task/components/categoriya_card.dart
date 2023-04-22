import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/main.dart';

class CategoriyaCard extends StatelessWidget {
  CategoriyaCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  String title;
  String icon;
  late Color backgroundColor;
  List<int>? items;

  late int count;

  _changeColor(){
    switch (title) {
      case 'Personal' : {
        backgroundColor = AppColor.personal.withOpacity(0.36);
        items = taskBox!.get('personal');
      }
      case 'Work' : {
        backgroundColor = AppColor.work.withOpacity(0.36);
        items = taskBox!.get('work');
      }
      case 'Meeting' : {
        backgroundColor = AppColor.meeting.withOpacity(0.36);
        items = taskBox!.get('meeting');
      }
      case 'Shopping' : {
        backgroundColor = AppColor.shopping.withOpacity(0.36);
        items = taskBox!.get('shopping');
      }
      case 'Study' : {
        backgroundColor = AppColor.study.withOpacity(0.36);
        items = taskBox!.get('study');
      }
      case 'Party' : {
        backgroundColor = AppColor.party.withOpacity(0.36);
        items = taskBox!.get('party');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    _changeColor();
    items == null || items!.isEmpty
        ? count = 0
        : count = items!.length;
    return Container(
      height: 180.49.h,
      width: 159.93.w,
      decoration: BoxDecoration(
        color: AppColor.cFFFFFF,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.sp, 7.sp),
            blurRadius: 11.r,
            spreadRadius: 0.r,
            color: AppColor.cBBBBBB.withOpacity(0.35)
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          28.verticalSpace,
          Container(
            height: 65.11.h,
            width: 65.11.h,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(32.555.h),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
              ),
            ),
          ),
          Text(
            title,
            style: AppTextStyle.w500.copyWith(
              fontSize: 17.sp,
              color: AppColor.c686868
            ),
          ),
          24.verticalSpace,
          Text(
            '$count Task',
            style: AppTextStyle.w400.copyWith(
              fontSize: 8.sp,
              color: AppColor.cA1A1A1
            ),
          ),
        ],
      ),
    );
  }
}
