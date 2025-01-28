import 'package:propane_admin/utils/app_strings.dart';
import 'package:propane_admin/view/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/controller/menu_controller.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/driver_controller.dart';

class DriverScreen extends GetView<DriverController> {
  const DriverScreen({super.key});

  Widget statusUpdateDialogue(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.customBorder8,
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: AppStyles().paddingAll24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      kCrossIcon,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Update Status",
                style: AppStyles.workSansTextStyle()
                    .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: AppStyles.customBorder8,
                    border: Border.all(color: kFieldBorderColor)),
                child: Obx(() {
                  return DropdownButton<String>(
                    borderRadius: AppStyles.customBorder8,
                    isExpanded: true,
                    dropdownColor: kWhiteColor,
                    focusColor: kWhiteColor,
                    value: controller.selectedDriverStatus.value.isNotEmpty
                        ? controller.selectedDriverStatus.value
                        : null,
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        kStatus,
                        style: AppStyles.workSansTextStyle()
                            .copyWith(fontSize: 14.sp, color: kHintColor),
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(Icons.arrow_drop_down_outlined,
                          size: 25, color: kBlackColor.withOpacity(0.4)),
                    ),
                    underline: const SizedBox.shrink(),
                    items: [kActive, kPending, kRejected, kDisabled]
                        .map((String status) => DropdownMenuItem<String>(
                      value: status,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          status,
                          style: AppStyles.workSansTextStyle()
                              .copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ))
                        .toList(),
                    onChanged: (String? newValue) {
                      controller.selectedDriverStatus.value = newValue!;
                    },
                  );
                }),
              ),

              const SizedBox(
                height: 52,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "Cancel",
                    height: 40,
                    onTap: () {
                      Get.back();
                    },
                    width: 75,
                    textColor: kBlackColor,
                    color: kWhiteColor,
                    borderColor: kFieldBorderColor1,
                    fontSize: 14.sp,
                  ),
                  CustomButton(
                    text: "Update Now",
                    height: 40,
                    onTap: () {},
                    width: 110,
                    color: kPrimaryColor,
                    fontSize: 14.sp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget feeDialogue(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.customBorder8,
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: AppStyles().paddingAll24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      kCrossIcon,
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kFeePercentage,
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "*",
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500,color: kPrimaryColor),
                  ),
                ],
              ),
              Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: AppStyles.customBorder8,),
                  child: MyCustomTextField(
                    hintText: kFeePercentage,
                    borderColor: kFieldBorderColor,
                    fillColor: kWhiteColor,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  )
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kSpecifyRegion,
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "*",
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500,color: kPrimaryColor),
                  ),
                ],
              ),
              Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: AppStyles.customBorder8,),
                  child: MyCustomTextField(
                    hintText: kSpecifyRegion,
                    borderColor: kFieldBorderColor,
                    fillColor: kWhiteColor,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  )
              ),
              const SizedBox(
                height: 52,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "Cancel",
                    height: 40,
                    onTap: () {
                      Get.back();
                    },
                    width: 75,
                    textColor: kBlackColor,
                    color: kWhiteColor,
                    borderColor: kFieldBorderColor1,
                    fontSize: 14.sp,
                  ),
                  CustomButton(
                    text: "Update Now",
                    height: 40,
                    onTap: () {},
                    width: 110,
                    color: kPrimaryColor,
                    fontSize: 14.sp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget driverDetailDialogue(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.customBorder8,
      ),
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: AppStyles().paddingAll24,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        kCrossIcon,
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Driver ID",
                            style: AppStyles.workSansTextStyle()
                                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: AppStyles.customBorder8,),
                              child: const MyCustomTextField(
                                hintText: "Driver ID",
                                borderColor: kFieldBorderColor,
                                fillColor: kWhiteColor,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: AppStyles.workSansTextStyle()
                                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: AppStyles.customBorder8),
                              child: const MyCustomTextField(
                                hintText: "User Name",
                                borderColor: kFieldBorderColor,
                                fillColor: kWhiteColor,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: AppStyles.workSansTextStyle()
                                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: AppStyles.customBorder8,),
                              child: const MyCustomTextField(
                                hintText: "Email",
                                borderColor: kFieldBorderColor,
                                fillColor: kWhiteColor,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style: AppStyles.workSansTextStyle()
                                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: AppStyles.customBorder8,),
                              child: const MyCustomTextField(
                                hintText: "Phone Number",
                                borderColor: kFieldBorderColor,
                                fillColor: kWhiteColor,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kVehicleType,
                            style: AppStyles.workSansTextStyle()
                                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: AppStyles.customBorder8,),
                              child: MyCustomTextField(
                                hintText: kVehicleType,
                                borderColor: kFieldBorderColor,
                                fillColor: kWhiteColor,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kVehicleLiPlate,
                            style: AppStyles.workSansTextStyle()
                                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          Container(
                              height: 40,
                              width: width,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: AppStyles.customBorder8,),
                              child: MyCustomTextField(
                                hintText: kVehicleLiPlate,
                                borderColor: kFieldBorderColor,
                                fillColor: kWhiteColor,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Driver ID",
                  style: AppStyles.workSansTextStyle()
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: kPrimaryColor)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(
                          kRecieptImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("myprofile.jpg",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                        Text("240 KB",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                        Text("Nov 15-2024  19:50:25",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "ID Card",
                  style: AppStyles.workSansTextStyle()
                      .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: kPrimaryColor)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(
                          kRecieptImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("myprofile.jpg",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                        Text("240 KB",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                        Text("Nov 15-2024  19:50:25",style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Cancel",
                      height: 40,
                      onTap: () {
                        Get.back();
                      },
                      width: 75,
                      textColor: kBlackColor,
                      color: kWhiteColor,
                      borderColor: kFieldBorderColor1,
                      fontSize: 14.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () {
      CommonCode.unFocus(context);
    },
        child: Obx(
      () {
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
                      SizedBox(height: 32.h,),
                      Padding(
                        padding: AppStyles().horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              kDriverManagement,
                              style: AppStyles.workSansTextStyle().copyWith(
                                  fontSize: 32.sp, fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Container(
                              height: 41,
                              width: width / 4.5,
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: kFieldBorderColor)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: SizedBox(
                                          // width: width / 5.5,
                                          child: TextField(
                                            style: AppStyles.workSansTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w400),
                                            decoration: InputDecoration(
                                                hintText: 'Search',
                                                fillColor: kWhiteColor,
                                                hintStyle: AppStyles.workSansTextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: ksuffixColor.withOpacity(0.2)),
                                                contentPadding: const EdgeInsets.only(top: 8),
                                                prefixIcon: Icon(
                                                  Icons.search_sharp,
                                                  size: 16,
                                                  color: ksuffixColor.withOpacity(0.2),
                                                ),
                                                focusColor: kWhiteColor,
                                                hoverColor: kWhiteColor,
                                                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
                                                border: const UnderlineInputBorder(borderSide: BorderSide.none)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      '⌘/',
                                      style: AppStyles.interTextStyle()
                                          .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ksuffixColor.withOpacity(0.2)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  controller.toggleNotificationVisibility();
                                },
                                child: Image.asset(
                                  kNotification1Icon,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: AppStyles().horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kFilterContainerColor,
                                      border: Border.all(color: kTableBorderColor)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                                        child: SvgPicture.asset(
                                          kFilterIcon,
                                          height: 23,
                                          width: 20,
                                          colorFilter: const ColorFilter.mode(kBlackColor, BlendMode.srcIn),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: kLightGreyColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                                        child: Text(
                                          kFilterBy,
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: kLightGreyColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.w),
                                        child: Text(
                                          controller.selectedUserStatus.value.isNotEmpty ?
                                          controller.selectedUserStatus.value : "User Status",
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kBlackColor4),
                                        ),
                                      ),
                                      PopupMenuButton<String>(
                                        color: kWhiteColor,
                                        position: PopupMenuPosition.under,
                                        shape: OutlineInputBorder(
                                            borderRadius: AppStyles.customBorder8,
                                            borderSide: BorderSide.none),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 16),
                                        onSelected: (value) {
                                          controller.selectedUserStatus.value = value;
                                        },
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            value: 'Active',
                                            child: Text('Active',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Pending',
                                            child: Text('Pending',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Rejected',
                                            child: Text('Rejected',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Disabled',
                                            child: Text('Disabled',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 1,
                                        color: kLightGreyColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 16.w),
                                        child: Text(
                                          controller.selectedLocation.value.isNotEmpty ?
                                          controller.selectedLocation.value : "Location",
                                          style: AppStyles.workSansTextStyle()
                                              .copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kBlackColor4),
                                        ),
                                      ),
                                      PopupMenuButton<String>(
                                        color: kWhiteColor,
                                        position: PopupMenuPosition.under,
                                        shape: OutlineInputBorder(
                                            borderRadius: AppStyles.customBorder8,
                                            borderSide: BorderSide.none),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 16),
                                        onSelected: (value) {
                                          controller.selectedLocation.value = value;
                                        },
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            value: 'Location 1',
                                            child: Text('Region 1',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Location 2',
                                            child: Text('Region 2',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Location 3',
                                            child: Text('Region 3',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Location 4',
                                            child: Text('Region 4',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                        ],
                                      ),
                                      controller.selectedUserStatus.value.isNotEmpty || controller.selectedLocation.value.isNotEmpty ? Row(
                                        children: [
                                          Container(
                                            width: 1,
                                            color: kLightGreyColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                                            child: InkWell(
                                              onTap: (){
                                                controller.selectedUserStatus.value = '';
                                                controller.selectedLocation.value = '';
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.refresh,
                                                    color: kPrimaryColor,
                                                    size: 18,
                                                  ),
                                                  SizedBox(width: 8.w,),
                                                  Text(
                                                    "Reset Filter",
                                                    style: AppStyles.workSansTextStyle()
                                                        .copyWith(
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight.w600,
                                                        color: kPrimaryColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ) : const SizedBox()
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                CustomButton(text: kDeliveryFee, height: 56, onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return feeDialogue(context);
                                    },
                                  );
                                },width: 191.w,fontSize: 16.sp,),
                                SizedBox(width: 18.w),
                                CustomButton(text: kCreateDriver, height: 56, onTap: (){
                                  final menuController = Get.put(MenuControllers());
                                  Get.toNamed(kCreateDriverScreenRoute);
                                  menuController.onItemTapped(2);
                                },width: 171.w,fontSize: 16.sp,),
                                ],
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.r),
                                  topRight: Radius.circular(14.r),
                                ),
                                border: Border.all(
                                    color: kTableBorderColor, width: 0.3),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 49,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14.r),
                                        topRight: Radius.circular(14.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: DataTable(
                                      headingRowHeight: 49,
                                      columnSpacing: 0,
                                      columns: [
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Driver ID",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Name",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Vehicle Type",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Vehicle License Plate",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                          headingRowAlignment: MainAxisAlignment.center,
                                        ),
                                        DataColumn(
                                          headingRowAlignment: MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Status",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          headingRowAlignment:
                                              MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Actions",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: controller.currentPageUsers
                                          .map((user) => _buildDataRow(
                                              user['id']!,
                                              user['name']!,
                                              user['vehicleType']!,
                                              user['vehicleLP']!,
                                              user['status']!,
                                              user['statusBackColor'],
                                              user['StatusColor'],
                                              context))
                                          .toList(),
                                      dataRowMaxHeight: 65,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 51.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: controller.isBackButtonDisabled
                                      ? null
                                      : controller.goToPreviousPage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: controller.isBackButtonDisabled
                                          ? kWhiteColor
                                          : kPrimaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.isBackButtonDisabled
                                            ? kCreamColor
                                            : kPrimaryColor,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_back_ios_new_outlined,
                                            size: 12,
                                            color:
                                                controller.isBackButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Back',
                                          style: AppStyles.interTextStyle()
                                              .copyWith(
                                            fontSize: 12,
                                            color:
                                                controller.isNextButtonDisabled
                                                    ? kWhiteColor
                                                    : kBlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                ...List.generate(
                                  controller.totalPages,
                                  (index) {
                                    bool isSelected = index + 1 ==
                                        controller.currentPage.value;
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.changePage(index + 1),
                                      child: Padding(
                                        padding:
                                            AppStyles().paginationBtnPadding,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? kPrimaryColor
                                                : kWhiteColor,
                                            border: Border.all(
                                              color: isSelected
                                                  ? kPrimaryColor
                                                  : kCreamColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: Text(
                                              (index + 1).toString(),
                                              style: AppStyles.interTextStyle()
                                                  .copyWith(
                                                fontSize: 12,
                                                color: isSelected
                                                    ? kWhiteColor
                                                    : kBlackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 6,),
                                GestureDetector(
                                  onTap: controller.isNextButtonDisabled
                                      ? null
                                      : controller.goToNextPage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: controller.isNextButtonDisabled
                                          ? kWhiteColor
                                          : kPrimaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.isNextButtonDisabled
                                            ? kCreamColor
                                            : kPrimaryColor,
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Next',
                                          style: AppStyles.interTextStyle()
                                              .copyWith(
                                            fontSize: 12,
                                            color:
                                                controller.isNextButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 12,
                                            color:
                                                controller.isNextButtonDisabled
                                                    ? kBlackColor
                                                    : kWhiteColor),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return Visibility(
                  visible: controller.isNotificationVisible.value,
                  child: NotificationAndActivitySection(
                    notifications: controller.notifications,
                    activities: controller.activities,
                  ),
                );
              }),
            ],
          ),
        );
      },
    ));
  }

  DataRow _buildDataRow(String id, String name, String vehicleType, String vehicleLiPlate, String status,
      Color statusColor, Color statusBackColor, context) {

    return DataRow(
      cells: [
        DataCell(Text(
          id,
          textAlign: TextAlign.center,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
                  name,
                  textAlign: TextAlign.center,
                  style: AppStyles.workSansTextStyle()
          .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                )),
        DataCell(Text(
                  vehicleType,
                  textAlign: TextAlign.center,
                  style: AppStyles.workSansTextStyle()
          .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                )),
        DataCell(Center(
          child: Text(
                    vehicleLiPlate,
                    textAlign: TextAlign.center,
                    style: AppStyles.workSansTextStyle()
            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
        )),
        DataCell(
          Center(
            child: Container(
              width: 93.w,
              height: 27,
              decoration: BoxDecoration(
                color: statusBackColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  status,
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: statusColor),
                ),
              ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Container(
              height: 32,
              width: 138.w,
              decoration: BoxDecoration(
                  borderRadius: AppStyles.customBorder8,
                  color: kActionsBtnColor,
                  border: Border.all(color: kTableBorderColor, width: 0)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return statusUpdateDialogue(context);
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kEditIcon,
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: kLightGreyColor,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteDialog(
                                onDelete: () {},
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kDeleteIcon,
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: kLightGreyColor,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return driverDetailDialogue(context);
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kEyeIcon,
                          height: 19.h,
                          width: 19.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
