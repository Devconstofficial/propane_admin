import 'package:flutter_svg/svg.dart';
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
import 'controller/driver_controller.dart';
import 'package:dotted_border/dotted_border.dart';


class CreateDriverScreen extends GetView<DriverController> {
  const CreateDriverScreen({super.key});


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
                              Text(kCreateNewDriver,style: AppStyles.workSansTextStyle().copyWith(fontSize: 32.sp,fontWeight: FontWeight.w600),),
                              const SizedBox(height: 25,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kFullName,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kFullName,
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
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kVehicleType,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kVehicleType,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.vTypeController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kVehicleLiPlate,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kVehicleLiPlate,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.liPlateController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Vehicle Document',style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500)),
                                              const SizedBox(height: 4),
                                              Obx(() {
                                                return GestureDetector(
                                                  child: controller.selectedImage.value == null
                                                      ? DottedBorder(
                                                    color: kBackGroundColor,
                                                    strokeWidth: 1,
                                                    padding: const EdgeInsets.all(0),
                                                    dashPattern: const [10, 10],
                                                    child: Container(
                                                      height: 180,
                                                      width: width,
                                                      decoration: BoxDecoration(
                                                          borderRadius: AppStyles.customBorder8
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 28),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SvgPicture.asset(
                                                              kGalleryIcon,
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            Text(
                                                              "Drag and drop image here, or click add image",
                                                              style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xff858D9D)),
                                                            ),
                                                            CustomButton(text: "Add Image", height: 40, onTap: (){
                                                              controller.pickImage();
                                                            },width: 100,color: kBackGroundColor1,borderColor: kBackGroundColor1,textColor: kBlackColor,fontSize: 14,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                      : DottedBorder(
                                                    color: kBackGroundColor,
                                                    strokeWidth: 1,
                                                    padding: const EdgeInsets.all(0),
                                                    dashPattern: const [10, 10],
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors.click,
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          controller.pickImage();
                                                        },
                                                        child: Container(
                                                          height: 180,
                                                          width: width,
                                                          decoration: BoxDecoration(
                                                              borderRadius: AppStyles.customBorder8,
                                                              border: Border.all(color: kFieldBorderColor)),
                                                          child: ClipRRect(
                                                            borderRadius: AppStyles.customBorder8,
                                                            child: Image.memory(
                                                              controller.selectedImage.value!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 64.w),
                                      Expanded(
                                        child: SizedBox(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('ID Card',style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500)),
                                              const SizedBox(height: 4),
                                              Obx(() {
                                                return GestureDetector(
                                                  child: controller.selectedCardImage.value == null
                                                      ? DottedBorder(
                                                    color: kDashedBorderColor,
                                                    strokeWidth: 1,
                                                    padding: const EdgeInsets.all(0),
                                                    dashPattern: const [10, 10],
                                                    child: Container(
                                                      height: 180,
                                                      width: width,
                                                      decoration: BoxDecoration(
                                                          borderRadius: AppStyles.customBorder8
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 28),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SvgPicture.asset(
                                                              kGalleryIcon,
                                                              height: 16,
                                                              width: 16,
                                                            ),
                                                            Text(
                                                              "Drag and drop image here, or click add image",
                                                              style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: const Color(0xff858D9D)),
                                                            ),
                                                            CustomButton(text: "Add Image", height: 40, onTap: (){
                                                              controller.pickCardImage();
                                                            },width: 100,color: kBackGroundColor1,borderColor: kBackGroundColor1,textColor: kBlackColor,fontSize: 14,),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                      : DottedBorder(
                                                    color: kDashedBorderColor,
                                                    strokeWidth: 1,
                                                    padding: const EdgeInsets.all(0),
                                                    dashPattern: const [10, 10],
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors.click,
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          controller.pickCardImage();
                                                        },
                                                        child: Container(
                                                          height: 180,
                                                          width: width,
                                                          decoration: BoxDecoration(
                                                              borderRadius: AppStyles.customBorder8,
                                                              border: Border.all(color: kFieldBorderColor)),
                                                          child: ClipRRect(
                                                            borderRadius: AppStyles.customBorder8,
                                                            child: Image.memory(
                                                              controller.selectedCardImage.value!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },),

                                            ],
                                          ),
                                        ),
                                      ),
                                      ],
                                  ),
                                  SizedBox(height: 53.h,),
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
                                        Get.close(1);
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
