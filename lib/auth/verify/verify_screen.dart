import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/design/app_button.dart';
import '../../core/design/custom_app_bar.dart';
import '../../core/design/title_text.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_strings.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_style_theme.dart';
import '../reset_password/reset_password_screen.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  const VerifyScreen({super.key, required this.email});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final formKey = GlobalKey<FormState>();
  final verifyCodeController = TextEditingController();
  final verifyCodeFocusNode = FocusNode();
  bool isTimerFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          children: [
            CustomTextWidget(
              label: AppStrings.pleaseCheckYourEmail,
              style: TextStyleTheme.textStyle26Bold,
            ),
            verticalSpace(10),
            CustomTextWidget(
              label: "We’ve sent a code to ${widget.email}",
              style: TextStyleTheme.textStyle16Regular,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(30),
            Form(
              key: formKey,
              child: PinCodeTextField(
                controller: verifyCodeController,
                obscureText: true,
                textStyle: TextStyleTheme.textStyle32medium,
                cursorColor: AppColor.primary,
                focusNode: verifyCodeFocusNode,
                textInputAction: TextInputAction.done,
                obscuringCharacter: "*",
                appContext: context,
                length: 4,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.hasNumber(value)) {
                    return "يرجي ادخل الكود";
                  }
                  return null;
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15.r),
                  fieldHeight: 64.h,
                  fieldWidth: 64.h,
                  inactiveColor: Color(0xffD8DADC),
                  selectedColor: AppColor.primary,
                  activeColor: AppColor.primary,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            verticalSpace(20),
            AppButton(
              textStyle: TextStyle(color: AppColor.white),
              text: AppStrings.verify,
              onPress: () {
                if (formKey.currentState!.validate()) {
                  navigateTo(toPage: ResetPasswordScreen());
                }
              },
            ),
            verticalSpace(22),
            isTimerFinished
                ? const SizedBox.shrink()
                : CircularCountDownTimer(
              duration: 60,
              initialDuration: 0,
              width: 66.w,
              height: 70.h,
              ringColor: AppColor.primary,
              fillColor: const Color(0xffD8D8D8),
              strokeWidth: 3,
              onComplete: () {
                isTimerFinished = true;
                setState(() {});
              },
              textStyle: TextStyleTheme.textStyle16SemiBold,
              textFormat: CountdownTextFormat.MM_SS,
              isReverseAnimation: true,
            ),
            verticalSpace(19),
            isTimerFinished
                ? Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColor.primary, width: 2),
                ),
                onPressed: () {
                  isTimerFinished = false;
                  setState(() {});
                },
                child: CustomTextWidget(
                  label: AppStrings.resendCode,
                  style: TextStyleTheme.textStyle16SemiBold,
                ),
              ),
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
