import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/utils/app_color.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/model/spare_parts_model.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/text_style_theme.dart';

class ItemProduct extends StatefulWidget {
  final SparePartsModel model;
  const ItemProduct({super.key, required this.model});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: 190.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(.10),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0,4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.h,
                width: 190.w,
                decoration: BoxDecoration(
                  color: Color(0xffD7D7D7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: AppImage(
                  widget.model.image,
                  height: 110.h,
                  width: 130.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Transform.translate(
                offset: Offset(180, -135),
                child: Icon(
                  Icons.star,
                  size: 24,
                  color: Color(0xffFCD306),
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: EdgeInsets.only(left: 10.w,bottom: 10.h),
                child: CustomTextWidget(
                  label: widget.model.text,
                  style: TextStyleTheme.textStyle15medium,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      textAlign: TextAlign.center,
                      label: "\$${widget.model.price}",
                      style: TextStyleTheme.textStyle20medium,
                    ),
                    Container(
                      height: 26.h,
                      width: 26.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff3AB3C6),
                          width: 3,
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: 2.h),
                        onPressed: () {
                          setState(() {
                            isSelected = true;
                          });
                        },
                        icon: Icon(
                          isSelected ? Icons.abc : Icons.add,
                          color: Color(0xff3AB3C6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
