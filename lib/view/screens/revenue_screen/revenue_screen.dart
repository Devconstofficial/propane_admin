import 'package:flutter_svg/svg.dart';
import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/controller/menu_controller.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/revenue_controller.dart';

class RevenueScreen extends GetView<RevenueController> {
  RevenueScreen({super.key});

  final menuController = Get.put(MenuControllers());

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
                    Padding(
                      padding: AppStyles().horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
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
                          SizedBox(
                            height: 39.h,
                          ),
                          Row(
                              children: [
                                Text(
                                  kRevenueText,
                                  style: AppStyles.workSansTextStyle().copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Obx(() => Text(
                                      controller.selectedRegion.value,
                                      style: AppStyles.interTextStyle()
                                          .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
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
                                        controller.selectedRegion.value = value;
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
                                  ],
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                Row(
                                  children: [
                                    Obx(() => Text(
                                      controller.selectedValue.value,
                                      style: AppStyles.interTextStyle()
                                          .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
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
                                        controller.updateValue(value);
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        const PopupMenuItem(
                                          value: 'Last 7 Days',
                                          child: Text('Last 7 Days'),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Last 2 Weeks',
                                          child: Text('Last 2 Weeks'),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Last 1 Month',
                                          child: Text('Last 1 Month'),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Last 3 Months',
                                          child: Text('Last 3 Months'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 280.h,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: fl.BarChart(
                                fl.BarChartData(
                                  alignment: fl.BarChartAlignment.spaceBetween,
                                  maxY: 160,
                                  gridData: const fl.FlGridData(
                                      show: true,
                                      drawHorizontalLine: false,
                                      drawVerticalLine: false),
                                  titlesData: fl.FlTitlesData(
                                    leftTitles: fl.AxisTitles(
                                      sideTitles: fl.SideTitles(
                                        showTitles: true,
                                        reservedSize: 112,
                                        interval: 40,
                                        getTitlesWidget: (value, meta) {
                                          if (value % 40 == 0) {
                                            return Text(
                                              value.toInt().toString(),
                                              style: TextStyle(
                                                color: kBarChartTextColor,
                                                fontSize: 12.sp,
                                              ),
                                            );
                                          }
                                          return Container();
                                        },
                                      ),
                                    ),
                                    bottomTitles: fl.AxisTitles(
                                      sideTitles: fl.SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          TextStyle style = AppStyles.interTextStyle().copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                            color: kBarChartTextColor,
                                          );
                                          Widget label;
                                          switch (value.toInt()) {
                                            case 0:
                                              label = Text('Sep 10', style: style);
                                              break;
                                            case 1:
                                              label = Text('Sep 11', style: style);
                                              break;
                                            case 2:
                                              label = Text('Sep 12', style: style);
                                              break;
                                            case 3:
                                              label = Text('Sep 13', style: style);
                                              break;
                                            case 4:
                                              label = Text('Sep 14', style: style);
                                              break;
                                            case 5:
                                              label = Text('Sep 15', style: style);
                                              break;
                                            case 6:
                                              label = Text('Sep 16', style: style);
                                              break;
                                            default:
                                              label = const Text('');
                                              break;
                                          }
                                          return Padding(
                                            padding: const EdgeInsets.only(top: 9.0),
                                            child: label,
                                          );
                                        },
                                      ),
                                    ),
                                    rightTitles: const fl.AxisTitles(
                                        sideTitles:
                                        fl.SideTitles(showTitles: false)),
                                    topTitles: const fl.AxisTitles(
                                        sideTitles:
                                        fl.SideTitles(showTitles: false)),
                                  ),
                                  borderData: fl.FlBorderData(
                                    show: false,
                                  ),
                                  barGroups: controller.barChartData,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 72.h,
                          ),
                          Text(
                            kUserPayment,
                            style: AppStyles.workSansTextStyle().copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(() => Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
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
                                        controller.selectedUserDateStatus.value.isNotEmpty ?
                                        controller.selectedUserDateStatus.value : "Date",
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
                                        controller.selectedUserDateStatus.value = value;
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Last 7 Days',
                                          child: Text('Last 7 Days',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 2 Weeks',
                                          child: Text('Last 2 Weeks',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 1 Month',
                                          child: Text('Last 1 Month',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 3 Month',
                                          child: Text('Last 3 Month',style: AppStyles.interTextStyle()
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
                                        controller.selectedUserLocation.value.isNotEmpty ?
                                        controller.selectedUserLocation.value : "Location",
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
                                        controller.selectedUserLocation.value = value;
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
                                    Container(
                                      width: 1,
                                      color: kLightGreyColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.w),
                                      child: Text(
                                        controller.selectedUserAmount.value.isNotEmpty ?
                                        controller.selectedUserAmount.value : "Amount",
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
                                        controller.selectedUserAmount.value = value;
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Amount 1',
                                          child: Text('Amount 1',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Amount 2',
                                          child: Text('Amount 2',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Amount 3',
                                          child: Text('Amount 3',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                      ],
                                    ),
                                    controller.selectedUserDateStatus.value.isNotEmpty ||
                                        controller.selectedUserLocation.value.isNotEmpty || controller.selectedUserAmount.value.isNotEmpty ?
                                    Row(
                                      children: [
                                        Container(
                                          width: 1,
                                          color: kLightGreyColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                                          child: InkWell(
                                            onTap: (){
                                              controller.selectedUserDateStatus.value = '';
                                              controller.selectedUserLocation.value = '';
                                              controller.selectedUserAmount.value = '';
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
                              ),),
                              Expanded(
                                  child: SizedBox(
                                    child: Wrap(
                                      alignment: WrapAlignment.end,
                                      runSpacing: 18,
                                      spacing: 18,
                                      children: [
                                        CustomButton(text: kTransactionFee, height: 56, onTap: (){

                                        },width: 189.w,fontSize: 16.sp,),
                                        CustomButton(text: kPlatformFee, height: 56, onTap: (){

                                        },width: 218.w,fontSize: 16.sp,),
                                      ],
                                    ),
                                  )
                              )
                            ],
                          ),
                          SizedBox(height: 32.h,),
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
                                            "Booking ID",
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
                                      DataColumn(
                                        label: Flexible(
                                          child: Text(
                                            "Location",
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
                                            "Driver Name",
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
                                            "Amount",
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
                                            "Actions",
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
                                    rows: controller.currentPageUserPayments
                                        .map((user) => _buildUserDataRow(
                                        user['id']!,
                                        user['name']!,
                                        user['location']!,
                                        user['driverName']!,
                                        user['amount']!,
                                        context))
                                        .toList(),
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
                                onTap: controller.isUserBackButtonDisabled
                                    ? null
                                    : controller.goToUserPreviousPage,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: controller.isUserBackButtonDisabled
                                        ? kWhiteColor
                                        : kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: controller.isUserBackButtonDisabled
                                          ? kCreamColor
                                          : kPrimaryColor,
                                    ),                                        ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios_new_outlined,
                                          size: 12,
                                          color:
                                          controller.isUserBackButtonDisabled
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
                                          controller.isUserNextButtonDisabled
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
                                controller.totalUserPages,
                                    (index) {
                                  bool isSelected = index + 1 ==
                                      controller.currentUserPage.value;
                                  return GestureDetector(
                                    onTap: () =>
                                        controller.changeUserPage(index + 1),
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
                                onTap: controller.isUserNextButtonDisabled
                                    ? null
                                    : controller.goToUserNextPage,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: controller.isUserNextButtonDisabled
                                        ? kWhiteColor
                                        : kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: controller.isUserNextButtonDisabled
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
                                          controller.isUserNextButtonDisabled
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
                                          controller.isUserNextButtonDisabled
                                              ? kBlackColor
                                              : kWhiteColor),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h,),
                          Text(
                            kDriverPayout,
                            style: AppStyles.workSansTextStyle().copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
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
                                        controller.selectedDriverDateStatus.value.isNotEmpty ?
                                        controller.selectedDriverDateStatus.value : "Date",
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
                                        controller.selectedDriverDateStatus.value = value;
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Last 7 Days',
                                          child: Text('Last 7 Days',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 2 Weeks',
                                          child: Text('Last 2 Weeks',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 1 Month',
                                          child: Text('Last 1 Month',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 3 Month',
                                          child: Text('Last 3 Month',style: AppStyles.interTextStyle()
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
                                        controller.selectedDriverLocation.value.isNotEmpty ?
                                        controller.selectedDriverLocation.value : "Location",
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
                                        controller.selectedDriverLocation.value = value;
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
                                    Container(
                                      width: 1,
                                      color: kLightGreyColor,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 16.w),
                                      child: Text(
                                        controller.selectedDriverAmount.value.isNotEmpty ?
                                        controller.selectedDriverAmount.value : "Amount",
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
                                        controller.selectedDriverAmount.value = value;
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Amount 1',
                                          child: Text('Amount 1',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Amount 2',
                                          child: Text('Amount 2',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Amount 3',
                                          child: Text('Amount 3',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                      ],
                                    ),
                                    controller.selectedDriverDateStatus.value.isNotEmpty ||
                                        controller.selectedDriverLocation.value.isNotEmpty || controller.selectedDriverAmount.value.isNotEmpty ?
                                    Row(
                                      children: [
                                        Container(
                                          width: 1,
                                          color: kLightGreyColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                                          child: InkWell(
                                            onTap: (){
                                              controller.selectedDriverDateStatus.value = '';
                                              controller.selectedDriverLocation.value = '';
                                              controller.selectedDriverAmount.value = '';
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
                              ),),
                              CustomButton(text: kDeliveryCharges, height: 56, onTap: (){

                              },width: 189.w,fontSize: 16.sp,),
                            ],
                          ),
                          SizedBox(height: 32.h,),
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
                                            "Booking ID",
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
                                            "Driver Name",
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
                                            "Driver ID",
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
                                            "Driver Vehicle",
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
                                            "Amount",
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
                                            "Actions",
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
                                    rows: controller.currentPageDriverPayouts
                                        .map((user) => _buildDriverDataRow(
                                        user['id']!,
                                        user['name']!,
                                        user['driverId']!,
                                        user['driverVehicle']!,
                                        user['amount']!,
                                        context))
                                        .toList(),
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
                                onTap: controller.isDriverBackButtonDisabled
                                    ? null
                                    : controller.goToUserPreviousPage,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: controller.isDriverBackButtonDisabled
                                        ? kWhiteColor
                                        : kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: controller.isDriverBackButtonDisabled
                                          ? kCreamColor
                                          : kPrimaryColor,
                                    ),                                        ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios_new_outlined,
                                          size: 12,
                                          color:
                                          controller.isDriverBackButtonDisabled
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
                                          controller.isDriverNextButtonDisabled
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
                                controller.totalDriverPages,
                                    (index) {
                                  bool isSelected = index + 1 ==
                                      controller.currentDriverPage.value;
                                  return GestureDetector(
                                    onTap: () =>
                                        controller.changeDriverPage(index + 1),
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
                                onTap: controller.isDriverNextButtonDisabled
                                    ? null
                                    : controller.goToDriverNextPage,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: controller.isDriverNextButtonDisabled
                                        ? kWhiteColor
                                        : kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: controller.isDriverNextButtonDisabled
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
                                          controller.isDriverNextButtonDisabled
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
                                          controller.isDriverNextButtonDisabled
                                              ? kBlackColor
                                              : kWhiteColor),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h,),
                          Text(
                            "Tips",
                            style: AppStyles.workSansTextStyle().copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Obx(() => Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
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
                                        controller.selectedTipsDateStatus.value.isNotEmpty ?
                                        controller.selectedTipsDateStatus.value : "Date",
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
                                        controller.selectedTipsDateStatus.value = value;
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Last 7 Days',
                                          child: Text('Last 7 Days',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 2 Weeks',
                                          child: Text('Last 2 Weeks',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 1 Month',
                                          child: Text('Last 1 Month',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Last 3 Month',
                                          child: Text('Last 3 Month',style: AppStyles.interTextStyle()
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
                                        controller.selectedTipsAmount.value.isNotEmpty ?
                                        controller.selectedTipsAmount.value : "Amount",
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
                                        controller.selectedTipsAmount.value = value;
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        PopupMenuItem(
                                          value: 'Amount 1',
                                          child: Text('Amount 1',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Amount 2',
                                          child: Text('Amount 2',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Amount 3',
                                          child: Text('Amount 3',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                      ],
                                    ),
                                    controller.selectedTipsDateStatus.value.isNotEmpty || controller.selectedTipsAmount.value.isNotEmpty ?
                                    Row(
                                      children: [
                                        Container(
                                          width: 1,
                                          color: kLightGreyColor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                                          child: InkWell(
                                            onTap: (){
                                              controller.selectedUserDateStatus.value = '';
                                              controller.selectedUserAmount.value = '';
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
                              ),),
                            ],
                          ),
                          SizedBox(height: 32.h,),
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
                                            "Booking ID",
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
                                            "Driver Name",
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
                                            "Driver ID",
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
                                            "Location",
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
                                            "Amount",
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
                                            "Actions",
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
                                    rows: controller.currentPageTips
                                        .map((user) => _buildTipsDataRow(
                                        user['id']!,
                                        user['name']!,
                                        user['driverId']!,
                                        user['location']!,
                                        user['amount']!,
                                        context))
                                        .toList(),
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
                                onTap: controller.isTipsBackButtonDisabled
                                    ? null
                                    : controller.goToTipsPreviousPage,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: controller.isTipsBackButtonDisabled
                                        ? kWhiteColor
                                        : kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: controller.isTipsBackButtonDisabled
                                          ? kCreamColor
                                          : kPrimaryColor,
                                    ),                                        ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back_ios_new_outlined,
                                          size: 12,
                                          color:
                                          controller.isTipsBackButtonDisabled
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
                                          controller.isTipsNextButtonDisabled
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
                                controller.totalTipsPages,
                                    (index) {
                                  bool isSelected = index + 1 ==
                                      controller.currentTipsPage.value;
                                  return GestureDetector(
                                    onTap: () =>
                                        controller.changeTipsPage(index + 1),
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
                                onTap: controller.isTipsNextButtonDisabled
                                    ? null
                                    : controller.goToTipsNextPage,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: controller.isTipsNextButtonDisabled
                                        ? kWhiteColor
                                        : kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: controller.isTipsNextButtonDisabled
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
                                          controller.isTipsNextButtonDisabled
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
                                          controller.isTipsNextButtonDisabled
                                              ? kBlackColor
                                              : kWhiteColor),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50.h,),
                        ],
                      ),
                    )
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
            })
          ],
        ),
      )),
    );
  }

  DataRow _buildUserDataRow(String id, String name, String location, String driverName,String amount,context) {

    return DataRow(
      cells: [
        DataCell(Text(
          id,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          name,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          location,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          driverName,
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
                  "\$$amount",
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
              width: MediaQuery.of(context).size.width / 11,
              height: 34,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  "View",
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DataRow _buildDriverDataRow(String id, String name, String driverId, String driverVehicle,String amount,context) {

    return DataRow(
      cells: [
        DataCell(Text(
          id,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          name,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          driverId,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          driverVehicle,
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
                  "\$$amount",
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
              width: MediaQuery.of(context).size.width / 11,
              height: 34,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  "View",
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DataRow _buildTipsDataRow(String id, String name, String driverId, String location,String amount,context) {

    return DataRow(
      cells: [
        DataCell(Text(
          id,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          name,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          driverId,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          location,
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
                  "\$$amount",
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
              width: MediaQuery.of(context).size.width / 11,
              height: 34,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  "View",
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
