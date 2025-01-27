import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:propane_admin/utils/app_strings.dart';
import 'package:propane_admin/view/screens/job_management_screen/controller/job_management_controller.dart';
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
import 'package:dotted_border/dotted_border.dart';


class JobDetailScreen extends GetView<JobController> {
  const JobDetailScreen({super.key});


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
                              Text(kActiveJobDetails,style: AppStyles.workSansTextStyle().copyWith(fontSize: 32.sp,fontWeight: FontWeight.w600),),
                              const SizedBox(height: 25,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 2.3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Job ID (Type)",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 41,
                                          child: MyCustomTextField(
                                            hintText: "Andrew",
                                            controller: controller.nameController,
                                            fillColor: kWhiteColor,
                                            borderColor: kFieldBorderColor,
                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                          ),
                                        ),
                                        SizedBox(height: 27.h,),
                                        Text("Tank Size",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 41,
                                          child: MyCustomTextField(
                                            hintText: "Tank Size",
                                            fillColor: kWhiteColor,
                                            borderColor: kFieldBorderColor,
                                            controller: controller.emailController,
                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                          ),
                                        ),
                                        SizedBox(height: 27.h,),
                                        Text(kPickupLocation,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 41,
                                          child: MyCustomTextField(
                                            hintText: kPickupLocation,
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
                                        Text(kDeliveryLocation,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 41,
                                          child: MyCustomTextField(
                                            hintText: kDeliveryLocation,
                                            fillColor: kWhiteColor,
                                            hintColor: kHintColor,
                                            borderColor: kFieldBorderColor,
                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                            onTap: (){

                                            },
                                          ),
                                        ),
                                        SizedBox(height: 27.h,),
                                        Text(kDeliveryCharges,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 41,
                                          child: MyCustomTextField(
                                            hintText: kDeliveryCharges,
                                            fillColor: kWhiteColor,
                                            hintColor: kHintColor,
                                            borderColor: kFieldBorderColor,
                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                            onTap: (){

                                            },
                                          ),
                                        ),
                                        SizedBox(height: 27.h,),
                                        Text(kPlatformCommission,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 41,
                                          child: MyCustomTextField(
                                            hintText: kPlatformCommission,
                                            fillColor: kWhiteColor,
                                            hintColor: kHintColor,
                                            borderColor: kFieldBorderColor,
                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.w),
                                            onTap: (){

                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 30.w,),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Text(kSchPickTime,style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500),),
                                          Text("22-12-2024  6:15 PM",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w600,color: kPrimaryColor),),
                                          const SizedBox(height: 6,),
                                          SizedBox(
                                            height: 400,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10.r),
                                              child: GoogleMap(
                                                initialCameraPosition: const CameraPosition(
                                                  target: LatLng(37.7749, -122.4194),
                                                  zoom: 14.0,
                                                ),
                                                markers: {
                                                  const Marker(
                                                    markerId: MarkerId('Park'),
                                                    position: LatLng(37.7749, -122.4194),
                                                    icon: BitmapDescriptor.defaultMarker,
                                                  ),
                                                },
                                                zoomControlsEnabled: false,
                                                buildingsEnabled: true,
                                                onMapCreated: controller.onMapCreated,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 85.h,),
                              Container(
                                height: 80,
                                color: kWhiteColor,
                                child: Stepper(
                                  type: StepperType.horizontal,
                                  elevation: 0,
                                  currentStep: controller.currentStep.value,
                                  onStepTapped: (step) => controller.goToStep(step),
                                  onStepContinue: controller.nextStep,
                                  onStepCancel: controller.previousStep,
                                  steps: List.generate(5, (index) {
                                    return Step(
                                      title: Text(
                                        'Step ${index + 1}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: index == controller.currentStep.value
                                              ? kPrimaryColor
                                              : Colors.grey,
                                        ),
                                      ),
                                      content: const SizedBox.shrink(),
                                      isActive: index <= controller.currentStep.value,
                                      state: index < controller.currentStep.value
                                          ? StepState.complete
                                          : (index == controller.currentStep.value
                                          ? StepState.editing
                                          : StepState.indexed),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(height: 44.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 61,
                                        width: 61,
                                        decoration: BoxDecoration(
                                          borderRadius: AppStyles.customBorderAll100
                                        ),
                                        child: ClipRRect(
                                          borderRadius: AppStyles.customBorderAll100,
                                            child: Image.asset(kAdminImage,fit: BoxFit.cover,)),
                                      ),
                                      SizedBox(width: 9.w),
                                      Column(
                                        children: [
                                          Text('Driver',style: AppStyles.workSansTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w600,color: ksuffix2Color)),
                                          SizedBox(height: 14.h),
                                          Row(
                                            children: [
                                              SvgPicture.asset(kStarIcon,height: 12,width: 12,),
                                              SizedBox(width: 6.w),
                                              Text('4.8 (73)',style: AppStyles.workSansTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: ksuffix2Color)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 79.w),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(borderRadius: AppStyles.customBorderAll100,border: Border.all(color: ksuffix2Color.withOpacity(0.2),width: 2)),
                                        child: Center(child: SvgPicture.asset(kMessageIcon,height: 18,width: 18,)),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 61,
                                        width: 61,
                                        decoration: BoxDecoration(
                                          borderRadius: AppStyles.customBorderAll100
                                        ),
                                        child: ClipRRect(
                                          borderRadius: AppStyles.customBorderAll100,
                                            child: Image.asset(kAdminImage,fit: BoxFit.cover,)),
                                      ),
                                      SizedBox(width: 9.w),
                                      Column(
                                        children: [
                                          Text('Driver',style: AppStyles.workSansTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w600,color: ksuffix2Color)),
                                          SizedBox(height: 14.h),
                                          Row(
                                            children: [
                                              SvgPicture.asset(kStarIcon,height: 12,width: 12,),
                                              SizedBox(width: 6.w),
                                              Text('4.8 (73)',style: AppStyles.workSansTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: ksuffix2Color)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 79.w),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(borderRadius: AppStyles.customBorderAll100,border: Border.all(color: ksuffix2Color.withOpacity(0.2),width: 2)),
                                        child: Center(child: SvgPicture.asset(kMessageIcon,height: 18,width: 18,)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Center(child: CustomButton(text: "BACK", height: 40, onTap: (){
                                Get.close(1);
                              },width: 71,borderColor: kFieldBorderColor,color: kWhiteColor,textColor: kBlackColor,fontSize: 14,)),
                              SizedBox(height: 25.h,),
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
