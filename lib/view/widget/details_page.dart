import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/design/app_button.dart';
import 'package:workshop_app/core/design/app_image.dart';
import 'package:workshop_app/core/design/custom_app_bar.dart';
import 'package:workshop_app/core/design/title_text.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/core/utils/text_style_theme.dart';
import 'package:workshop_app/model/spare_parts_model.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/utils/app_color.dart';
import '../pages/cart/cart_page.dart';

class DetailsPage extends StatefulWidget {
  final SparePartsModel model;
  const DetailsPage({super.key, required this.model});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomTextWidget(
            label: widget.model.text,
          style: TextStyleTheme.textStyle20Bold,
        ),
        action: IconButton(
          onPressed: () {
            navigateTo(toPage: CartPage());
          },
          icon: Icon(CupertinoIcons.cart,color: AppColor.white),
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.primary.withOpacity(.86),
            Color(0xffC0FFDA),
          ],
        ),
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                height: 330.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColor.primary.withOpacity(.86),
                      Color(0xffC0FFDA),
                    ],
                  ),
                ),
                child: AppImage(
                  widget.model.image,
                  height: 270.h,
                  width: 280.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 300.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: 442.h,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.r),
                    topRight: Radius.circular(35.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(30),
                    Row(
                      children: [
                        CustomTextWidget(
                            label: widget.model.text,
                          style: TextStyleTheme.textStyle15SemiBold,
                        ),
                        Spacer(),
                        ...List.generate(5, (index) {
                          return Icon(Icons.star,color: Color(0xffFCD306));
                        },),
                      ],
                    ),
                    verticalSpace(16),
                    Row(
                      children: [
                        CustomTextWidget(
                          label: "\$${widget.model.price}",
                          style: TextStyleTheme.textStyle17Bold,
                        ),
                        horizontalSpace(5),
                        CustomTextWidget(
                          label: "\$210",
                          style: TextStyleTheme.textStyle14Regular.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff939393),
                          ),
                        ),
                        horizontalSpace(15),
                        Container(
                          alignment: Alignment.center,
                          height: 32.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Color(0xff44C3BE),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomTextWidget(
                              label: "26% off",
                            style: TextStyleTheme.textStyle14Bold.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                        ),
                        Spacer(),
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
                      ],
                    ),
                    verticalSpace(16),
                    CustomTextWidget(
                      label: "Description:",
                      style: TextStyleTheme.textStyle15Bold.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    verticalSpace(10),
                    CustomTextWidget(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      label: "This is a slotted and drilled brake disc with red brake caliper, designed to improve braking performance in sports and regular cars.",
                      style: TextStyleTheme.textStyle15Bold.copyWith(
                        color: Color(0xff484848),
                      ),
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        CustomTextWidget(
                          label: "Company",
                          style: TextStyleTheme.textStyle15Bold.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                        horizontalSpace(100),
                        CustomTextWidget(
                          label: "Available",
                          style: TextStyleTheme.textStyle15Bold.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: CustomTextWidget(
                            label: "Bosch",
                            style: TextStyleTheme.textStyle15Bold.copyWith(
                              color: AppColor.black,
                            ),
                          ),
                        ),
                        horizontalSpace(140),
                        CustomTextWidget(
                          label: "6",
                          style: TextStyleTheme.textStyle15Bold.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    AppButton(
                      text: "Add to Cart",
                      textStyle: TextStyle(color: Color(0xff0AA7CB)),
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.white,
                        fixedSize: Size(380.w,50.h),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xff0AA7CB),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPress: () {

                    },
                    ),
                    verticalSpace(10),
                    AppButton(
                      text: "Buy ",
                      textStyle: TextStyle(color: AppColor.white),
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0AA7CB),
                        fixedSize: Size(380.w,50.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPress: () {

                    },
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
