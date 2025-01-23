import 'package:propane_admin/view/screens/beverage_screen/controller/beverage_controller.dart';
import 'package:get/get.dart';
import '../view/screens/admin_screen/controller/admin_controller.dart';
import '../view/screens/auth_screen/controller/auth_controller.dart';
import '../view/screens/dashboard/controller/dashboard_controller.dart';
import '../view/screens/driver_screen/controller/driver_controller.dart';
import '../view/screens/job_management_screen/controller/job_management_controller.dart';
import '../view/screens/support_screens/controller/support_controller.dart';
import '../view/screens/user_screen/controller/user_controller.dart';


class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => DriverController());
    Get.lazyPut(() => AdminController());
    Get.lazyPut(() => BeverageController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => JobController());
    Get.lazyPut(() => SupportController());
  }
}
