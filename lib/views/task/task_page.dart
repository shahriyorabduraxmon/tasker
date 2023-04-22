import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/utils/local_lists/local_lists.dart';
import 'package:udevs_task/views/task/components/categoriya_card.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 13.h,
            horizontal: 18.w
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projects',
                style: AppTextStyle.w500.copyWith(
                  fontSize: 13.sp,
                  color: AppColor.c8B87B3
                ),
              ),
              30.verticalSpace,
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 23.51.h,
                crossAxisSpacing: 19.07.w,
                children: List.generate(categoriyaLists.length, (index) {
                  return CategoriyaCard(
                    title: categoriyaLists[index].title!,
                    icon: categoriyaLists[index].icon!,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
