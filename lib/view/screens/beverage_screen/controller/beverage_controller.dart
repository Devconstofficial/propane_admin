import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class BeverageController extends GetxController {
  var selectedPrice = ''.obs;
  var selectRegion = ''.obs;
  RxList notifications = [].obs;
  RxList activities = [].obs;
  var isNotificationVisible = false.obs;

  var isFormValid = false.obs;


  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }

  final List<Map<String, dynamic>> allBeverages = [
    {"name": "Red Bull", "price": 3.50, "add-on": "Yes", "region": "Downtown"},
    {"name": "Monster Energy", "price": 3.50, "add-on": "No", "region": "Downtown"},
    {"name": "Rockstar Energy", "price": 3.50, "add-on": "No", "region": "Downtown"},
    {"name": "Bang Energy", "price": 3.50, "add-on": "NO", "region": "Downtown"},
    {"name": "5-Hour Energy", "price": 3.50, "add-on": "Yes", "region": "Downtown"},
    {"name": "Red Bull", "price": 3.50, "add-on": "No", "region": "Downtown"},
    {"name": "5-Hour Energy", "price": 3.50, "add-on": "Yes", "region": "Downtown"},
    {"name": "Bang Energy", "price": 3.50, "add-on": "NO", "region": "Downtown"},
    {"name": "Rockstar Energy", "price": 3.50, "add-on": "No", "region": "Downtown"},
    ];

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

  @override
  onInit(){
    super.onInit();
    fetchNotifications();
    fetchActivities();
  }

  final int itemsPerPage = 7;

  final RxInt currentPage = 1.obs;

  List<Map<String, dynamic>> get currentPageUsers {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allBeverages.sublist(
      startIndex,
      endIndex > allBeverages.length ? allBeverages.length : endIndex,
    );
  }

  int get totalPages => (allBeverages.length / itemsPerPage).ceil();

  void changePage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalPages) {
      currentPage.value = pageNumber;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value -= 1;
    }
  }

  // Next button functionality
  void goToNextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value += 1;
    }
  }

  // Check if back button should be disabled
  bool get isBackButtonDisabled => currentPage.value == 1;

  // Check if next button should be disabled
  bool get isNextButtonDisabled => currentPage.value == totalPages;
}