import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class RevenueController extends GetxController {
  RxList<BarChartGroupData> barChartData = <BarChartGroupData>[].obs;
  RxList<BarChartGroupData> barChartData1 = <BarChartGroupData>[].obs;
  RxList notifications = [].obs;
  RxList activities = [].obs;
  var selectedValue = 'Last 7 Days'.obs;
  var selectedRegion = 'All Regions'.obs;
  var selectedValue1 = 'Last 7 Days'.obs;
  var selectedTodayValue = 'Today'.obs;
  var isNotificationVisible = false.obs;
  var selectedUserDateStatus = ''.obs;
  var selectedDriverDateStatus = ''.obs;
  var selectedTipsDateStatus = ''.obs;
  var selectedUserAmount = ''.obs;
  var selectedDriverAmount = ''.obs;
  var selectedTipsAmount = ''.obs;
  var selectedUserLocation = ''.obs;
  var selectedDriverLocation = ''.obs;

  void updateValue(String value) {
    selectedValue.value = value;
  }

  void updateValue2(String value) {
    selectedValue1.value = value;
  }

  void updateValue1(String value) {
    selectedTodayValue.value = value;
  }

  final List<Map<String, dynamic>> allUserPayments = [
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "location": "NYC", "driverName": "Alex Alex", "amount": "1000"},
    ];

  final List<Map<String, dynamic>> allDriverPayouts = [
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "driverVehicle": "Alex Alex", "amount": "1000"},
    ];

  final List<Map<String, dynamic>> allTips = [
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    {"id": "00001", "name": "Alex Alex", "driverId": "NYC", "location": "NYC", "amount": "1000"},
    ];

  @override
  onInit(){
    super.onInit();
    generateBarChartData();
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

  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
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

  final int itemsPerUserPage = 2;
  final int itemsPerDriverPage = 2;
  final int itemsPerTipsPage = 2;

  final RxInt currentUserPage = 1.obs;
  final RxInt currentDriverPage = 1.obs;
  final RxInt currentTipsPage = 1.obs;

  List<Map<String, dynamic>> get currentPageUserPayments {
    final startIndex = (currentUserPage.value - 1) * itemsPerUserPage;
    final endIndex = startIndex + itemsPerUserPage;
    return allUserPayments.sublist(
      startIndex,
      endIndex > allUserPayments.length ? allUserPayments.length : endIndex,
    );
  }

  List<Map<String, dynamic>> get currentPageDriverPayouts {
    final startIndex = (currentDriverPage.value - 1) * itemsPerDriverPage;
    final endIndex = startIndex + itemsPerDriverPage;
    return allDriverPayouts.sublist(
      startIndex,
      endIndex > allDriverPayouts.length ? allDriverPayouts.length : endIndex,
    );
  }

  List<Map<String, dynamic>> get currentPageTips {
    final startIndex = (currentTipsPage.value - 1) * itemsPerTipsPage;
    final endIndex = startIndex + itemsPerTipsPage;
    return allTips.sublist(
      startIndex,
      endIndex > allTips.length ? allTips.length : endIndex,
    );
  }

  int get totalUserPages => (allUserPayments.length / itemsPerUserPage).ceil();

  int get totalDriverPages => (allDriverPayouts.length / itemsPerDriverPage).ceil();

  int get totalTipsPages => (allTips.length / itemsPerTipsPage).ceil();

  void changeUserPage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalUserPages) {
      currentUserPage.value = pageNumber;
    }
  }

  void changeDriverPage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalDriverPages) {
      currentDriverPage.value = pageNumber;
    }
  }

  void changeTipsPage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalTipsPages) {
      currentTipsPage.value = pageNumber;
    }
  }

  void goToUserPreviousPage() {
    if (currentUserPage.value > 1) {
      currentUserPage.value -= 1;
    }
  }

  void goToDriverPreviousPage() {
    if (currentDriverPage.value > 1) {
      currentDriverPage.value -= 1;
    }
  }

  void goToTipsPreviousPage() {
    if (currentTipsPage.value > 1) {
      currentTipsPage.value -= 1;
    }
  }

  // Next button functionality
  void goToUserNextPage() {
    if (currentUserPage.value < totalUserPages) {
      currentUserPage.value += 1;
    }
  }

  void goToDriverNextPage() {
    if (currentDriverPage.value < totalDriverPages) {
      currentDriverPage.value += 1;
    }
  }

  void goToTipsNextPage() {
    if (currentTipsPage.value < totalTipsPages) {
      currentTipsPage.value += 1;
    }
  }

  // Check if back button should be disabled
  bool get isUserBackButtonDisabled => currentUserPage.value == 1;

  bool get isDriverBackButtonDisabled => currentDriverPage.value == 1;

  bool get isTipsBackButtonDisabled => currentTipsPage.value == 1;

  // Check if next button should be disabled
  bool get isUserNextButtonDisabled => currentUserPage.value == totalUserPages;

  bool get isDriverNextButtonDisabled => currentDriverPage.value == totalDriverPages;

  bool get isTipsNextButtonDisabled => currentTipsPage.value == totalTipsPages;
}