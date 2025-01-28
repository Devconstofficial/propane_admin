import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:flutter_svg/svg.dart';
import 'package:propane_admin/view/widgets/dashboard-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/controller/menu_controller.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/notifiction_panel.dart';
import 'controller/analytics_controller.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class AnalyticsScreen extends GetView<AnalyticsController> {
  AnalyticsScreen({super.key});

  final menuController = Get.put(MenuControllers());

  Widget selectCityDialogue(BuildContext context) {
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
                    "Country",
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
                    hintText: "Country",
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
                    "City",
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
                    hintText: "City",
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
                    text: "Add Now",
                    height: 40,
                    onTap: () {},
                    width: 88,
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
                                kAnalyticsReporting,
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
                            height: 32.h,
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
                                          child: Text('Location 1',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Location 2',
                                          child: Text('Location 2',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                        PopupMenuItem(
                                          value: 'Location 3',
                                          child: Text('Location 3',style: AppStyles.interTextStyle()
                                              .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                      ],
                                    ),
                                    controller.selectedLocation.value.isNotEmpty ?
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
                              ),),
                              CustomButton(text: kGenerateReport, height: 56, onTap: (){

                              },width: 194.w,fontSize: 16.sp,),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                              children: [
                                Text(
                                  kUserAnalytics,
                                  style: AppStyles.workSansTextStyle().copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                          const SizedBox(
                            height: 24,
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
                                              Flexible(
                                                child: Text(
                                                  kAgeRange,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppStyles.interTextStyle()
                                                      .copyWith(
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                    "All Users",
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 14.sp,
                                                        color: kGreyeshColor,
                                                        fontWeight:
                                                        FontWeight.w400),
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
                                                Flexible(
                                                  child: Text(
                                                    "Occupations",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
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
                                                                    label = Text('Ocup 1', style: style);
                                                                    break;
                                                                  case 1:
                                                                    label = Text('Ocup 2', style: style);
                                                                    break;
                                                                  case 2:
                                                                    label = Text('Ocup 3', style: style);
                                                                    break;
                                                                  case 3:
                                                                    label = Text('Ocup 4', style: style);
                                                                    break;
                                                                  case 4:
                                                                    label = Text('Ocup 5', style: style);
                                                                    break;
                                                                  case 5:
                                                                    label = Text('Ocup 6', style: style);
                                                                    break;
                                                                  case 6:
                                                                    label = Text('Ocup 7', style: style);
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
                                  child: Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:24,bottom: 28,left: 28,right: 28),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    kEmploymentStatus,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                      "All Users",
                                                      style: AppStyles.interTextStyle()
                                                          .copyWith(
                                                          fontSize: 14.sp,
                                                          color: kGreyeshColor,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    )),
                                              ],
                                            ),
                                            Obx(
                                                  () => Center(
                                                child: PieChart(
                                                  dataMap: controller.dataMapRing.value,
                                                  chartRadius: 210.w,
                                                  chartType: ChartType.disc,
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
                                    // flex: 1,
                                  ),
                                ),
                                SizedBox(width: 32.w),
                                Expanded(
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
                                              children: [
                                                Flexible(
                                                     child: Text(
                                                    "Average Time Between User Orders",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
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
                                                    "Time b/w orders (days)",
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
                                                                    label = Text('User 1', style: style);
                                                                    break;
                                                                  case 1:
                                                                    label = Text('User 2', style: style);
                                                                    break;
                                                                  case 2:
                                                                    label = Text('User 3', style: style);
                                                                    break;
                                                                  case 3:
                                                                    label = Text('User 4', style: style);
                                                                    break;
                                                                  case 4:
                                                                    label = Text('User 5', style: style);
                                                                    break;
                                                                  case 5:
                                                                    label = Text('User 6', style: style);
                                                                    break;
                                                                  case 6:
                                                                    label = Text('User 7', style: style);
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
                          SizedBox(
                            height: 32.h,
                          ),
                          Row(
                              children: [
                                Text(
                                  kDeliveryTrends,
                                  style: AppStyles.workSansTextStyle().copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                          SizedBox(
                            height: 24.h,
                          ),
                          SizedBox(
                            height: 394,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
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
                                            padding: EdgeInsets.only(left:24.0.w),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    kRevenueLocation,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
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
                                                SizedBox(width: 20.w),
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
                                                padding: EdgeInsets.only(right: 28.0.w),
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Text(
                                                    "Revenue Amount",
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
                                                    padding: EdgeInsets.only(right: 36.0.w,bottom: 8),
                                                    child: fl.BarChart(
                                                      fl.BarChartData(
                                                        alignment: fl.BarChartAlignment
                                                            .spaceBetween,
                                                        maxY: 160,
                                                        gridData: fl.FlGridData(
                                                            show: true,
                                                            horizontalInterval: 22.w,
                                                            drawHorizontalLine: false,
                                                            drawVerticalLine: false),
                                                        titlesData: fl.FlTitlesData(
                                                          leftTitles: fl.AxisTitles(
                                                            sideTitles: fl.SideTitles(
                                                              showTitles: true,
                                                              reservedSize: 52.w,
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
                                                                  fontSize: 10.sp,
                                                                  color: kBarChartTextColor,
                                                                );
                                                                Widget label;
                                                                switch (value.toInt()) {
                                                                  case 0:
                                                                    label = Text('Santo Domingo', style: style);
                                                                    break;
                                                                  case 1:
                                                                    label = Text('Puerto Plata', style: style);
                                                                    break;
                                                                  case 2:
                                                                    label = Text('Samaná', style: style);
                                                                    break;
                                                                  case 3:
                                                                    label = Text('Puerto Plata', style: style);
                                                                    break;
                                                                  case 4:
                                                                    label = Text('Samaná', style: style);
                                                                    break;
                                                                  case 5:
                                                                    label = Text('Santo Domingo', style: style);
                                                                    break;
                                                                  case 6:
                                                                    label = Text('Puerto Plata', style: style);
                                                                    break;
                                                                  default:
                                                                    label = const Text('');
                                                                    break;
                                                                }
                                                                return Padding(
                                                                  padding: EdgeInsets.only(top: 9.0.h),
                                                                  child: Flexible(child: label),
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
                                SizedBox(width: 68.w),
                                Expanded(
                                  child: Container(
                                    height: 394,
                                    decoration: BoxDecoration(
                                        borderRadius: AppStyles.customBorder16,
                                        border: Border.all(color: kBlackColor.withOpacity(0.08))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:24,bottom: 28,left: 28,right: 28),
                                      child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                     child: Text(
                                                    "Completion Rate",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppStyles.interTextStyle()
                                                        .copyWith(
                                                        fontSize: 24.sp,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 28.h),
                                            SimpleCircularProgressBar(
                                      progressStrokeWidth: 12.0.w,
                                      backStrokeWidth: 12.0.w,
                                      progressColors: const [kPrimaryColor],
                                      backColor: Color(0xffD9D9D9),
                                    valueNotifier: ValueNotifier(controller.progressPercentage.value),
                                      size: 120.r,
                                      onGetText: (value) => Text(
                                        '${value.toInt()}%',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  ),
                                            SizedBox(height: 42.h),
                                            Wrap(
                                              runSpacing: 15,
                                              spacing: 15,
                                              children: List.generate(
                                                controller.dataMapProgressBar.length,
                                                    (index) {
                                                  final label = controller
                                                      .dataMapProgressBar.keys
                                                      .toList()[index];
                                                  final color =
                                                  controller.colorListProgressBar[index];
                                                  return Row(
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
                                                      Expanded(
                                                        child: Text(label,
                                                            style: AppStyles
                                                                .interTextStyle()
                                                                .copyWith(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                color:
                                                                kBlackColor1)),
                                                      )
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  kLocationBasedService,
                                  style: AppStyles.workSansTextStyle().copyWith(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                CustomButton(text: "Add a new city", height: 38, onTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return selectCityDialogue(context);
                                    },
                                  );
                                },width: 184.w,fontSize: 16.sp,),
                              ]),
                          SizedBox(
                            height: 30.h,
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
                                            "City Name",
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
                                            "Total Users",
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
                                            "Total Orders",
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
                                            "Average time b/w order",
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
                                            "Revenue Generated",
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
                                    rows: controller.currentPageLocations.map((location) {
                                      int index = controller.allLocations.indexOf(location);
                                      return _buildDataRow(
                                        location['cityName']!,
                                        location['totalUser']!,
                                        location['totalOrder']!,
                                        location['avgTime']!,
                                        location['amount']!,
                                        index,
                                        location['isSwitchOn']!,
                                            (value, index) {
                                              controller.allLocations[index]['isSwitchOn'] = value;
                                          controller.update();
                                        },
                                        context
                                      );
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
                                    ),                                        ),
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
                                          controller.isBackButtonDisabled
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
                                      controller.currentLocationPage.value;
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
                          SizedBox(height: 44.h,),
                        ],
                      ),
                    )
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
      ),),
    );
  }

  DataRow _buildDataRow(String cityName, String totalUsers, String totalOrders, String avgTimeOrder,String revenue,int index,
      bool isSwitchOn,
      Function(bool, int) onSwitchChanged,context) {

    return DataRow(
      cells: [
        DataCell(Text(
          cityName,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          totalUsers,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          totalOrders,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          avgTimeOrder,
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
                  "\$$revenue",
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
            child: SizedBox(
              height: 30,
              child: Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: isSwitchOn,
                  // activeColor: kPrimaryColor,
                  activeColor: kWhiteColor,
                  inactiveThumbColor:
                  kWhiteColor,
                  trackOutlineColor:
                  const WidgetStatePropertyAll(
                      Colors.transparent),
                  activeTrackColor:
                  kPrimaryColor,
                  onChanged: (value) {
                    onSwitchChanged(value, index);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
