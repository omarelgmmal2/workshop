import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/app_image.dart';
import '../../core/design/title_text.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';
import '../../model/spare_parts_model.dart';

class PartsItem extends StatefulWidget {
  final SparePartsModel model;
  const PartsItem({super.key, required this.model});

  @override
  State<PartsItem> createState() => _PartsItemState();
}

class _PartsItemState extends State<PartsItem> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117.h,
      width: 380.w,
      margin: EdgeInsets.only(top: 20.h),
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
      child: Row(
        children: [
          Container(
            height: 117.h,
            width: 105.w,
            decoration: BoxDecoration(
              color: Color(0xffD7D7D7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
            ),
            child: AppImage(
              widget.model.image,
              height: 90.h,
              width: 90.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w,top: 7.h,bottom: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextWidget(
                  label: widget.model.text,
                  style: TextStyleTheme.textStyle20medium,
                ),
                CustomTextWidget(
                  label: "This is a slotted and drilled\nbrake disc.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleTheme.textStyle16Regular,
                ),
                Row(
                  children: [
                    CustomTextWidget(
                      textAlign: TextAlign.center,
                      label: "\$${widget.model.price}",
                      style: TextStyleTheme.textStyle20medium,
                    ),
                    horizontalSpace(130),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
