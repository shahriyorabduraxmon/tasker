import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onTab,
    this.height,
    this.width,
    this.radius,
    this.leftColor,
    this.rightColor,
    required this.text,
    this.textSize,
  }) : super(key: key);

  Function() onTab;
  double? height;
  double? width;
  double? radius;
  Color? leftColor;
  Color? rightColor;
  String text;
  double? textSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          width ?? 258.w,
          height ?? 56.29.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        padding: EdgeInsets.zero
      ),
      child: Container(
        height: height ?? 56.29.h,
        width: width ?? 258.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(102, 200, 28, 0.53),
              blurRadius: 30.r,
              spreadRadius: 0.0.r,
              offset: Offset(0.sp, 5.sp),
            )
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                leftColor ?? AppColor.c5DE61A,
                rightColor ?? AppColor.c39A801,
              ]
          )
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.w400.copyWith(
              fontSize: textSize ?? 15.sp,
              color: AppColor.cFFFFFF
            ),
          ),
        ),
      ),
    );
  }
}

