import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';
import '../../model/orders_model.dart';

class OrderItem extends StatelessWidget {
  final OrdersModel model;
  const OrderItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w,right: 16.w),
      height: 120.h,
      width: 313.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 117.h,
            width: 105.w,
            decoration: BoxDecoration(
              color: AppColor.white,
            ),
            child: AppImage(
              model.image,
              height: 90.h,
              width: 90.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w,right: 10.w),
            height: 130.h,
              width: 1.w,
              color: AppColor.black,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              CustomTextWidget(
                label: model.title,
                style: TextStyleTheme.textStyle15Bold.copyWith(
                  color: AppColor.black,
                ),
              ),
              verticalSpace(5),
              CustomTextWidget(
                label: "\$${model.price}",
                style: TextStyleTheme.textStyle14Bold,
              ),
              verticalSpace(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: 32.h,
                width: 117.w,
                decoration: BoxDecoration(
                  color: model.color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    CustomTextWidget(
                      label: "${model.textType}",
                      style: TextStyleTheme.textStyle14Regular.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 24.h,
                      width: 24.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColor.black,
                          width: 2,
                        )
                      ),
                      child: model.icon,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
