import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class AdminController extends GetxController {
  var selectedAdminType = ''.obs;
  var selectedLocation = ''.obs;
  RxList notifications = [].obs;
  RxList activities = [].obs;
  var isNotificationVisible = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  var isFormValid = false.obs;

  void _addListeners() {
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passController.addListener(_validateForm);
    confirmPassController.addListener(_validateForm);
    roleController.addListener(_validateForm);
  }

  void _validateForm() {
    isFormValid.value = nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        confirmPassController.text.isNotEmpty &&
        roleController.text.isNotEmpty;
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    passController.clear();
    confirmPassController.clear();
    roleController.clear();
  }

  // void createAdmin() {
  //   clearFields();
  // }

  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }

  final List<Map<String, dynamic>> allAdmins = [
    {"id": "00001", "name": "Christine Brooks", "type": "Customer Service", "Last Activity": "1 hour ago"},
    {"id": "00002", "name": "James Smith", "type": "Technical Support", "Last Activity": "2 hours ago"},
    {"id": "00003", "name": "Maria Garcia", "type": "Billing", "Last Activity": "3 hours ago"},
    {"id": "00004", "name": "Robert Johnson", "type": "Customer Service", "Last Activity": "30 minutes ago"},
    {"id": "00005", "name": "Linda Martinez", "type": "Sales", "Last Activity": "4 hours ago"},
    {"id": "00006", "name": "Michael Brown", "type": "Technical Support", "Last Activity": "5 hours ago"},
    {"id": "00007", "name": "William Davis", "type": "Customer Service", "Last Activity": "10 minutes ago"},
    {"id": "00008", "name": "Elizabeth Wilson", "type": "Marketing", "Last Activity": "6 hours ago"},
    {"id": "00009", "name": "David Moore", "type": "Customer Service", "Last Activity": "7 hours ago"},
    {"id": "00010", "name": "Barbara Taylor", "type": "HR", "Last Activity": "8 hours ago"},
    {"id": "00011", "name": "Joseph White", "type": "Sales", "Last Activity": "9 hours ago"},
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
    return allAdmins.sublist(
      startIndex,
      endIndex > allAdmins.length ? allAdmins.length : endIndex,
    );
  }

  int get totalPages => (allAdmins.length / itemsPerPage).ceil();

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