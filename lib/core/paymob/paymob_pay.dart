import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workshop_app/core/design/app_button.dart';
import 'package:workshop_app/core/paymob/paymob_manager.dart';
import '../utils/text_style_theme.dart';

class PayMobPay extends StatelessWidget {
  const PayMobPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(
            text: "Pay",
          textStyle: TextStyleTheme.textStyle18SemiBold,
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff0AA7CB),
          ),
          onPress: () {
              // هتاخد ال method دي تحطها عندك في ال onTap بتاع زرار ال check out
              PayMobManager().getPaymentKey(
                // هتحط المتغير بتاع ال sub total السعر هنا في ال amount
                  amount: 100,
                  currency: "EGP",
              ).then((String paymentKey){
                launchUrl(
                  Uri.parse("https://accept.paymob.com/api/acceptance/iframes/896164?payment_token=$paymentKey"),
                );
              });
          },
        ),
      ),
    );
  }
}
