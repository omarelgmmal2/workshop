import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/model/orders_model.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';

class CustomCartItem extends StatefulWidget {
  final OrdersModel model;
  const CustomCartItem({super.key, required this.model});

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w,),
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
              widget.model.image,
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
                label: widget.model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleTheme.textStyle15Bold.copyWith(
                  color: AppColor.black,
                ),
              ),
              verticalSpace(5),
              CustomTextWidget(
                label: "\$${widget.model.price}",
                style: TextStyleTheme.textStyle14Bold,
              ),
              verticalSpace(5),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    height: 29.h,
                    width: 29.h,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(8.r),
                      color: Color(0xff0AA7CB),
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
                        color: AppColor.white,
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
                      color: Color(0xff0AA7CB),
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
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  horizontalSpace(67),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Color(0xffFF4747),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
