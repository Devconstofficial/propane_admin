import 'dart:developer';
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

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
                  child: Center(
                    child: Container(
                      // height: 562,
                      width: 585,
                      decoration: BoxDecoration(
                        borderRadius: AppStyles.searchFieldBorder20,
                        color: kWhiteColor
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: AppStyles().loginContainerPadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min  ,
                            children: [
                              Text(kWelcomeText,
                                style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,fontSize: 30,color: kBlackColor3),textAlign: TextAlign.center,),
                              SizedBox(height: 23,),
                              Text(kWelcomeDetail,
                                style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 18,color: kLightGrey),textAlign: TextAlign.center,),
                              SizedBox(height: 33,),
                              const MyCustomTextField(
                                hintText: "Enter your email address",
                                fillColor: kWhiteColor,
                                borderColor: kFieldBorderColor,
                              ),
                              SizedBox(height: 16,),
                              const MyCustomTextField(
                                hintText: "Password",
                                fillColor: kWhiteColor,
                                borderColor: kFieldBorderColor,
                                suffixIcon: Icons.remove_red_eye_outlined,
                              ),
                              SizedBox(height: 17,),
                              Obx(() => Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      controller.isChecked.value = !controller.isChecked.value;
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(2),
                                        border: Border.all(
                                            color: kFieldBorderColor,
                                            width: 1.w
                                        ),
                                      ),
                                      child: controller.isChecked.value? const Center(child: Icon(Icons.check,size: 12,color: kBlackColor3,)) : null,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(kRemember,
                                    style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 16,color: kPrimaryColor),textAlign: TextAlign.center,),
                                ],
                              ),),
                              SizedBox(height: 42,),
                              CustomButton(text: kLogin, height: 62, onTap: (){
                                Get.toNamed(kVerifyOtpScreenRoute);
                              })
                            ],
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

