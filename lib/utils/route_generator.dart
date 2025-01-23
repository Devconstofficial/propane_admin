import 'package:propane_admin/utils/screen_bindings.dart';
import 'package:propane_admin/view/screens/admin_screen/admin_screen.dart';
import 'package:propane_admin/view/screens/auth_screen/login_screen.dart';
import 'package:propane_admin/view/screens/beverage_screen/beverage_screen.dart';
import 'package:propane_admin/view/screens/job_management_screen/job_management_screen.dart';
import 'package:propane_admin/view/screens/support_screens/support_screen.dart';
import 'package:propane_admin/view/screens/user_screen/user_screen.dart';
import 'package:get/get.dart';
import '../view/screens/admin_screen/add_admin_screen.dart';
import '../view/screens/auth_screen/verify_otp.dart';
import '../view/screens/dashboard/dashboard_screen.dart';
import '../view/screens/driver_screen/create_driver_screen.dart';
import '../view/screens/driver_screen/driver_screen.dart';
import '../view/screens/job_management_screen/job_detail_screen.dart';
import '../view/screens/user_screen/create_user_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kDashboardScreenRoute, page: () => DashboardScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kUserScreenRoute, page: () => const UserScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kDriverScreenRoute, page: () => const DriverScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kJobManagementScreenRoute, page: () => const JobManagementScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kJobDetailScreenRoute, page: () => const JobDetailScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kAdminScreenRoute, page: () => const AdminScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kCreateUserScreenRoute, page: () => const CreateUserScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kCreateDriverScreenRoute, page: () => const CreateDriverScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kAddAdminScreenRoute, page: () => const AddAdminScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kBeverageScreenRoute, page: () => const BeverageScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kLoginScreenRoute, page: () => const LoginScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kVerifyOtpScreenRoute, page: () => const VerifyOtpScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
      GetPage(name: kSupportScreenRoute, page: () => const CustomerSupportScreen(), binding: ScreenBindings(),transition: Transition.noTransition),
    ];
  }
}
