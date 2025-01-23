import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

class SupportController extends GetxController {
  var selectedTicketStatus = ''.obs;
  var selectedDate = ''.obs;
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

  final List<Map<String, dynamic>> allTickets = [
    {"id": "00001", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00002", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Solved", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00003", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00001", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00002", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Solved", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00003", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00001", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00002", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Solved", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00003", "title": "Inquiry Title", "createdBy": "Alex Alex", "Last Activity": "1 hour ago","status": "Active", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
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

  final int itemsPerPage = 3;

  final RxInt currentPage = 1.obs;

  List<Map<String, dynamic>> get currentPageTickets {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allTickets.sublist(
      startIndex,
      endIndex > allTickets.length ? allTickets.length : endIndex,
    );
  }

  int get totalPages => (allTickets.length / itemsPerPage).ceil();

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