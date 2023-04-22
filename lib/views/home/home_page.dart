import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/core/constants/icons_set.dart';
import 'package:udevs_task/utils/functions/app_app_bar/app_app_bar.dart';
import 'package:udevs_task/utils/local_lists/local_lists.dart';
import 'package:udevs_task/views/home/components/task_card.dart';

import '../../utils/functions/not_tasks_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taskLists.isEmpty
          ? const NotTasksView()
          : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 13.h
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: AppTextStyle.w500.copyWith(
                      fontSize: 13.sp,
                      color: AppColor.c8B87B3
                    ),
                  ),
                  30.verticalSpace,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: taskLists.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return 13.79.verticalSpace;
                    },
                    itemBuilder: (BuildContext context, int index){
                      return TaskCard(
                          title: taskLists[index].title!,
                          date: taskLists[index].date!,
                          type: taskLists[index].type!,
                          status: taskLists[index].status!
                      );
                    },
                  ),
                  24.verticalSpace,
                  Text(
                    'Today',
                    style: AppTextStyle.w500.copyWith(
                        fontSize: 13.sp,
                        color: AppColor.c8B87B3
                    ),
                  ),
                  30.verticalSpace,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: taskLists.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return 13.79.verticalSpace;
                    },
                    itemBuilder: (BuildContext context, int index){
                      return TaskCard(
                          title: taskLists[index].title!,
                          date: taskLists[index].date!,
                          type: taskLists[index].type!,
                          status: taskLists[index].status!
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
      );
  }
}
