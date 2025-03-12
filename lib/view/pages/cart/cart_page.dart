import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/view/widget/custom_cart_item.dart';
import '../../../core/design/custom_app_bar.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/text_style_theme.dart';
import '../../../model/orders_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0AA7CB),
      appBar: CustomAppBar(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        title: CustomTextWidget(
          label: "Cart",
          style: TextStyleTheme.textStyle20Bold,
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
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => CustomCartItem(
                model: ordersList[index],
              ),
              separatorBuilder: (context, index) => verticalSpace(16),
              itemCount: ordersList.length,
            ),
          ],
        ),
      ),
    );
  }
}
