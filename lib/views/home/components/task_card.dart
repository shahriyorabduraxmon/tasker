import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/core/constants/icons_set.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    Key? key,
    required this.title,
    required this.date,
    required this.type,
    required this.status
  }) : super(key: key);

  String type;
  String date;
  String title;
  bool status;
  late Color color;

  bool isActiv = false;

  _changeColor(){
    switch (type) {
      case 'personal' : {
        color = AppColor.cFFD506;
      }
      case 'work' : {
        color = AppColor.c5DE61A;
      }
      case 'meeting' : {
        color = AppColor.cD10263;
      }
      case 'shopping' : {
        color = AppColor.cF29130;
      }
      case 'study' : {
        color = AppColor.c3044F2;
      }
      case 'party' : {
        color = AppColor.c9BFFF8;
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    _changeColor();
    return Container(
      height: 55.21.h,
      width: 339.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColor.cFFFFFF,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.sp, 4.sp),
            blurRadius: 9.r,
            spreadRadius: 0.r,
            color: AppColor.c0D0D0D.withOpacity(0.05),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 55.21.h,
                width: 4.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r)
                  ),
                  color: color,
                ),
              ),
              11.horizontalSpace,
              isActiv
                  ? SvgPicture.asset(
                IconsSet.checked,
                height: 18.h,
                width: 18.h,
              )
                  : Container(
                height: 18.h,
                width: 18.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.h),
                    border: Border.all(
                        color: AppColor.cDADADA,
                        width: 2.w
                    )
                ),
              ),
              11.horizontalSpace,
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 14.h
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          date,
                          style: AppTextStyle.w400.copyWith(
                            color: AppColor.cC6C6C8,
                            fontSize: 11.sp
                          ),
                        ),
                        11.horizontalSpace,
                        isActiv
                            ? DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.h,
                                color: AppColor.cD9D9D9
                              )
                            )
                          ),
                          child: Text(
                            title,
                            style: AppTextStyle.w400.copyWith(
                                color: AppColor.cD9D9D9,
                                fontSize: 14.sp
                            ),
                          ),
                        )
                            : Text(
                          title,
                          style: AppTextStyle.w500.copyWith(
                            color: AppColor.c554E8F,
                            fontSize: 14.sp
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                status
                    ? IconsSet.activeNotification
                    : IconsSet.notification,
                height: 14.08.h,
                width: 10.92.w,
              ),
              10.28.horizontalSpace
            ],
          )
        ],
      ),
    );
  }
}
