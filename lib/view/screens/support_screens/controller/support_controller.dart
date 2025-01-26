import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';

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
  final TextEditingController messageController = TextEditingController();

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

  var messages = [
    {'text': 'Hi! May I know about your property’s neighborhood?', 'isUser': true},
    {'text': 'Sure, man! You can check it from the description section of the property.', 'isUser': false},
    {'text': 'I see, thanks for informing!', 'isUser': true},
    {'text': 'Thanks for contacting me!', 'isUser': false},
  ].obs;

  void sendMessage(String text) {
    messages.add({'text': text, 'isUser': true});
  }


  void toggleNotificationVisibility() {
    isNotificationVisible.value = !isNotificationVisible.value;
  }

  var chatList = [
    {
      "name": "John Doe",
      "latestMessage": "Hi, I want to make enquiries about you",
      "image": kImage3,
      "status": "offline",
      "timeline": "new",
      "unreadCount": 2,
      "time": "12:55 am",
    },
    {
      "name": "Jane Smith",
      "latestMessage": "Hi, I want to make enquiries about you",
      "image": kImage3,
      "status": "online",
      "timeline": "new",
      "unreadCount": 1,
      "time": "11:40 pm",
    },
    {
      "name": "Mark Johnson",
      "latestMessage": "Let's catch up soon!",
      "image": kImage3,
      "status": "offline",
      "timeline": "old",
      "unreadCount": 0,
      "time": "10:30 pm",
    },
    {
      "name": "Emma Williams",
      "latestMessage": "Looking forward to the event tomorrow.",
      "image": kImage3,
      "status": "away",
      "timeline": "new",
      "unreadCount": 3,
      "time": "9:45 pm",
    },
    {
      "name": "Olivia Brown",
      "latestMessage": "Can you send me the details?",
      "image": kImage3,
      "status": "online",
      "timeline": "new",
      "unreadCount": 1,
      "time": "8:15 pm",
    },
    {
      "name": "Sophia Davis",
      "latestMessage": "I have some questions about the project.",
      "image": kImage3,
      "status": "offline",
      "timeline": "old",
      "unreadCount": 0,
      "time": "7:50 pm",
    },
    {
      "name": "Liam Miller",
      "latestMessage": "Can we reschedule our meeting?",
      "image": kImage3,
      "status": "offline",
      "timeline": "new",
      "unreadCount": 4,
      "time": "6:30 pm",
    },
    {
      "name": "Ava Wilson",
      "latestMessage": "Happy to help with anything!",
      "image": kImage3,
      "status": "offline",
      "timeline": "new",
      "unreadCount": 0,
      "time": "5:20 pm",
    },
    {
      "name": "Lucas Taylor",
      "latestMessage": "Let's chat soon about the new proposal.",
      "image": kImage3,
      "status": "online",
      "timeline": "new",
      "unreadCount": 2,
      "time": "4:10 pm",
    },
    {
      "name": "Mia Anderson",
      "latestMessage": "I need some more information.",
      "image": kImage3,
      "status": "offline",
      "timeline": "new",
      "unreadCount": 3,
      "time": "3:05 pm",
    },
    {
      "name": "James Martinez",
      "latestMessage": "Let's talk about the next steps.",
      "image": kImage3,
      "status": "offline",
      "timeline": "old",
      "unreadCount": 0,
      "time": "2:50 pm",
    },
    {
      "name": "Charlotte Rodriguez",
      "latestMessage": "How about a quick call to discuss?",
      "image": kImage3,
      "status": "offline",
      "timeline": "new",
      "unreadCount": 1,
      "time": "1:30 pm",
    },
    {
      "name": "Amelia Lee",
      "latestMessage": "I will send you the updated file.",
      "image": kImage3,
      "status": "offline",
      "timeline": "new",
      "unreadCount": 5,
      "time": "12:10 pm",
    },
    {
      "name": "Benjamin Harris",
      "latestMessage": "Please confirm your availability.",
      "image": kImage3,
      "status": "offline",
      "timeline": "old",
      "unreadCount": 0,
      "time": "11:00 am",
    },
  ].obs;


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