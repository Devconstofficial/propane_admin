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
import '../../widgets/message_dialog.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/admin_controller.dart';

class AdminScreen extends GetView<AdminController> {
  const AdminScreen({super.key});


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
                              kAdminManagement,
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
                                          controller.selectedAdminType.value.isNotEmpty ?
                                          controller.selectedAdminType.value : "Admin Type",
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
                                          controller.selectedAdminType.value = value;
                                        },
                                        itemBuilder: (BuildContext context) => [
                                          PopupMenuItem(
                                            value: 'Customer Service',
                                            child: Text('Customer Service',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Read Only',
                                            child: Text('Read Only',style: AppStyles.interTextStyle()
                                                .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),),
                                          ),
                                          PopupMenuItem(
                                            value: 'Regional',
                                            child: Text('Regional',style: AppStyles.interTextStyle()
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
                                        ],
                                      ),
                                      controller.selectedAdminType.value.isNotEmpty || controller.selectedLocation.value.isNotEmpty ? Row(
                                        children: [
                                          Container(
                                            width: 1,
                                            color: kLightGreyColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                                            child: InkWell(
                                              onTap: (){
                                                controller.selectedAdminType.value = '';
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
                                CustomButton(text: kCreateAdmin, height: 56, onTap: (){
                                  final menuController = Get.put(MenuControllers());
                                  Get.toNamed(kAddAdminScreenRoute);
                                  menuController.onItemTapped(8);
                                },width: 171,)
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
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
                                      columns: [
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Admin ID",
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
                                              "Reports Posted",
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
                                              "Status",
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
                                              user['id']!,
                                              user['name']!,
                                              user['type']!,
                                              user['Last Activity']!,
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

  DataRow _buildDataRow(String id, String name, String type, String lastActivity, context) {

    return DataRow(
      cells: [
        DataCell(Text(
          id,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
                  name,
                  style: AppStyles.workSansTextStyle()
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                )),
        DataCell(Text(
                  type,
                  style: AppStyles.workSansTextStyle()
          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                )),
        DataCell(Text(
          lastActivity,
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MessageScreenDialogue();
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kChatIcon,
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
