import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/design/app_image.dart';
import 'package:workshop_app/core/design/custom_app_bar.dart';
import 'package:workshop_app/core/design/title_text.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/core/utils/text_style_theme.dart';
import 'package:workshop_app/model/spare_parts_model.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/utils/app_color.dart';
import '../pages/cart/cart_page.dart';

class DetailsPage extends StatelessWidget {
  final SparePartsModel model;
  const DetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: CustomTextWidget(
            label: "Product Details",
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
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 31.w,vertical: 40.h),
            children: [
              AppImage(
                model.image,
                height: 295.h,
                width: 350.w,
              ),
              verticalSpace(27),
            ],
          ),
      ),
    );
  }
}
