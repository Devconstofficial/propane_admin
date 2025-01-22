import 'package:propane_admin/utils/app_strings.dart';
import 'package:propane_admin/view/widgets/custom_button.dart';
import 'package:propane_admin/view/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/user_controller.dart';

class CreateUserScreen extends GetView<UserController> {
  const CreateUserScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () {
          CommonCode.unFocus(context);
        },
        child: Obx(() {
          return Scaffold(
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SideMenu(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 37,vertical: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kCreateNewUser,style: AppStyles.workSansTextStyle().copyWith(fontSize: 32.sp,fontWeight: FontWeight.w600),),
                              const SizedBox(height: 25,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kUserName,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kUserName,
                                      controller: controller.nameController,
                                      fillColor: kWhiteColor,
                                      borderColor: kFieldBorderColor,
                                        contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kEmail,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kEmail,
                                      fillColor: kWhiteColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.emailController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kAddress,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kAddress,
                                      fillColor: kWhiteColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.addressController,
                                     contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kPhoneNo,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  Container(
                                    width: width,
                                    height: 41,
                                    decoration: BoxDecoration(border: Border.all(color: kFieldBorderColor), borderRadius: AppStyles.customBorderAll,),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8),),
                                        child: InternationalPhoneNumberInput(
                                          onInputChanged: (PhoneNumber number) {
                                            controller.onPhoneNumberChanged(number);
                                          },
                                          onInputValidated: (bool value) {
                                            controller.isValid.value = value;
                                          },
                                          selectorConfig: const SelectorConfig(
                                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                            useBottomSheetSafeArea: true,
                                          ),
                                          spaceBetweenSelectorAndTextField: 0,
                                          ignoreBlank: false,
                                          autoValidateMode: AutovalidateMode.disabled,
                                          selectorTextStyle: const TextStyle(color: Colors.black),
                                          initialValue: controller.phoneNumber.value,
                                          textFieldController: controller.phNoController,
                                          formatInput: true,
                                          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                          inputBorder: InputBorder.none,
                                          inputDecoration: const InputDecoration(
                                              focusedBorder: InputBorder.none,
                                              hintText: "Phone Number",
                                              border: InputBorder.none,
                                              fillColor: kWhiteColor,
                                            focusColor: kWhiteColor,
                                            hoverColor: kWhiteColor,
                                            enabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(bottom: 18,),
                                            
                                          ),
                                          onSaved: (PhoneNumber number) {
                                            controller.phoneNumber.value = number;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 41,
                                  //   child: MyCustomTextField(
                                  //     hintText: kPhoneNo,
                                  //     fillColor: kWhiteColor,
                                  //     hintColor: kHintColor,
                                  //     borderColor: kFieldBorderColor,
                                  //     controller: controller.phNoController,
                                  //     contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                  //     onTap: (){
                                  //
                                  //     },
                                  //   ),
                                  // ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kOccupation,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kOccupation,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.occupationController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kAge,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kAge,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.ageController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kEmpStatus,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kEmpStatus,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.empStatusController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Obx(() => Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          controller.isFreeDelivery.value = !controller.isFreeDelivery.value;
                                        },
                                        child: Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(4.r),
                                            border: Border.all(
                                                color: kFieldBorderColor,
                                                width: 1.w
                                            ),
                                          ),
                                          child: controller.isFreeDelivery.value? const Center(child: Icon(Icons.check,size: 12,color: kBlackColor3,)) : null,
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text(kFirstTimeFreeDel,
                                        style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 14),textAlign: TextAlign.center,),
                                    ],
                                  ),),
                                  SizedBox(height: 12.h,),
                                  Obx(() => Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          controller.isPayCash.value = !controller.isPayCash.value;
                                        },
                                        child: Container(
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(4.r),
                                            border: Border.all(
                                                color: kFieldBorderColor,
                                                width: 1.w
                                            ),
                                          ),
                                          child: controller.isPayCash.value? const Center(child: Icon(Icons.check,size: 12,color: kBlackColor3,)) : null,
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text(kCanPayCash,
                                        style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,),
                                    ],
                                  ),),
                                  SizedBox(height: 22.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomButton(
                                        textColor: controller.isFormValid.value
                                            ? kWhiteColor
                                            : kDisableBtnTextColor,
                                        text: "CREATE", height: 40,width: 88,
                                        fontSize: 14.sp,
                                        onTap: (){
                                          Get.close(1);
                                        },
                                        color: controller.isFormValid.value
                                            ? kPrimaryColor
                                            : kDisableButtonColor,
                                        borderColor: controller.isFormValid.value
                                            ? kPrimaryColor
                                            : kDisableButtonColor,
                                      ),
                                      const SizedBox(width: 8,),
                                      CustomButton(
                                        text: "DISCARD CHANGES",
                                        height: 40,
                                        width: 171,
                                        fontSize: 14.sp,
                                        textColor: controller.isFormValid.value
                                            ? kWhiteColor
                                            : kDisableBtnTextColor,
                                        onTap: (){
                                        controller.clearFields();
                                      },
                                        color: controller.isFormValid.value
                                          ? kPrimaryColor
                                          : kDisableButtonColor,
                                        borderColor: controller.isFormValid.value
                                            ? kPrimaryColor
                                            : kDisableButtonColor,),
                                      const SizedBox(width: 8,),
                                      CustomButton(
                                        fontSize: 14.sp,
                                        textColor: kBlackColor,
                                        text: "CANCEL", height: 40,width: 90, onTap: (){
                                        Get.back();
                                      },color: kWhiteColor,borderColor: kFieldBorderColor,),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.isNotificationVisible.value,
                  child: NotificationAndActivitySection(
                    notifications: controller.notifications,
                    activities: controller.activities,
                  ),
                )
              ],
            ),
          );
        },)
    );
  }

}
