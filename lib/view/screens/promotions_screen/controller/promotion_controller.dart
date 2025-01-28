import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PromotionsController extends GetxController{
  var selectedIndex = 0.obs;
  final RxInt currentFTDeliveryPage = 1.obs;
  var isSwitchOn = false.obs;

  void toggleSwitch(bool value) {
    isSwitchOn.value = value;
  }

  final List<Map<String, dynamic>> fTimeDeliveryList = [
    {"id": "0001", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0002", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0003", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0004", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0005", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0006", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0007", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0008", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    {"id": "0009", "name": "Alex", "location": "NYC", "status": "Active", "isSwitchOn": true,},
    ];

  final List<Map<String, dynamic>> dPercentList = [
    {"id": "0001", "name": "Alex", "dPercent": "55%", "status": "Active"},
    {"id": "0002", "name": "Alex", "dPercent": "65%", "status": "Active"},
    {"id": "0003", "name": "Alex", "dPercent": "75%", "status": "Active"},
    {"id": "0004", "name": "Alex", "dPercent": "85%", "status": "Active"},
    {"id": "0005", "name": "Alex", "dPercent": "95%", "status": "Active"},
    {"id": "0006", "name": "Alex", "dPercent": "35%", "status": "Active"},
    {"id": "0007", "name": "Alex", "dPercent": "55%", "status": "Active"},
    {"id": "0008", "name": "Alex", "dPercent": "75%", "status": "Active"},
    ];

  final List<Map<String, dynamic>> regionalPromotionList = [
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    ];

  final List<Map<String, dynamic>> seasonalPromotionList = [
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "status": "Active"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "status": "Active"},
    ];

  final List<Map<String, dynamic>> referralPromotionList = [
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Puerto Plata", "progress": "3/5"},
    {"id": "0001", "name": "Alex", "region": "Santo Domingo", "progress": "3/5"},
    ];

  final List<Map<String, dynamic>> popupList = [
    {"title": "Buy Propane Sensor Now!", "subtitle": "Get real-time tank monitoring", "dataCreated": "2024-04-10 14:30", "status": "active"},
    {"title": "Buy Propane Sensor Now!", "subtitle": "Get real-time tank monitoring", "dataCreated": "2024-04-10 14:30", "status": "active"},
    {"title": "Buy Propane Sensor Now!", "subtitle": "Get real-time tank monitoring", "dataCreated": "2024-04-10 14:30", "status": "active"},
    {"title": "Buy Propane Sensor Now!", "subtitle": "Get real-time tank monitoring", "dataCreated": "2024-04-10 14:30", "status": "active"},
    {"title": "Buy Propane Sensor Now!", "subtitle": "Get real-time tank monitoring", "dataCreated": "2024-04-10 14:30", "status": "active"},
  ];

  final List<Map<String, dynamic>> couponList = [
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    {"cName" : "Apology20", "amount" : "20", "name": "John", "expDate": "2024-11-25", 'reason' : 'Delivery delay issue' , "status": "active"},
    ];

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = await image.readAsBytes();
    }
  }

  final int itemsPerPage = 3;

  List<Map<String, dynamic>> get currentPageFirstDelivery {
    final startIndex = (currentFTDeliveryPage.value - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    if(selectedIndex.value == 0) {
      return fTimeDeliveryList.sublist(
        startIndex,
        endIndex > fTimeDeliveryList.length ? fTimeDeliveryList.length : endIndex,
      );
    }
    else if (selectedIndex.value == 1){
      return dPercentList.sublist(
        startIndex,
        endIndex > dPercentList.length ? dPercentList.length : endIndex,
      );
    }
    else if(selectedIndex.value == 2){
      return regionalPromotionList.sublist(
        startIndex,
        endIndex > regionalPromotionList.length ? regionalPromotionList.length : endIndex,
      );
    }
    else if(selectedIndex.value == 3){
      return seasonalPromotionList.sublist(
        startIndex,
        endIndex > seasonalPromotionList.length ? seasonalPromotionList.length : endIndex,
      );
    }
    else if(selectedIndex.value == 4){
      return referralPromotionList.sublist(
        startIndex,
        endIndex > referralPromotionList.length ? referralPromotionList.length : endIndex,
      );
    }
    else if(selectedIndex.value == 5){
      return popupList.sublist(
        startIndex,
        endIndex > popupList.length ? popupList.length : endIndex,
      );
    }
    else {
      return couponList.sublist(
        startIndex,
        endIndex > couponList.length ? couponList.length : endIndex,
      );
    }
  }

  int get totalPages {
    List<Map<String, dynamic>> currentList;

    if (selectedIndex.value == 0) {
      currentList = fTimeDeliveryList;
    } else if (selectedIndex.value == 1) {
      currentList = dPercentList;
    } else if (selectedIndex.value == 2) {
      currentList = regionalPromotionList;
    } else if (selectedIndex.value == 3) {
      currentList = seasonalPromotionList;
    } else if (selectedIndex.value == 4) {
      currentList = referralPromotionList;
    } else if (selectedIndex.value == 5) {
      currentList = popupList;
    }  else {
      currentList = couponList;
    }
    return (currentList.length / itemsPerPage).ceil();
  }

  void changeFTDPage(int pageNumber) {
    if (pageNumber > 0 && pageNumber <= totalPages) {
      currentFTDeliveryPage.value = pageNumber;
    }
  }

  void goToFTDPreviousPage() {
    if (currentFTDeliveryPage.value > 1) {
      currentFTDeliveryPage.value -= 1;
    }
  }

  void goToFTDNextPage() {
    if (currentFTDeliveryPage.value < totalPages) {
      currentFTDeliveryPage.value += 1;
    }
  }

  bool get isFTDBackButtonDisabled => currentFTDeliveryPage.value == 1;

  bool get isFTDNextButtonDisabled => currentFTDeliveryPage.value == totalPages;

}