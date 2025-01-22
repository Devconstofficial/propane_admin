import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';



class DriverController extends GetxController {
  var selectedCrimeType = ''.obs;
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
  TextEditingController phNoController = TextEditingController();
  TextEditingController liPlateController = TextEditingController();
  TextEditingController vTypeController = TextEditingController();
  var phoneNumber = PhoneNumber(isoCode: "UK", dialCode: "").obs;
  // var phoneTextController = TextEditingController();
  var isValid = false.obs;
  var isFormValid = false.obs;
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> selectedCardImage = Rx<Uint8List?>(null);

  void onPhoneNumberChanged(PhoneNumber number) {
    phoneNumber.value = number;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = await image.readAsBytes();
    }
  }

  Future<void> pickCardImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedCardImage.value = await image.readAsBytes();
    }
  }


  void _addListeners() {
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    phNoController.addListener(_validateForm);
    liPlateController.addListener(_validateForm);
    vTypeController.addListener(_validateForm);
  }

  void _validateForm() {
    isFormValid.value = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        liPlateController.text.isNotEmpty &&
        phNoController.text.isNotEmpty &&
        vTypeController.text.isNotEmpty;
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    phNoController.clear();
    liPlateController.clear();
    vTypeController.clear();
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

  final List<Map<String, dynamic>> allDrivers = [
    {"id": "00001", "name": "Christine Brooks", "vehicleType": "Vehicle", "vehicleLP": "VLP","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00002", "name": "Michael Smith", "vehicleType": "Vehicle", "vehicleLP": "VLP","status": "Pending", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00003", "name": "James Johnson", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Rejected", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00004", "name": "Patricia Brown", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Disabled", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00005", "name": "Robert Jones", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00006", "name": "Jennifer Garcia", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Pending", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00007", "name": "John Martinez", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Rejected", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00008", "name": "Linda Rodriguez", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Disabled", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00009", "name": "David Hernandez", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00010", "name": "Barbara Davis", "vehicleType": "Vehicle", "vehicleLP": "VLP", "status": "Pending", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
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

  final RxInt currentPage = 1.obs;

  List<Map<String, dynamic>> get currentPageUsers {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allDrivers.sublist(
      startIndex,
      endIndex > allDrivers.length ? allDrivers.length : endIndex,
    );
  }

  int get totalPages => (allDrivers.length / itemsPerPage).ceil();

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