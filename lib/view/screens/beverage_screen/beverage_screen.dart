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
import '../../side_menu/side_menu.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/filter_btn.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/beverage_controller.dart';

class BeverageScreen extends GetView<BeverageController> {
  const BeverageScreen({super.key});

  Widget addBeverageDialogue(BuildContext context) {
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
              Center(
                child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Stack(
                        children: [
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: AppStyles.customBorderAll100
                              ),
                              child: ClipRRect(
                                borderRadius: AppStyles.customBorderAll100,
                                child: controller.selectedImage.value == null
                                    ? Image.asset(
                                  kTankImage,
                                  fit: BoxFit.cover,
                                )
                                    : Image.memory(
                                  controller.selectedImage.value!,
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: (){
                                controller.pickImage();
                              },
                              child: CircleAvatar(
                                radius: 20.r,
                                backgroundColor: kPrimaryColor,
                                child: Center(
                                  child: Image.asset(
                                      kCameraIcon,
                                      height: 15,
                                      width: 15
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    )
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: AppStyles.customBorder8,),
                  child: const MyCustomTextField(
                    hintText: "Name",
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
                    "Price",
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: AppStyles.customBorder8,),
                  child: const MyCustomTextField(
                    hintText: "Price",
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
                    "Assign Region",
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ],
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
                    value: controller.selectedRegion.value.isNotEmpty
                        ? controller.selectedRegion.value
                        : null,
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Specify Region",
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
                    items: ["Region 1", "Region 2", "Region 3"]
                        .map((String region) => DropdownMenuItem<String>(
                      value: region,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          region,
                          style: AppStyles.workSansTextStyle()
                              .copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ))
                        .toList(),
                    onChanged: (String? newValue) {
                      controller.selectedRegion.value = newValue!;
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add-on Eligibility",
                    style: AppStyles.workSansTextStyle()
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                ],
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
                    value: controller.selectedEligibility.value.isNotEmpty
                        ? controller.selectedEligibility.value
                        : null,
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Yes/no",
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
                    items: ["Yes", "No"]
                        .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          value,
                          style: AppStyles.workSansTextStyle()
                              .copyWith(fontSize: 14.sp),
                        ),
                      ),
                    ))
                        .toList(),
                    onChanged: (String? newValue) {
                      controller.selectedEligibility.value = newValue!;
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 52,
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
                          const SizedBox(height: 32,),
                          Padding(
                            padding: AppStyles().horizontal,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  kBeverageManagement,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              colorFilter: ColorFilter.mode(kBlackColor, BlendMode.srcIn),
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
                                              controller.selectedPrice.value.isNotEmpty ?
                                              controller.selectedPrice.value : "Price",
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
                                              controller.selectedPrice.value = value;
                                            },
                                            itemBuilder: (BuildContext context) => [
                                              PopupMenuItem(
                                                value: 'Price 1',
                                                child: Text('Price 1',style: AppStyles.interTextStyle()
                                                    .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),),
                                              ),
                                              PopupMenuItem(
                                                value: 'Price 2',
                                                child: Text('Price 2',style: AppStyles.interTextStyle()
                                                    .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),),
                                              ),
                                              PopupMenuItem(
                                                value: 'Price 3',
                                                child: Text('Price 3',style: AppStyles.interTextStyle()
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
                                              controller.selectRegion.value.isNotEmpty ?
                                              controller.selectRegion.value : "Region",
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
                                              controller.selectRegion.value = value;
                                            },
                                            itemBuilder: (BuildContext context) => [
                                              PopupMenuItem(
                                                value: 'Region 1',
                                                child: Text('Region 1',style: AppStyles.interTextStyle()
                                                    .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),),
                                              ),
                                              PopupMenuItem(
                                                value: 'Region 2',
                                                child: Text('Region 2',style: AppStyles.interTextStyle()
                                                    .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),),
                                              ),
                                              PopupMenuItem(
                                                value: 'Region 3',
                                                child: Text('Region 3',style: AppStyles.interTextStyle()
                                                    .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),),
                                              ),
                                              PopupMenuItem(
                                                value: 'Region 4',
                                                child: Text('Region 4',style: AppStyles.interTextStyle()
                                                    .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),),
                                              ),
                                            ],
                                          ),
                                          controller.selectedPrice.value.isNotEmpty || controller.selectRegion.value.isNotEmpty ? Row(
                                            children: [
                                              Container(
                                                width: 1,
                                                color: kLightGreyColor,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                                child: InkWell(
                                                  onTap: (){
                                                    controller.selectedPrice.value = '';
                                                    controller.selectRegion.value = '';
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
                                          ) : SizedBox()
                                        ],
                                      ),
                                    ),
                                    CustomButton(text: kAddBeverage, height: 56, onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return addBeverageDialogue(context);
                                        },
                                      );
                                    },width: 171,)
                                  ],
                                ),
                                const SizedBox(
                                  height: 32,
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
                                        decoration: const BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(14),
                                            topRight: Radius.circular(14),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width,
                                        child: DataTable(
                                          headingRowHeight: 49,
                                          columns: [
                                            DataColumn(
                                              label: Flexible(
                                                child: Text(
                                                  "Name",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: kWhiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Flexible(
                                                child: Text(
                                                  "Price",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: kWhiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Flexible(
                                                child: Text(
                                                  "Add-on Eligible",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: kWhiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Flexible(
                                                child: Text(
                                                  "Region Assignment",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style:
                                                  AppStyles.workSansTextStyle()
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
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
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: kWhiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: controller.currentPageUsers
                                              .map((user) => _buildDataRow(
                                              user['name']!,
                                              user['price']!,
                                              user['add-on']!,
                                              user['region']!,
                                              context))
                                              .toList(),
                                          dataRowMaxHeight: 65,
                                          columnSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 51,
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
                                          )
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
                                      width: 12,
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
                                                borderRadius:
                                                BorderRadius.circular(4),
                                                border: Border.all(
                                                  color: isSelected
                                                      ? kPrimaryColor
                                                      : kCreamColor,
                                                ),
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
                                    // const SizedBox(width: 12,),
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
                                            )

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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 32,),

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

  DataRow _buildDataRow( String name,double price, String addOn, String region, context) {

    return DataRow(
      cells: [
        DataCell(Text(
          name,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          price.toString(),
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          addOn,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          region,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )),
        DataCell(
          Center(
            child: Container(
              height: 32,
              width: 96,
              decoration: BoxDecoration(
                  borderRadius: AppStyles.customBorder8,
                  color: kActionsBtnColor,
                  border: Border.all(color: kTableBorderColor, width: 0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
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

                        },
                        child: SvgPicture.asset(
                          kEditIcon,
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
