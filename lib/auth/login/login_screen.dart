import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workshop_app/auth/sign_up/sign_up_screen.dart';
import 'package:workshop_app/core/design/app_input.dart';
import 'package:workshop_app/core/design/custom_app_bar.dart';
import 'package:workshop_app/core/design/custom_rich_text.dart';
import 'package:workshop_app/core/design/title_text.dart';
import 'package:workshop_app/core/logic/helper_methods.dart';
import 'package:workshop_app/core/utils/app_strings.dart';
import 'package:workshop_app/core/utils/assets.dart';
import 'package:workshop_app/core/utils/spacing.dart';
import 'package:workshop_app/core/utils/text_style_theme.dart';
import '../../core/design/app_button.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/app_color.dart';
import '../../view/home/home_view.dart';
import '../forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          children: [
            CustomTextWidget(
              label: AppStrings.login,
              style: TextStyleTheme.textStyle30Bold,
            ),
            verticalSpace(30),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    label: AppStrings.email,
                    style: TextStyleTheme.textStyle14SemiBold,
                  ),
                  AppInput(
                    hintText: AppStrings.email,
                    controller: emailController,
                    focusNode: emailFocusNode,
                    icon: AppImages.email,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isEmailValid(value)) {
                        return "ادخل بريدك الالكتروني مجددا";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passwordFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    paddingBottom: 16.h,
                    paddingTop: 5.h,
                  ),
                  CustomTextWidget(
                    label: AppStrings.password,
                    style: TextStyleTheme.textStyle14SemiBold,
                  ),
                  AppInput(
                    hintText: AppStrings.password,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    icon: AppImages.password,
                    isPassword: true,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return "كلمه المرور غير صحيحه";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    type: TextInputType.visiblePassword,
                    paddingBottom: 16.h,
                    paddingTop: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateTo(toPage: ForgotPasswordScreen());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextWidget(
                        label: AppStrings.forgotPassword,
                        style: TextStyleTheme.textStyle14SemiBold.copyWith(
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(38),
            AppButton(
              textStyle: TextStyle(color: AppColor.white),
              text: AppStrings.login,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(toPage: HomeView());
                }
              },
            ),
            verticalSpace(40),
            CustomRichText(
              text: AppStrings.newAccount,
              subText: AppStrings.signUp,
              onTap: () {
                navigateTo(toPage: SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
