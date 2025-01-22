import 'dart:developer';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:propane_admin/utils/app_strings.dart';
import 'package:propane_admin/view/screens/auth_screen/controller/auth_controller.dart';
import 'package:propane_admin/view/widgets/custom_button.dart';
import 'package:propane_admin/view/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/side_menu.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () {
          CommonCode.unFocus(context);
        },
        child: Scaffold(
          body: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: Image.asset(kLoginBackground,fit: BoxFit.cover,),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      color: kBlackColor.withOpacity(0.5)
                  ),
                ),
                SizedBox(
                  height: height,
                  width: width,
                  child: SvgPicture.asset(kLoginBackground1,fit: BoxFit.fill,),
                ),
                SizedBox(
                    height: height,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Container(
                          // height: 434,
                          width: 533,
                          decoration: BoxDecoration(
                              borderRadius: AppStyles.searchFieldBorder20,
                              color: kWhiteColor
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(46),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(kTwoFactor,
                                    style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,fontSize: 30.sp,color: kBlackColor3),textAlign: TextAlign.center,),
                                  SizedBox(height: 18,),
                                  Text(kTwoFactorDetail,
                                    style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 18.sp,color: kLightGrey),textAlign: TextAlign.center,),
                                  SizedBox(height: 60,),
                                  OTPTextField(
                                    // controller: controller.otpController,
                                    length: 5,
                                    width: MediaQuery.of(context).size.width,
                                    textFieldAlignment: MainAxisAlignment.spaceAround,
                                    fieldWidth: 69,
                                    contentPadding: EdgeInsets.symmetric(vertical: 26),
                                    otpFieldStyle: OtpFieldStyle(focusBorderColor: kPrimaryColor,),
                                    fieldStyle: FieldStyle.box,
                                    outlineBorderRadius: 10.r,
                                    style: const TextStyle(fontSize: 17),
                                    onChanged: (pin){

                                    },
                                    onCompleted: (pin) async {

                                    },
                                  ),
                                  SizedBox(height: 60,),
                                  CustomButton(text: kVerify, height: 62, onTap: (){
                                    Get.toNamed(kDashboardScreenRoute);
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}

