import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';


class AnalyticsController extends GetxController {
  RxList<BarChartGroupData> barChartData = <BarChartGroupData>[].obs;
  RxList<BarChartGroupData> barChartData1 = <BarChartGroupData>[].obs;
  RxList notifications = [].obs;
  RxList activities = [].obs;
  var selectedValue = 'Last 7 Days'.obs;
  var selectedRegion = 'All Regions'.obs;
  var selectedValue1 = 'Last 7 Days'.obs;
  var selectedTodayValue = 'Today'.obs;
  var selectedLocation = ''.obs;
  var isNotificationVisible = false.obs;
  var progressPercentage = 70.0.obs;
  final RxInt currentLocationPage = 1.obs;
  List<bool> isSwitchOn = [];


  void updateValue(String value) {
    selectedValue.value = value;
  }

  void updateValue2(String value) {
    selectedValue1.value = value;
  }

  void updateValue1(String value) {
    selectedTodayValue.value = value;
  }

  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }

  void initializeSwitches(int length) {
    isSwitchOn = List.generate(length, (index) => false);
    update();
  }

  void toggleSwitch(bool value, int index) {
    isSwitchOn[index] = value;
    update();
  }


  final List<Map<String, dynamic>> allLocations = [
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": true,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": true,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": true,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": false,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": false,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": true,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": false,},
    {"cityName": "Santo Domingo", "totalUser": "100", "totalOrder": "100", "avgTime": "4 days", "amount": "1000","isSwitchOn": true,},
    ];


  @override
  onInit(){
    super.onInit();
    generateBarChartData();
    generateBarChartData1();
    fetchNotifications();
    fetchActivities();
  }

  void fetchNotifications() {
    notifications.addAll([
      {'title': 'New Host registered', 'time': '59 minutes ago', "backColor" : kPrimaryColor,},
      {'title': 'New Crime Reported', 'time': '1 hour ago',"backColor" : kOrangeColor,},
      {'title': 'Crime Resolved', 'time': '2 hours ago',"backColor" : kLightBlue,},
      {'title': 'Update on your case', 'time': '3 hours ago',"backColor" : kGrey,},
    ]);
  }

  void fetchActivities() {
    activities.addAll([
      {'title': 'Ahmad just cancelled his...', 'time': 'Just now',"backColor" : kPrimaryColor,},
      {'title': 'John updated the crime report...', 'time': '5 minutes ago',"backColor" : kOrangeColor,},
      {'title': 'Jane resolved a case', 'time': '10 minutes ago',"backColor" : kLightBlue,},
      {'title': 'System generated report', 'time': '1 hour ago',"backColor" : kGrey,},
    ]);
  }

  void generateBarChartData() {
    List<double> rawData = [60, 40, 20, 120, 160, 100, 60];
    double maxBarHeight = 160.0;

    barChartData.value = rawData.asMap().entries.map((entry) {
      int index = entry.key;
      double value = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: maxBarHeight,
            color: kBarColor,
            // borderSide: const BorderSide(color: kTableBorderColor),
            width: 10,
            borderRadius: BorderRadius.circular(8),
            rodStackItems: [
              BarChartRodStackItem(
                  0,
                  value,
                  kPrimaryColor,
              ),
            ],
          ),
        ],
      );
    }).toList();
  }

  void generateBarChartData1() {
    List<double> rawData = [60, 40, 20, 120, 160, 100, 60];
    double maxBarHeight = 160.0;

    barChartData1.value = rawData.asMap().entries.map((entry) {
      int index = entry.key;
      double value = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: maxBarHeight,
            color: kWhiteColor,
            // borderSide: const BorderSide(color: kTableBorderColor),
            width: 10,
            borderRadius: BorderRadius.circular(1),
            rodStackItems: [
              BarChartRodStackItem(
                  0,
                  value,
                index % 2 == 0 ? kPrimaryColor : kOrangeColor,
              ),
            ],
          ),
        ],
      );
    }).toList();
  }

  RxMap<String, double> dataMap = {
    '1-25': 10.0,
    '25-50': 45.0,
    '50-75': 45.0,
  }.obs;

  RxMap<String, double> dataMapRing = {
    'Employed': 55.0,
    'Un-Employed': 45.0,
  }.obs;

  RxMap<String, double> dataMapProgressBar = {
    '68% Order Completion': 55.0,
    '32% Order Failed': 45.0,
  }.obs;

  List<Color> get colorList {
    return [
      kPrimaryColor,
      kOrangeColor,
      kBlueColor
    ];
  }

  List<Color> get colorListRing {
    return [
      kOrangeColor,
      kBlueColor,
    ];
  }

  List<Color> get colorListProgressBar {
    return [
      kOrangeColor,
      kBlueColor,
    ];
  }

  void updateData(String key, double value) {
    dataMap[key] = value;
  }

  final int itemsPerPage = 2;

  List<Map<String, dynamic>> get currentPageLocations {
    final startIndex = (currentLocationPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allLocations.sublist(
      startIndex,
      endIndex > allLocations.length ? allLocations.length : endIndex,
    );
  }

  int get totalPages => (allLocations.length / itemsPerPage).ceil();

  void changePage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalPages) {
      currentLocationPage.value = pageNumber;
    }
  }

  void goToPreviousPage() {
    if (currentLocationPage.value > 1) {
      currentLocationPage.value -= 1;
    }
  }

  void goToNextPage() {
    if (currentLocationPage.value < totalPages) {
      currentLocationPage.value += 1;
    }
  }

  bool get isBackButtonDisabled => currentLocationPage.value == 1;

  bool get isNextButtonDisabled => currentLocationPage.value == totalPages;

}