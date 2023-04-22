import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/core/constants/icons_set.dart';

class NotificationCard extends StatelessWidget {
  NotificationCard({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  String title;
  String date;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColor.cFFFFFF.withOpacity(0.31),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              top: 13.56.h,
              // right: 21.35.w,
              bottom: 22.5.h
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today Reminder',
                  style: AppTextStyle.w500.copyWith(
                    color: AppColor.cFFFFFF,
                    fontSize: 20.sp
                  ),
                ),
                Text(
                  title,
                  style: AppTextStyle.w400.copyWith(
                    fontSize: 11.sp,
                    color: AppColor.cFFFFFF
                  ),
                ),
                Text(
                  date,
                  style: AppTextStyle.w400.copyWith(
                    fontSize: 11.sp,
                    color: AppColor.cFFFFFF
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: 21.35.w,
                bottom: 8.5.h
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      IconsSet.bigNotification,
                      width: 52.32.sp,
                      height: 66.18.sp,
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  IconsSet.close,
                  height: 9.56.h,
                  width: 9.56.h,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
