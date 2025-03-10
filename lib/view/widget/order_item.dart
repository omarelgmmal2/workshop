import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/text_style_theme.dart';
import '../../model/orders_model.dart';

class OrderItem extends StatefulWidget {
  final OrdersModel model;
  const OrderItem({super.key, required this.model});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 10.h),
      height: 130.h,
      width: 313.w,
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppImage(
                widget.model.image,
                height: 90.h,
                width: 90.h,
              ),
              CustomTextWidget(
                label: "\$${widget.model.price}",
                style: TextStyleTheme.textStyle14regular,
              ),
            ],
          ),
          Row(
            children: [
              CustomTextWidget(
                label: widget.model.title,
                style: TextStyleTheme.textStyle13SemiBold,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 10.w),
                height: 29.h,
                width: 29.h,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(8.r),
                  color: AppColor.white,
                ),
                child: IconButton(
                  padding: EdgeInsets.only(top: 1.h),
                  onPressed: () {
                    if (amount > 1) {
                      setState(() {
                        amount--;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 20,
                    color: AppColor.primary,
                  ),
                ),
              ),
              CustomTextWidget(
                label: "$amount",
                style: TextStyleTheme.textStyle14Bold,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                height: 29.h,
                width: 29.h,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(8.r),
                  color: AppColor.white,
                ),
                child: IconButton(
                  padding: EdgeInsets.only(top: 1.h),
                  onPressed: () {
                    setState(() {
                      amount++;
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    size: 20,
                    color: AppColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
