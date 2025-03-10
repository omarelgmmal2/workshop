import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/auth/reset_password/reset_password_screen.dart';
import 'package:workshop_app/core/design/app_button.dart';
import 'package:workshop_app/core/logic/helper_methods.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/view/widget/account_item.dart';
import '../../../core/design/app_image.dart';
import '../../../core/design/custom_app_bar.dart';
import '../../../core/design/title_text.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/text_style_theme.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 140.h,
        padding: EdgeInsets.only(left: 20.w),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100.r),
          bottomRight: Radius.circular(100.r),
        ),
        hideBack: true,
        action: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h,right: 110.w,bottom: 16.h),
              child: CustomTextWidget(
                label: "Welcome",
                style: TextStyleTheme.textStyle30Bold.copyWith(
                  color: AppColor.white,
                ),
              ),
            ),
            Row(
              children: [
                AppImage(
                  AppImages.user,
                ),
                horizontalSpace(5),
                Padding(
                  padding: EdgeInsets.only(right: 110.w),
                  child: CustomTextWidget(
                    label: "AutoMatic",
                    style: TextStyleTheme.textStyle15Bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 100.h),
          child: CustomTextWidget(
            label: "Profile",
            style: TextStyleTheme.textStyle20Bold,
          ),
        ),
        gradient: LinearGradient(
          colors: [
            AppColor.primary.withOpacity(.86),
            Color(0xffC0FFDA),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Column(
            children: [
              verticalSpace(66),
              AccountItem(
                  title: "Edit  Profile",
                  icon: AppImages.edit,
                onTap: () {},
              ),
              verticalSpace(56),
              AccountItem(
                title: "Change password",
                icon: AppImages.lock,
                onTap: () {
                  navigateTo(toPage: ResetPasswordScreen());
                },
              ),
              verticalSpace(56),
              AccountItem(
                title: "Support",
                icon: AppImages.help,
                onTap: () {},
              ),
              verticalSpace(56),
              AccountItem(
                title: "Log Out",
                icon: AppImages.logOut,
                onTap: () {},
              ),
              verticalSpace(70),
              AppButton(
                  text: "Delete Account",
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffBB0B31),
                    fixedSize: Size(245.w, 36.h),
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
    );
  }
}
