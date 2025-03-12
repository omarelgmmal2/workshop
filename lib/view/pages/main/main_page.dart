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
import 'package:workshop_app/view/widget/parts_item.dart';
import 'package:workshop_app/view/widget/see_all_screen.dart';
import '../../widget/custom_search_main.dart';
import '../../widget/details_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: CustomSearchMain(),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.only(left: 16.w),
              height: 39.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.primary
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColor.primary.withOpacity(.86),
                    Color(0xffC0FFDA),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColor.black,
                  ),
                  horizontalSpace(5),
                  CustomTextWidget(
                      label: "Delivering to Automatic-Tanta   ",
                    style: TextStyleTheme.textStyle16Regular,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColor.black,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextWidget(
                label: "For you",
              style: TextStyleTheme.textStyle20bold,
            ),
          ),
          verticalSpace(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 100.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
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
          ),
          verticalSpace(20),
          Divider(
            color: AppColor.primary,
            height: 2,
            thickness: 1,
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  label: "Top Sell",
                  style: TextStyleTheme.textStyle20Bold.copyWith(
                    color: AppColor.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(toPage: SeeAllScreen());
                  },
                  child: CustomTextWidget(
                    label: "See All",
                    style: TextStyleTheme.textStyle16Regular.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
                  height: 230.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: sparePartsList.length,
                    separatorBuilder: (context, index) => horizontalSpace(16),
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
                ),
          ),
          verticalSpace(20),
          Divider(
            color: AppColor.primary,
            height: 2,
            thickness: 1,
          ),
          verticalSpace(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextWidget(
                label: "Parts may you need",
              style: TextStyleTheme.textStyle20Bold.copyWith(
                color: AppColor.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  navigateTo(
                    toPage: DetailsPage(model: sparePartsList[index]),
                  );
                },
                child: PartsItem(
                  model: sparePartsList[index],
                ),
              ),
              itemCount: sparePartsList.length,
            ),
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
