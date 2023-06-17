import 'package:app_intervention/controller/auth_controller.dart';
import 'package:app_intervention/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/intervetion_intro_widget.dart';
import '../widgets/otp_verification_widget.dart';
import 'register_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  String phoneNumber;
  OtpVerificationScreen(this.phoneNumber, {super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.phoneAuth(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                intervetionIntroWidget(),
                Positioned(
                  top: 60,
                  left: 30,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.greenColor,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            otpVerificationWidget(),
          ],
        ),
      ),
    );
  }
}