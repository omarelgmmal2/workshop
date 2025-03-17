import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/core/design/app_button.dart';
import 'package:workshop_app/core/design/app_image.dart';
import 'package:workshop_app/core/design/title_text.dart';
import 'package:workshop_app/core/utils/assets.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/core/utils/text_style_theme.dart';
import 'package:workshop_app/view/widget/notification_item.dart';
import '../../../core/design/custom_app_bar.dart';
import '../../../core/utils/app_color.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCFFF4),
      appBar: CustomAppBar(
        height: 70.h,
        padding: EdgeInsets.only(right: 16.w,left: 16.w),
        hideBack: true,
        action: AppImage(
          AppImages.notificationSvg,
          height: 39.h,
          width: 39.h,
        ),
        title: CustomTextWidget(
            label: "Notifications",
          style: TextStyleTheme.textStyle20Bold,
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.primary.withOpacity(.86),
            Color(0xffC0FFDA),
          ],
        ),
      ),
      body: isEmpty ? SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(10, 180),
                    child: AppImage(
                      AppImages.notificationSvg,
                      height: 247.h,
                      width: 222.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(210, -145),
                    child: Container(
                      height: 329.h,
                      width: 362.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff70CCD2),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(70, -490),
                    child: Container(
                      padding: EdgeInsets.only(top: 10.h),
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDC1616),
                      ),
                      child: CustomTextWidget(
                        textAlign: TextAlign.center,
                          label: "0",
                        style: TextStyleTheme.textStyle15SemiBold.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(10, -240),
                    child: Container(
                      padding: EdgeInsets.only(top: 20.h),
                      height: 160.h,
                      width: 295.w,
                      decoration: BoxDecoration(
                          color: Color(0xffF1F5F7)
                      ),
                      child: Column(
                        children: [
                          CustomTextWidget(
                            textAlign: TextAlign.center,
                            label: "Nothing Here!\nTab to notification settings button\nand check again.",
                            style: TextStyleTheme.textStyle15SemiBold,
                          ),
                          verticalSpace(16),
                          AppButton(
                            text: "Notification settings",
                            buttonStyle: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff70CCD2),
                              fixedSize: Size(204.w, 42.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            textStyle: TextStyleTheme.textStyle15SemiBold.copyWith(
                              color: AppColor.white,
                            ),
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) : SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
            children: [
              Row(
                children: [
                  CustomTextWidget(
                      label: "New",
                    style: TextStyleTheme.textStyle18SemiBold.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3.h,right: 1.w),
                    margin: EdgeInsets.only(left: 20.w),
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff9DEDFF),
                    ),
                    child: CustomTextWidget(
                      textAlign: TextAlign.center,
                      label: "6",
                      style: TextStyleTheme.textStyle12regular,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => verticalSpace(16),
                  itemBuilder: (context, index) => NotificationItem(),
                itemCount: 7,
              ),
            ],
          ),
      ),
    );
  }
}
