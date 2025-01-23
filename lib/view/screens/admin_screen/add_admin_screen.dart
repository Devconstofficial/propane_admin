import 'package:propane_admin/utils/app_strings.dart';
import 'package:propane_admin/view/widgets/custom_button.dart';
import 'package:propane_admin/view/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/admin_controller.dart';

class AddAdminScreen extends GetView<AdminController> {
  const AddAdminScreen({super.key});

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
                              Text(kCreateAdmin,style: AppStyles.workSansTextStyle().copyWith(fontSize: 32.sp,fontWeight: FontWeight.w600),),
                              const SizedBox(height: 18,),
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
                                      Text(kPassword,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kPassword,
                                      fillColor: kWhiteColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.passController,
                                     contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kConfirmPassword,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kConfirmPassword,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.confirmPassController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  SizedBox(height: 27.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(kRole,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w500),),
                                      Text("*",style: AppStyles.workSansTextStyle().copyWith(color: kPrimaryColor,fontWeight: FontWeight.w500,fontSize: 14.sp,),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 41,
                                    child: MyCustomTextField(
                                      hintText: kRole,
                                      fillColor: kWhiteColor,
                                      hintColor: kHintColor,
                                      borderColor: kFieldBorderColor,
                                      controller: controller.roleController,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                      onTap: (){

                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 36,),
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
