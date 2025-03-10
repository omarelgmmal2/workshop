import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/design/app_image.dart';
import 'package:workshop_app/core/design/title_text.dart';
import 'package:workshop_app/core/logic/helper_methods.dart';
import 'package:workshop_app/core/utils/app_color.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/core/utils/text_style_theme.dart';
import 'package:workshop_app/model/spare_parts_model.dart';
import 'package:workshop_app/model/type_cars_model.dart';
import 'package:workshop_app/view/widget/item_product.dart';
import '../../widget/custom_search_main.dart';
import '../../widget/details_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchMain(),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            children: [
              CustomTextWidget(
                  label: "For you",
                style: TextStyleTheme.textStyle20bold,
              ),
              verticalSpace(5),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: AppColor.primary,
                        ),
                      ),
                      child: AppImage(
                        typeCarsList[index].image,
                        height: 100.h,
                        width: 100.h,
                      ),
                    ),
                    separatorBuilder: (context, index) => horizontalSpace(16),
                    itemCount: typeCarsList.length,
                ),
              ),
              verticalSpace(20),
              CustomTextWidget(
                label: "Parts may you need",
                style: TextStyleTheme.textStyle20bold,
              ),
              verticalSpace(16),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: sparePartsList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 250,
            mainAxisSpacing: 10,
            crossAxisSpacing: 94,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              navigateTo(
                  toPage: DetailsPage(model: sparePartsList[index]),
              );
            },
            child: ItemProduct(
              model: sparePartsList[index],
            ),
          ),
        ),
            ],
          ),
      ),
    );
  }
}
