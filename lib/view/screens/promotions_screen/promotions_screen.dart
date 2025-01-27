import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:propane_admin/view/widgets/custom_button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/delete_dialog.dart';
import '../../widgets/reuseable_datarow.dart';
import 'controller/promotion_controller.dart';


class PromotionScreen extends GetView<PromotionsController> {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () {
          CommonCode.unFocus(context);
        },
        child: Obx(() => Scaffold(
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
                        padding: AppStyles().horizontal30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                                  () {
                                return Wrap(
                                  runSpacing: 23,
                                  spacing: 23,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 0;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 236.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 0 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kFirstTimeDelivery,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 1;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 225.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 1 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kDiscountManagement,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 2;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 202.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 2 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kRegionalPromotion,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 3;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 206.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 3 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kSeasonalPromotion,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 4;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 180.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 4 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kReferralPromotion,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 5;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 180.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 5 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kPopUps,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        controller.selectedIndex.value = 6;
                                        controller.currentFTDeliveryPage.value = 1;
                                      },
                                      child: Container(
                                        height: 56,
                                        width: 180.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.selectedIndex.value == 6 ? kPrimaryColor : kPrimaryColor.withOpacity(0.3)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Center(
                                            child: Text(
                                              kAddCoupon,
                                              style: AppStyles.workSansTextStyle().copyWith(fontWeight: FontWeight.w600,color: kWhiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            if(controller.selectedIndex.value == 0 )
                            Row(
                              children: [
                                Text(
                                  kFirstTimeDelivery,
                                  style: AppStyles.workSansTextStyle().copyWith(
                                      fontSize: 24.sp, fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                              ],
                            ),
                            if(controller.selectedIndex.value == 1 )
                              Row(
                                children: [
                                  Text(
                                    kDiscountManagement,
                                    style: AppStyles.workSansTextStyle().copyWith(
                                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  CustomButton(text: "Create Discount", height: 30, onTap: (){},width: 142.w,fontSize: 12.sp,),
                                  SizedBox(width: 22.w),
                                  CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                                ],
                              ),
                            if(controller.selectedIndex.value == 2 )
                              Row(
                                children: [
                                  Text(
                                    kRegionalPromotion,
                                    style: AppStyles.workSansTextStyle().copyWith(
                                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  CustomButton(text: "Create Promotion", height: 30, onTap: (){},width: 142.w,fontSize: 12.sp,),
                                  SizedBox(width: 22.w),
                                  CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                                ],
                              ),
                            if(controller.selectedIndex.value == 3 )
                              Row(
                                children: [
                                  Text(
                                    kSeasonalPromotion,
                                    style: AppStyles.workSansTextStyle().copyWith(
                                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  CustomButton(text: "Create Promotion", height: 30, onTap: (){},width: 142.w,fontSize: 12.sp,),
                                  SizedBox(width: 22.w),
                                  CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                                ],
                              ),
                            if(controller.selectedIndex.value == 4 )
                              Row(
                                children: [
                                  Text(
                                    kReferralPromotion,
                                    style: AppStyles.workSansTextStyle().copyWith(
                                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                                ],
                              ),
                            if(controller.selectedIndex.value == 5 )
                              Row(
                                children: [
                                  Text(
                                    "Pop-Up",
                                    style: AppStyles.workSansTextStyle().copyWith(
                                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  CustomButton(text: "Create Popup", height: 30, onTap: (){},width: 128.w,fontSize: 12.sp,),
                                  SizedBox(width: 22.w),
                                  CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                                ],
                              ),
                            if(controller.selectedIndex.value == 6 )
                              Row(
                                children: [
                                  Text(
                                    "Coupon Overview",
                                    style: AppStyles.workSansTextStyle().copyWith(
                                        fontSize: 24.sp, fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  CustomButton(text: "Add Coupon", height: 30, onTap: (){},width: 128.w,fontSize: 12.sp,),
                                  SizedBox(width: 22.w),
                                  CustomButton(text: kDisableAll, height: 30, onTap: (){},width: 111.w,fontSize: 12.sp,)
                                ],
                              ),
                            SizedBox(
                              height: 24.h,
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
                                      columns: [
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              controller.selectedIndex.value == 5 ? "Title" :
                                              controller.selectedIndex.value == 6 ? "Coupon Name" : "User ID",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppStyles.workSansTextStyle().copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              controller.selectedIndex.value == 5 ? "Subtitle" :
                                              controller.selectedIndex.value == 6 ? "Amount" : "Name",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.workSansTextStyle()
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if(controller.selectedIndex.value == 6)
                                          DataColumn(
                                            label: Flexible(
                                              child: Text(
                                                "User Name",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style:
                                                AppStyles.workSansTextStyle()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  color: kWhiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        if(controller.selectedIndex.value == 6)
                                          DataColumn(
                                            label: Flexible(
                                              child: Text(
                                                "Expiration Date",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style:
                                                AppStyles.workSansTextStyle()
                                                    .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  color: kWhiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              controller.selectedIndex.value == 0 ? "Location (City)" :
                                              controller.selectedIndex.value == 1 ? "Discount Percentage" :
                                              controller.selectedIndex.value == 5 ? "Date Created" :
                                              controller.selectedIndex.value == 6 ? "Reason/Notes" : "Region",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.workSansTextStyle()
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
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
                                              controller.selectedIndex.value == 4 ? "Progress" : "Status",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.workSansTextStyle()
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
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
                                              "Action",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.workSansTextStyle()
                                                  .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: kWhiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: controller.currentPageFirstDelivery.map((item) {
                                        int index = controller.selectedIndex.value == 0 ? controller.fTimeDeliveryList.indexOf(item) :
                                        controller.selectedIndex.value == 1 ? controller.dPercentList.indexOf(item) :
                                        controller.selectedIndex.value == 2 ? controller.regionalPromotionList.indexOf(item) :
                                        controller.selectedIndex.value == 3 ? controller.seasonalPromotionList.indexOf(item) :
                                        controller.selectedIndex.value == 4 ? controller.referralPromotionList.indexOf(item) :
                                        controller.popupList.indexOf(item);
                                        if(controller.selectedIndex.value == 6){
                                          return _buildDataRow(
                                              item['cName'], item['amount'], item['name'], item['expDate'], item['cName'], item['status'], context);
                                        }else {
                                          return CustomDataRow(
                                              column1Text: item[controller.selectedIndex.value == 5 ? 'title' : 'id']!,
                                              column2Text: item[controller.selectedIndex.value == 5 ? 'subtitle' : 'name']!,
                                              column3Text: item[controller.selectedIndex.value == 0 ? 'location' :
                                              controller.selectedIndex.value == 1 ? 'dPercent' :
                                              controller.selectedIndex.value == 5 ? 'dataCreated' : 'region'],
                                              column4Text: item[controller.selectedIndex.value == 4 ? 'progress' : 'status']!,
                                              index: index,
                                              isSwitchOn: controller.selectedIndex.value == 0 ? item['isSwitchOn'] ?? false : false,
                                              onSwitchChanged: controller.selectedIndex.value == 0 ? (value, index) {
                                                controller.fTimeDeliveryList[index]['isSwitchOn'] = value;
                                                controller.update();
                                              } : (value, index) {},
                                              context: context,
                                              isSwitchButton: controller.selectedIndex.value == 0 ? true : false
                                          ).buildRow();
                                        }
                                      }).toList(),
                                      dataRowMaxHeight: 65,
                                      columnSpacing: 0,
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
                                  onTap: controller.isFTDBackButtonDisabled
                                      ? null
                                      : controller.goToFTDPreviousPage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: controller.isFTDBackButtonDisabled
                                          ? kWhiteColor
                                          : kPrimaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.isFTDBackButtonDisabled
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
                                            controller.isFTDBackButtonDisabled
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
                                            controller.isFTDBackButtonDisabled
                                                ? kBlackColor
                                                : kWhiteColor,
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
                                        controller.currentFTDeliveryPage.value;
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.changeFTDPage(index + 1),
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
                                GestureDetector(
                                  onTap: controller.isFTDNextButtonDisabled
                                      ? null
                                      : controller.goToFTDNextPage,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: controller.isFTDNextButtonDisabled
                                          ? kWhiteColor
                                          : kPrimaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: controller.isFTDNextButtonDisabled
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
                                            controller.isFTDNextButtonDisabled
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
                                            controller.isFTDNextButtonDisabled
                                                ? kBlackColor
                                                : kWhiteColor),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 44.h,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),)
    );
  }

  DataRow _buildDataRow(String cName, String amount, String userName, String expDate,String reason,String status,context) {
    return DataRow(
      cells: [
        DataCell(Text(
          cName,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          amount,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          userName,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          expDate,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          reason,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(
          Center(
            child: Container(
              width: 93.w,
              height: 27,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  status,
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ),
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

                        },
                        child: SvgPicture.asset(
                          kEditIcon,
                          height: 18,
                          width: 18,
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
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
