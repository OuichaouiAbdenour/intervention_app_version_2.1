import 'package:app_intervention/utils/app_constants.dart';
import 'package:app_intervention/views/otp_verification_screen.dart';
import 'package:app_intervention/widgets/text_widget.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

Widget registerWidget(CountryCode countryCode, Function onCountryChange, Function onSubmit) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: AppConstants.helloNiceToMeetYou),
        textWidget(
            text: AppConstants.LetGoWithIntervetionApp,
            fontsize: 20,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    spreadRadius: 3,
                    blurRadius: 3),
              ],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => onCountryChange(),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(child: countryCode.flagImage),
                        ),
                        textWidget(text: countryCode.dialCode),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 55,
                color: Colors.black.withOpacity(0.2),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onSubmitted: (String? input)=> onSubmit(input),
                    decoration: InputDecoration(
                        hintText: AppConstants.enterMobileNumber,
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
              children: [
                TextSpan(
                  text: AppConstants.byCreating + " ",
                ),
                TextSpan(
                    text: AppConstants.termsOfService + " ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: "and ",
                ),
                TextSpan(
                    text: AppConstants.privacyPolicy + " ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
