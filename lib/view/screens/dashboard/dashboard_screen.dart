import 'package:propane_admin/view/screens/dashboard/controller/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:propane_admin/view/widgets/custom_textField.dart';
import 'package:propane_admin/view/widgets/dashboard-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/controller/menu_controller.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/notifiction_panel.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  final menuController = Get.put(MenuControllers());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CommonCode.unFocus(context);
      },
      child: Scaffold(
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
                      padding: AppStyles().paddingAll21,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () {
                                  return Text(
                                    controller.selectedTodayValue.value,
                                    style: AppStyles.workSansTextStyle()
                                        .copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                  );
                                },
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
                                  controller.updateValue1(value);
                                },
                                itemBuilder: (BuildContext context) => [
                                  const PopupMenuItem(
                                    value: 'Today',
                                    child: Text('Today'),
                                  ),
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
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Wrap(
                            runSpacing: 28,
                            spacing: 28,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(kUserScreenRoute);
                                    menuController.onItemTapped(1);
                                  },
                                  child: DashboardContainer(
                                    width: 202,
                                    height: 112,
                                    color: kPrimaryColor,
                                    percent: '+11.01%',
                                    title: kActiveUsers,
                                    totalNumber: '1200',
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(kAnalyticsScreenRoute);
                                  menuController.onItemTapped(6);
                                },
                                child: DashboardContainer(
                                  width: 202,
                                  height: 112,
                                  color: kOrangeColor,
                                  percent: '-0.03%',
                                  title: kRevenue,
                                  totalNumber: '120',
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(kAnalyticsScreenRoute);
                                    menuController.onItemTapped(6);
                                  },
                                  child: DashboardContainer(
                                    width: 202,
                                    height: 112,
                                    color: kBlueColor,
                                    percent: '+15.03',
                                    title: kBookingThisWeek,
                                    totalNumber: '\$85',
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    Get.toNamed(kUserScreenRoute);
                                    menuController.onItemTapped(8);
                                  },
                                  child: DashboardContainer(
                                    width: 202,
                                    height: 112,
                                    color: kLightOrangeColor,
                                    percent: '',
                                    title: kActiveAdmins,
                                    totalNumber: '12',
                                    showPercent: false,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
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
                            height: 36,
                          ),
                          SizedBox(
                            height: 280.h,
                            child: fl.BarChart(
                              fl.BarChartData(
                                alignment: fl.BarChartAlignment.spaceBetween,
                                maxY: 160,
                                gridData: const fl.FlGridData(
                                    show: true,
                                    horizontalInterval: 40,
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
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 394,
                            child: Row(
                              children: [
                                Container(
                                  height: 394,
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: AppStyles.customBorder16,
                                    border: Border.all(color: kBlackColor.withOpacity(0.08))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:24,bottom: 28,left: 28,right: 28),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                    kAgeRange,
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  )),
                                            ],
                                          ),
                                          Obx(
                                                () => Center(
                                              child: PieChart(
                                                dataMap: controller.dataMap.value,
                                                chartRadius: 210.w,
                                                chartType: ChartType.disc,
                                                ringStrokeWidth: 32,
                                                centerText: "",
                                                animationDuration:
                                                const Duration(seconds: 2),
                                                colorList: controller.colorList,
                                                chartValuesOptions:
                                                ChartValuesOptions(
                                                  showChartValuesInPercentage:
                                                  true,
                                                  showChartValuesOutside: false,
                                                  decimalPlaces: 0,
                                                  showChartValueBackground: false,
                                                  chartValueStyle:
                                                  AppStyles.interTextStyle()
                                                      .copyWith(
                                                    color: kWhiteColor,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                legendOptions:
                                                const LegendOptions(
                                                  showLegends: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Wrap(
                                              runSpacing: 24,
                                              spacing: 24,
                                              children: List.generate(
                                                controller.dataMap.length,
                                                    (index) {
                                                  final label = controller
                                                      .dataMap.keys
                                                      .toList()[index];
                                                  final color =
                                                  controller.colorList[index];
                                                  return SizedBox(
                                                    width: 79,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 8,
                                                          height: 6,
                                                          decoration: BoxDecoration(
                                                            color: color,
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 7),
                                                        Text(label,
                                                            style: AppStyles
                                                                .interTextStyle()
                                                                .copyWith(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color:
                                                                kBlackColor1))
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(width: 32.w),
                                Expanded(
                                  // flex: 2,
                                  child: Container(
                                    height: 394,
                                    decoration: BoxDecoration(
                                        borderRadius: AppStyles.customBorder16,
                                        border: Border.all(color: kBlackColor.withOpacity(0.08))
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 28.0.h,horizontal: 8.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left:28.0.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  "Occupations",
                                                  style: AppStyles.interTextStyle()
                                                      .copyWith(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )),
                                                Row(
                                                  children: [
                                                    Obx(() => Text(
                                                          controller
                                                              .selectedValue1.value,
                                                          style: AppStyles
                                                                  .interTextStyle()
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                        )),
                                                    PopupMenuButton<String>(
                                                      color: kWhiteColor,
                                                      position:
                                                          PopupMenuPosition.under,
                                                      shape: OutlineInputBorder(
                                                          borderRadius:
                                                              AppStyles.customBorder8,
                                                          borderSide:
                                                              BorderSide.none),
                                                      icon: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                          size: 16),
                                                      onSelected: (value) {
                                                        controller
                                                            .updateValue2(value);
                                                      },
                                                      itemBuilder:
                                                          (BuildContext context) => [
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
                                                          child:
                                                              Text('Last 3 Months'),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Text(
                                                    "Number of Users",
                                                    style: TextStyle(
                                                      color: kBarChartTextColor,
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 280,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 16.0.w,bottom: 8),
                                                    child: fl.BarChart(
                                                      fl.BarChartData(
                                                        alignment: fl.BarChartAlignment
                                                            .spaceBetween,
                                                        maxY: 160,
                                                        gridData: const fl.FlGridData(
                                                            show: true,
                                                            horizontalInterval: 40,
                                                            drawHorizontalLine: false,
                                                            drawVerticalLine: false),
                                                        titlesData: fl.FlTitlesData(
                                                          leftTitles: fl.AxisTitles(
                                                            sideTitles: fl.SideTitles(
                                                              showTitles: true,
                                                              reservedSize: 32,
                                                              interval: 40,
                                                              getTitlesWidget:
                                                                  (value, meta) {
                                                                if (value % 40 == 0) {
                                                                  return Text(
                                                                    value
                                                                        .toInt()
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                      color:
                                                                          kBarChartTextColor,
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
                                                          rightTitles:
                                                              const fl.AxisTitles(
                                                                  sideTitles:
                                                                      fl.SideTitles(
                                                                          showTitles:
                                                                              false)),
                                                          topTitles: const fl.AxisTitles(
                                                              sideTitles: fl.SideTitles(
                                                                  showTitles: false)),
                                                        ),
                                                        borderData: fl.FlBorderData(
                                                          show: false,
                                                        ),
                                                        barGroups:
                                                            controller.barChartData,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 394,
                            child: Row(
                              children: [
                                Container(
                                  height: 394,
                                  width: MediaQuery.of(context).size.width / 3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: AppStyles.customBorder16,
                                      border: Border.all(color: kBlackColor.withOpacity(0.08))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:22,bottom: 28,left: 28,right: 28),
                                    child: Expanded(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                      kEmploymentStatus,
                                                      style: AppStyles.interTextStyle()
                                                          .copyWith(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    )),
                                              ],
                                            ),
                                            Obx(
                                                  () => Center(
                                                child: PieChart(
                                                  dataMap: controller.dataMapRing.value,
                                                  chartRadius: 180.w,
                                                  chartType: ChartType.ring,
                                                  ringStrokeWidth: 25,
                                                  centerText: "",
                                                  animationDuration:
                                                  const Duration(seconds: 2),
                                                  colorList: controller.colorListRing,
                                                  chartValuesOptions:
                                                  ChartValuesOptions(
                                                    showChartValuesInPercentage:
                                                    true,
                                                    showChartValuesOutside: false,
                                                    decimalPlaces: 0,
                                                    showChartValueBackground: false,
                                                    chartValueStyle:
                                                    AppStyles.interTextStyle()
                                                        .copyWith(
                                                      color: kWhiteColor,
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  legendOptions:
                                                  const LegendOptions(
                                                    showLegends: false,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Wrap(
                                                runSpacing: 24,
                                                spacing: 24,
                                                children: List.generate(
                                                  controller.dataMapRing.length,
                                                      (index) {
                                                    final label = controller
                                                        .dataMapRing.keys
                                                        .toList()[index];
                                                    final color =
                                                    controller.colorListRing[index];
                                                    return Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 8,
                                                          height: 6,
                                                          decoration: BoxDecoration(
                                                            color: color,
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                        const SizedBox(width: 7),
                                                        Text(label,
                                                            style: AppStyles
                                                                .interTextStyle()
                                                                .copyWith(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color:
                                                                kBlackColor1))
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 32.w),
                                Expanded(
                                  // flex: 2,
                                  child: Container(
                                    height: 394,
                                    decoration: BoxDecoration(
                                        borderRadius: AppStyles.customBorder16,
                                        border: Border.all(color: kBlackColor.withOpacity(0.08))
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 32.0.h,horizontal: 8.w),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left:28.0.w),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                      "Average Time Between User Orders",
                                                      style: AppStyles.interTextStyle()
                                                          .copyWith(
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Text(
                                                    "Number of Users",
                                                    style: TextStyle(
                                                      color: kBarChartTextColor,
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 280,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 16.0.w,bottom: 8),
                                                    child: fl.BarChart(
                                                      fl.BarChartData(
                                                        alignment: fl.BarChartAlignment
                                                            .spaceBetween,
                                                        maxY: 160,
                                                        gridData: const fl.FlGridData(
                                                            show: true,
                                                            horizontalInterval: 40,
                                                            drawHorizontalLine: false,
                                                            drawVerticalLine: false,
                                                        ),
                                                        titlesData: fl.FlTitlesData(
                                                          leftTitles: fl.AxisTitles(
                                                            sideTitles: fl.SideTitles(
                                                              showTitles: true,
                                                              reservedSize: 32,
                                                              interval: 40,
                                                              getTitlesWidget:
                                                                  (value, meta) {
                                                                if (value % 40 == 0) {
                                                                  return Text(
                                                                    value
                                                                        .toInt()
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                      color:
                                                                      kBarChartTextColor,
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
                                                          rightTitles:
                                                          const fl.AxisTitles(
                                                              sideTitles:
                                                              fl.SideTitles(
                                                                  showTitles:
                                                                  false)),
                                                          topTitles: const fl.AxisTitles(
                                                              sideTitles: fl.SideTitles(
                                                                  showTitles: false)),
                                                        ),
                                                        borderData: fl.FlBorderData(
                                                          show: false,
                                                        ),
                                                        barGroups:
                                                        controller.barChartData1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            NotificationAndActivitySection(
              notifications: controller.notifications,
              activities: controller.activities,
            )
          ],
        ),
      ),
    );
  }
}
