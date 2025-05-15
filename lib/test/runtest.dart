import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:our_market/core/AppServer/paymop_key.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    PaymentData.initialize(
      apiKey: apiKeypaymop,
      iframeId: iframeIdpaymop,
      integrationCardId: integrationCardId,
      integrationMobileWalletId: integrationMobileWalletId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentView(
                  onPaymentSuccess: () => log("✅ Payment Success"),
                  onPaymentError: () => log("❌ Payment Error"),
                  price: 100.0,
                ),
              ),
            );
          },
          child: Text("Test Payment"),
        ),
      ),
    );
  }
}
