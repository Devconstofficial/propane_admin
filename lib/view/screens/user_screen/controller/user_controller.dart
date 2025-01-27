import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../utils/app_colors.dart';



class UserController extends GetxController {
  var selectedUserType = ''.obs;
  var selectedPayType = ''.obs;
  var selectedReminderType = ''.obs;
  RxList notifications = [].obs;
  RxList activities = [].obs;
  var selectedFilters = <String>{}.obs;
  var isNotificationVisible = false.obs;
  var selectedUserStatus = ''.obs;
  var selectedLocation = ''.obs;
  var isFreeDelivery = false.obs;
  var isPayCash = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phNoController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController empStatusController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  var phoneNumber = PhoneNumber(isoCode: "GB", dialCode: "").obs;
  // var phoneTextController = TextEditingController();
  var isValid = false.obs;

  void onPhoneNumberChanged(PhoneNumber number) {
    phoneNumber.value = number;
  }


  var isFormValid = false.obs;

  void _addListeners() {
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    addressController.addListener(_validateForm);
    phNoController.addListener(_validateForm);
    empStatusController.addListener(_validateForm);
    ageController.addListener(_validateForm);
    occupationController.addListener(_validateForm);
  }

  void _validateForm() {
    isFormValid.value = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        empStatusController.text.isNotEmpty &&
        phNoController.text.isNotEmpty &&
        occupationController.text.isNotEmpty;
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    addressController.clear();
    phNoController.clear();
    empStatusController.clear();
    ageController.clear();
    occupationController.clear();
  }

  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }

  void toggleFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  final List<Map<String, dynamic>> allUsers = [
    {"id": "00001", "name": "Christine Brooks", "location": "Lahore", "age": "12", "pay-in-cash": "No", "status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00002", "name": "Michael Smith", "location": "Karachi", "age": "35", "pay-in-cash": "Yes", "status": "Pending", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00003", "name": "James Johnson", "location": "Islamabad", "age": "27", "pay-in-cash": "No", "status": "Rejected", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00004", "name": "Patricia Brown", "location": "Lahore", "age": "45", "pay-in-cash": "Yes", "status": "Disabled", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00005", "name": "Robert Jones", "location": "Faisalabad", "age": "22", "pay-in-cash": "No", "status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00006", "name": "Jennifer Garcia", "location": "Multan", "age": "30", "pay-in-cash": "Yes", "status": "Pending", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00007", "name": "John Martinez", "location": "Quetta", "age": "28", "pay-in-cash": "No", "status": "Rejected", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00008", "name": "Linda Rodriguez", "location": "Peshawar", "age": "34", "pay-in-cash": "Yes", "status": "Disabled", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00009", "name": "David Hernandez", "location": "Hyderabad", "age": "40", "pay-in-cash": "No", "status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00010", "name": "Barbara Davis", "location": "Rawalpindi", "age": "19", "pay-in-cash": "Yes", "status": "Pending", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
  ];

  final List<Map<String, dynamic>> allSensors = [
    {"id": "00001", "sensorId": "SENS-001", "subscription": "40 Days Left", "gasLevel": "10", "lastSync": "10 mins ago", "notiSent": "Low Level Reminder Sent"},
    {"id": "00002", "sensorId": "SENS-002", "subscription": "30 Days Left", "gasLevel": "20", "lastSync": "20 mins ago", "notiSent": "No Reminder Sent"},
    {"id": "00003", "sensorId": "SENS-003", "subscription": "50 Days Left", "gasLevel": "15", "lastSync": "5 mins ago", "notiSent": "Low Level Reminder Sent"},
    {"id": "00004", "sensorId": "SENS-004", "subscription": "25 Days Left", "gasLevel": "30", "lastSync": "15 mins ago", "notiSent": "No Reminder Sent"},
    {"id": "00005", "sensorId": "SENS-005", "subscription": "10 Days Left", "gasLevel": "5", "lastSync": "1 min ago", "notiSent": "Critical Level Alert Sent"},
    {"id": "00006", "sensorId": "SENS-006", "subscription": "60 Days Left", "gasLevel": "50", "lastSync": "30 mins ago", "notiSent": "No Reminder Sent"},
    {"id": "00007", "sensorId": "SENS-007", "subscription": "20 Days Left", "gasLevel": "25", "lastSync": "10 mins ago", "notiSent": "Low Level Reminder Sent"},
    {"id": "00008", "sensorId": "SENS-008", "subscription": "5 Days Left", "gasLevel": "3", "lastSync": "2 mins ago", "notiSent": "Critical Level Alert Sent"},
    {"id": "00009", "sensorId": "SENS-009", "subscription": "15 Days Left", "gasLevel": "12", "lastSync": "12 mins ago", "notiSent": "Low Level Reminder Sent"}
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
    _addListeners();
  }

  final int itemsPerPage = 7;
  final int sensorPerPage = 2;

  final RxInt currentPage = 1.obs;
  final RxInt currentPage1 = 1.obs;

  List<Map<String, dynamic>> get currentPageUsers {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allUsers.sublist(
      startIndex,
      endIndex > allUsers.length ? allUsers.length : endIndex,
    );
  }

  List<Map<String, dynamic>> get currentSensorPage {
    final startIndex = (currentPage1.value - 1) * sensorPerPage;
    final endIndex = startIndex + sensorPerPage;
    return allSensors.sublist(
      startIndex,
      endIndex > allSensors.length ? allSensors.length : endIndex,
    );
  }

  int get totalPages => (allUsers.length / itemsPerPage).ceil();

  int get totalSensorPages => (allSensors.length / sensorPerPage).ceil();

  void changePage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalPages) {
      currentPage.value = pageNumber;
    }
  }

  void changeSensorPage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalSensorPages) {
      currentPage1.value = pageNumber;
    }
  }

  void goToPreviousPage() {
    if (currentPage.value > 1) {
      currentPage.value -= 1;
    }
  }

  void goToSensorPreviousPage() {
    if (currentPage1.value > 1) {
      currentPage1.value -= 1;
    }
  }

  // Next button functionality
  void goToNextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value += 1;
    }
  }

  void goToSensorNextPage() {
    if (currentPage1.value < totalSensorPages) {
      currentPage1.value += 1;
    }
  }

  // Check if back button should be disabled
  bool get isBackButtonDisabled => currentPage.value == 1;


  bool get isSensorBackButtonDisabled => currentPage1.value == 1;

  // Check if next button should be disabled
  bool get isNextButtonDisabled => currentPage.value == totalPages;

  bool get isSensorNextButtonDisabled => currentPage1.value == totalSensorPages;
}