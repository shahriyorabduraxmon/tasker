import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:udevs_task/main.dart';
import 'package:udevs_task/utils/local_lists/local_lists.dart';
import 'package:udevs_task/views/create_task_view/create_task.dart';
import 'package:udevs_task/views/main_view/components/notification_card.dart';
import 'package:udevs_task/views/task/task_cubit/task_cubit.dart';
import 'package:udevs_task/views/task/task_page.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/app_text_style.dart';
import '../../core/constants/icons_set.dart';
import '../home/home_cubit/home_cubit.dart';
import '../home/home_page.dart';
import 'main_view_cubit/main_view_cubit.dart';
import 'main_view_state/main_view_state.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController pageController = PageController(initialPage: 0);

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _counter();
    pageController.addListener(() {
      if (context.read<MainViewCubit>().bottomNavigationIndex == 0) {
        pageController.jumpToPage(0);
      }
    });
  }

  _counter(){
    context.read<MainViewCubit>().taskPersonalLists = taskBox!.get('personal') ?? [];
    context.read<MainViewCubit>().taskWorkLists = taskBox!.get('work') ?? [];
    context.read<MainViewCubit>().taskMeetingLists = taskBox!.get('meeting') ?? [];
    context.read<MainViewCubit>().taskShoppingLists = taskBox!.get('shopping') ?? [];
    context.read<MainViewCubit>().taskPartyLists = taskBox!.get('party') ?? [];
    context.read<MainViewCubit>().taskStudyLists = taskBox!.get('study') ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isExpanded
            ? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Shahriyor!',
                      style: AppTextStyle.w400.copyWith(
                          color: AppColor.cFFFFFF,
                          fontSize: 18.sp
                      ),
                    ),
                    Text(
                      'Today you have 9 tasks',
                      style: AppTextStyle.w400.copyWith(
                          fontSize: 18.sp,
                          color: AppColor.cFFFFFF
                      ),
                    )
                  ],
                ),
                Container(
                  height: 42.h,
                  width: 42.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.h),
                      color: AppColor.cFFFFFF
                  ),
                )
              ],
            ),
            33.verticalSpace,
            NotificationCard(
              title: 'Meeting with client',
              date: '13.00 PM',
            )
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            false
                ? Text(
              'Hello Shahriyor!',
              style: AppTextStyle.w400.copyWith(
                color: AppColor.cFFFFFF,
                fontSize: 18.sp
              ),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Shahriyor!',
                  style: AppTextStyle.w400.copyWith(
                      color: AppColor.cFFFFFF,
                      fontSize: 18.sp
                  ),
                ),
                Text(
                  'Today you have 9 tasks',
                  style: AppTextStyle.w400.copyWith(
                    fontSize: 18.sp,
                    color: AppColor.cFFFFFF
                  ),
                )
              ],
            ),
            Container(
              height: 42.h,
              width: 42.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.h),
                color: AppColor.cFFFFFF
              ),
            )
          ],
        ),
        toolbarHeight: isExpanded ? 204.h : 72.h,
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColor.c3867D5,
                    AppColor.c81C7F5,
                  ]
                )
              ),
            ),
            Positioned(
              left: -80.sp,
              top: -105.sp,
              child: Container(
                height: 211.h,
                width: 211.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(105.5.h),
                  color: AppColor.cFFFFFF.withOpacity(0.17),
                ),
              ),
            ),
            Positioned(
              left: 299.sp,
              top: -18.sp,
              child: Container(
                height: 93.h,
                width: 93.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(46.5.h),
                  color: AppColor.cFFFFFF.withOpacity(0.17),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) => HomeCubit(),
                child: HomePage(),
              ),
              BlocProvider(
                create: (context) => TaskCubit(),
                child: const TaskPage(),
              ),
            ],
          )
      ),
      bottomNavigationBar: BlocBuilder<MainViewCubit, MainViewState>(
        builder: (context, state) {
          if (state is MainViewInitial) {
            return Stack(
              children: [
                Container(
                  height: 76.1.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.c888888.withOpacity(0.05),
                        offset: Offset(0.sp, -6.sp),
                        blurRadius: 12.r,
                        spreadRadius: 0.r
                      )
                    ]
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 76.1.h,
                    child: BottomNavigationBar(
                      backgroundColor: AppColor.cFFFFFF,
                      currentIndex: context.watch<MainViewCubit>().bottomNavigationIndex,
                      unselectedLabelStyle: AppTextStyle.w500.copyWith(
                          fontSize: 10.sp,
                          color: AppColor.c9F9F9F
                      ),
                      type: BottomNavigationBarType.fixed,
                      selectedFontSize: 12.sp,
                      selectedItemColor: AppColor.c5F87E7,
                      items: [
                        BottomNavigationBarItem(
                          label: 'Home',
                          icon: SvgPicture.asset(
                            IconsSet.home,
                            height: 24.23.h,
                            width: 22.w,
                          ),
                          activeIcon: SvgPicture.asset(
                            IconsSet.activeHome,
                            height: 24.23.h,
                            width: 22.w,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "Task",
                          icon: SvgPicture.asset(
                            IconsSet.grid,
                            height: 22.h,
                            width: 22.w,
                          ),
                          activeIcon: SvgPicture.asset(
                            IconsSet.activeGrid,
                            height: 22.h,
                            width: 22.w,
                          ),
                        ),
                      ],
                      onTap: (index) {
                        context
                            .read<MainViewCubit>()
                            .changeMainViewIndex(index);
                        pageController.jumpToPage(index);
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context){
              return CreateTask();
            }
          );
        },
        child: Container(
          height: 53.h,
          width: 53.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.5.h),
              boxShadow: [
                BoxShadow(
                    color: AppColor.cF456C3.withOpacity(0.47),
                    offset: Offset(0.sp, 7.sp),
                    blurRadius: 9.r,
                    spreadRadius: 0.r
                )
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.cF857C3,
                  AppColor.cE0139C
                ],
              )
          ),
          child: Center(
            child: SvgPicture.asset(
              IconsSet.bigPlus,
              height: 24.81.h,
              width: 24.81.h,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}