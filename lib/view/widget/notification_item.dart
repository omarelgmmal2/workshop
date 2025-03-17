import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/text_style_theme.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 380.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.black,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16.w,top: 7.h),
            height: 75.h,
            width: 75.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
            ),
            child: AppImage(
              AppImages.spareParts4,
              height: 60.h,
              width: 60.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                label: "Drilled  Slotted ",
                style: TextStyleTheme.textStyle16SemiBold,
              ),
              CustomTextWidget(
                textAlign: TextAlign.start,
                label: "arrived in two days, ordrer",
                style: TextStyleTheme.textStyle13medium.copyWith(
                  color: AppColor.black,
                ),
              ),
              CustomTextWidget(
                textAlign: TextAlign.start,
                label: "number #1982345",
                style: TextStyleTheme.textStyle13medium.copyWith(
                  color: Color(0xff0AA7CB),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: CustomTextWidget(
              label: "9:35 AM",
              style: TextStyleTheme.textStyle13medium.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
