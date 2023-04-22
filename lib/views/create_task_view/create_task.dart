import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_task/core/constants/app_color.dart';
import 'package:udevs_task/core/constants/app_text_style.dart';
import 'package:udevs_task/utils/local_lists/local_lists.dart';
import 'package:udevs_task/utils/widgets/custom_button.dart';
import 'package:udevs_task/views/create_task_view/components/categoriy_card_in_create.dart';

class CreateTask extends StatelessWidget {
  CreateTask({Key? key}) : super(key: key);

  TextEditingController dayController = TextEditingController();
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        26.5.verticalSpace,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(200.sp, 60.sp)
            ),
            color: AppColor.cFFFFFF
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              44.verticalSpace,
              Text(
                'Add new task',
                style: AppTextStyle.w500.copyWith(
                  fontSize: 13.sp,
                  color: AppColor.c404040
                ),
              ),
              14.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 26.h,
                    width: 222.w,
                    child: Text(
                      'Book a table for dinner',
                      style: AppTextStyle.w400.copyWith(
                        fontSize: 20.sp,
                        color: AppColor.c373737
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Container(
                    height: 32.h,
                    width: 2.w,
                    color: AppColor.c373737,
                  )
                ],
              ),
              30.5.verticalSpace,
              Container(
                width: double.infinity,
                height: 1.h,
                color: AppColor.cCFCFCF,
              ),
              SizedBox(
                height: 62.h,
                width: MediaQuery.of(context).size.width - 40.w,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriyaLists.length,
                        separatorBuilder: (BuildContext context, index) {
                          return 11.94.horizontalSpace;
                        },
                        itemBuilder: (BuildContext context, index) {
                          return CategoriyCardInCreate(
                              title: categoriyaLists[index].title!,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: AppColor.cCFCFCF,
              ),
              38.verticalSpace,
              Text(
                'Choose date',
                style: AppTextStyle.w400.copyWith(
                  fontSize: 13.sp,
                  color: AppColor.c404040
                ),
              ),
              21.verticalSpace,

              /// Figmada bu joyiga to'liq chizilmagani uchun textformfield quyaqoldim.
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 90.w,
                  height: 36,
                  child: TextFormField(
                    controller: dayController,
                  ),
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 90.w,
                  height: 36,
                  child: TextFormField(
                    controller: beginDateController,
                  ),
                ),
                16.horizontalSpace,
                SizedBox(
                  width: 90.w,
                  height: 36,
                  child: TextFormField(
                    controller: endDateController,
                  ),
                ),

              ],
          ),

              60.verticalSpace,
              CustomButton(
                onTab: (){},
                text: 'Add task',
              ),
              16.verticalSpace
            ],
          ),
        )
      ],
    );
  }
}


