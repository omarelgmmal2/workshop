import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_input.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';
import '../success_password_changed/success_password_changed_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          children: [
            CustomTextWidget(
              label: AppStrings.resetPassword,
              style: TextStyleTheme.textStyle30Bold,
            ),
            verticalSpace(10),
            CustomTextWidget(
              label: AppStrings.pleaseRemember,
              style: TextStyleTheme.textStyle16Regular,
            ),
            verticalSpace(30),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    label: AppStrings.password,
                    style: TextStyleTheme.textStyle14SemiBold,
                  ),
                  AppInput(
                    hintText: AppStrings.password,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    icon: AppImages.password,
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(confirmPasswordFocusNode);
                    },
                    isPassword: true,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return "كلمه المرور غير صحيحه";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    type: TextInputType.visiblePassword,
                    paddingBottom: 16.h,
                    paddingTop: 5.h,
                  ),
                  CustomTextWidget(
                    label: AppStrings.confirmPassword,
                    style: TextStyleTheme.textStyle14SemiBold,
                  ),
                  AppInput(
                    hintText: AppStrings.confirmPassword,
                    icon: AppImages.password,
                    isPassword: true,
                    validator: (value) {
                      if (value == null ||
                          value != passwordController.text ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return "كلمه المرور غير متطابقه";
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocusNode,
                    textInputAction: TextInputAction.done,
                    type: TextInputType.visiblePassword,
                    paddingBottom: 38.h,
                    paddingTop: 5.h,
                  ),
                ],
              ),
            ),
            AppButton(
              textStyle: TextStyle(color: AppColor.white),
              text: AppStrings.resetPassword,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(toPage: SuccessPasswordChangedScreen(),isRemove: true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
