import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../utils/app_colors.dart';


class JobController extends GetxController {
  var selectedCrimeType = ''.obs;
  RxList notifications = [].obs;
  RxList activities = [].obs;
  var isNotificationVisible = false.obs;
  var selectedDateStatus = ''.obs;
  var selectedBookingStatus = ''.obs;
  var selectedLocation = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phNoController = TextEditingController();
  TextEditingController liPlateController = TextEditingController();
  TextEditingController vTypeController = TextEditingController();
  late GoogleMapController mapController;

  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }


  final List<Map<String, dynamic>> allJobs = [
    {"id": "00001", "name": "Christine Brooks", "status": "Depart from gaz station", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00002", "name": "Michael Smith", "status": "Arrived at gas station", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00003", "name": "James Johnson", "status": "Picked Up", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00004", "name": "Patricia Brown", "status": "Delivered", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00005", "name": "Robert Jones", "status": "Depart from gaz station", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00006", "name": "Jennifer Garcia", "status": "Arrived at gas station", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00007", "name": "John Martinez", "status": "Picked Up", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00008", "name": "Linda Rodriguez", "status": "Cancelled", "statusBackColor": kPurpleColor, "StatusColor": kPurpleColor.withOpacity(0.2)},
    {"id": "00009", "name": "David Hernandez", "status": "Depart from gaz station", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00010", "name": "Barbara Davis", "status": "Arrived at gas station", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00006", "name": "Jennifer Garcia", "status": "Arrived at gas station", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
    {"id": "00007", "name": "John Martinez", "status": "Picked Up", "statusBackColor": kPrimaryColor, "StatusColor": kPrimaryColor.withOpacity(0.2)},
    {"id": "00008", "name": "Linda Rodriguez", "status": "Cancelled", "statusBackColor": kPurpleColor, "StatusColor": kPurpleColor.withOpacity(0.2)},
    {"id": "00009", "name": "David Hernandez", "status": "Depart from gaz station", "statusBackColor": kBlueColor, "StatusColor": kBlueColor.withOpacity(0.2)},
    {"id": "00010", "name": "Barbara Davis", "status": "Arrived at gas station", "statusBackColor": kOrangeColor, "StatusColor": kOrangeColor.withOpacity(0.2)},
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

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  onInit(){
    super.onInit();
    fetchNotifications();
    fetchActivities();
  }

  final int itemsPerPage = 7;

  final RxInt currentPage = 1.obs;

  List<Map<String, dynamic>> get currentJobPage {
    final startIndex = (currentPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    return allJobs.sublist(
      startIndex,
      endIndex > allJobs.length ? allJobs.length : endIndex,
    );
  }

  int get totalPages => (allJobs.length / itemsPerPage).ceil();

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