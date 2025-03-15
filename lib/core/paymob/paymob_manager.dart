import 'package:dio/dio.dart';
import 'constant.dart';

class PayMobManager {

  // original function

  Future<String> getPaymentKey({required int amount,required String currency})async{
    try{
      String authToken = await _getAuthToken();
      int orderId = await _getOrderId(
        token: authToken,
        amount: (100 * amount).toString(),
        currency: currency,
      );
      String paymentKey = await _getPaymentKey(
        token: authToken,
        currency: currency,
        amount: (100 * amount).toString(),
        orderId: orderId.toString(),
      );
      return paymentKey;
    }catch(e){
      rethrow;
    }
  }

  // 1- one function

  Future<String> _getAuthToken()async{
    try{
      Response response = await Dio().post(
          "https://accept.paymob.com/api/auth/tokens",
          data: {
            "api_key" : PayMobConstant.apiKey,
          }
      );
      return response.data["token"];
    }catch(e){
      rethrow;
    }
  }

  // 2- two function

  Future<int> _getOrderId({required String token,required String amount,required String currency})async{
    try{
      Response response = await Dio().post(
          "https://accept.paymob.com/api/ecommerce/orders",
        data: {
            "auth_token" : token,
            "delivery_needed" : "false",
            "amount_cents" : amount,
            "currency" : currency,
            "items" : [],
        }
      );
      return response.data["id"];
    }catch(e){
      rethrow;
    }
  }

  // 3- third function

  Future<String> _getPaymentKey({required String token,required String orderId,required String amount,required String currency})async{
    try{
      Response response = await Dio().post(
          "https://accept.paymob.com/api/acceptance/payment_keys",
          data: {
            "auth_token" : token,
            "amount_cents" : amount,
            "order_id" : orderId,
            "currency" : currency,
            "integration_id" : PayMobConstant.paymentIntegration,
            "expiration" : "3600",
            "billing_data" : {
              "first_name" : "Omar",
              "last_name" : "Elgmmal",
              "email" : "omarelgmmal23@gmail.com",
              "phone_number" : "01062156826",
              "apartment" : "NA",
              "floor" : "NA",
              "street" : "NA",
              "building" : "NA",
              "shipping_method" : "NA",
              "postal_code" : "NA",
              "city" : "NA",
              "country" : "NA",
              "state" : "NA",
            },
          }
      );
      return response.data["token"];
    }catch(e){
      rethrow;
    }
  }

}