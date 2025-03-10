import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/model/orders_model.dart';
import 'package:workshop_app/view/widget/order_item.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/custom_app_bar.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/text_style_theme.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 70.h,
        padding: EdgeInsets.only(right: 40.w,left: 40.w,bottom: 25.h),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100.r),
          bottomRight: Radius.circular(100.r),
        ),
        hideBack: true,
        action: AppImage(
          AppImages.cart,
          height: 39.h,
          width: 39.h,
        ),
        title: CustomTextWidget(
          label: "Orders",
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
                itemBuilder: (context, index) => OrderItem(
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
