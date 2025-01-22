import 'package:propane_admin/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import 'controller/menu_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(MenuControllers());

  @override
  Widget build(BuildContext context) {
    // bool isTablet = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: kWhiteColor,
      shape: const Border(right: BorderSide(color: kBackGroundColor)),
      width: 220,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 330.h,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: AppStyles.customBorderAll100
                        ),
                        child: ClipRRect(
                            borderRadius: AppStyles.customBorderAll100,
                            child: Image.asset(kAdminImage,fit: BoxFit.cover,))
                    ),
                    SizedBox(height: 29.h,),
                    Text('Admin',style: AppStyles.workSansTextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.w600),),
                    Text('Prime Leonard',style: AppStyles.workSansTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: kGrey2),),
                    // SizedBox(height: 65.h,),

                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(0);
                              Get.toNamed(kDashboardScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 49,
                                      decoration: BoxDecoration(
                                        color: menuController.selectedIndex.value == 0 ? kPrimaryColor : kWhiteColor,
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only( left: 34.w),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              kDashboardIcon,
                                              height: 26,
                                              width: 26,
                                              colorFilter: ColorFilter.mode(
                                                menuController.selectedIndex.value == 0 ? kWhiteColor : kBlackColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                            Text(
                                                "Dashboard",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                  color: menuController.selectedIndex.value == 0
                                                      ? kWhiteColor
                                                      : kBlackColor,
                                                  fontSize: 16
                                                ),
                                              ),
                                          ],
                                        ),
                                      )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 0 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(1);
                              Get.toNamed(kUserScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 1 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kUserIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 1 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Users",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                  color: menuController.selectedIndex.value == 1
                                                      ? kWhiteColor
                                                      : kBlackColor,
                                                    fontSize: 16
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 1 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(2);
                              Get.toNamed(kDriverScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 2 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kDriverIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 2 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Driver",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                  color: menuController.selectedIndex.value == 2
                                                      ? kWhiteColor
                                                      : kBlackColor,
                                                    fontSize: 16

                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 2 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(3);
                              // Get.toNamed(kSubscriptionScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 3 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kTruckIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 3 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Jobs",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                  color: menuController.selectedIndex.value == 3
                                                      ? kWhiteColor
                                                      : kBlackColor,
                                                    fontSize: 16

                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 3 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(4);
                              // Get.toNamed(kCommentScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 4 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kSupportIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 4 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Support",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                  color: menuController.selectedIndex.value == 4
                                                      ? kWhiteColor
                                                      : kBlackColor,
                                                    fontSize: 16

                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 4 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(5);
                              // Get.toNamed(kBlogScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 5 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kRevenueIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 5 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Revenue",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                  color: menuController.selectedIndex.value == 5
                                                      ? kWhiteColor
                                                      : kBlackColor,
                                                    fontSize: 16
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 5 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(6);
                              // Get.toNamed(kNotificationScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 6 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kAnalysisIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 6 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Flexible(
                                                child: Text(
                                                  "Analytics and Reporting",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppStyles.workSansTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 6
                                                        ? kWhiteColor
                                                        : kBlackColor,
                                                      fontSize: 16

                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 6 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(7);
                              // Get.toNamed(kTermsScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 7 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kPromotionIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 7 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Promotions",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 7
                                                        ? kWhiteColor
                                                        : kBlackColor,
                                                    fontSize: 16

                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 7 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(8);
                              Get.toNamed(kAdminScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 8 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kAdminIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 8 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Admins",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 8
                                                        ? kWhiteColor
                                                        : kBlackColor,
                                                    fontSize: 16

                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 8 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 35.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(9);
                              Get.toNamed(kBeverageScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 9 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only( left: 34.w),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kBeveragesIcon,
                                                height: 26,
                                                width: 26,
                                                colorFilter: ColorFilter.mode(
                                                  menuController.selectedIndex.value == 9 ? kWhiteColor : kBlackColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                kBeverages,
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                    color: menuController.selectedIndex.value == 9
                                                        ? kWhiteColor
                                                        : kBlackColor,
                                                    fontSize: 16

                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 9 ? kOrangeColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 86.h,),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(10);
                              Get.offAllNamed(kLoginScreenRoute);
                            },
                            child: SizedBox(
                              width: width,
                              height: 49,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        height: 49,
                                        decoration: BoxDecoration(
                                          color: menuController.selectedIndex.value == 10 ? kPrimaryColor : kWhiteColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only( left: 24),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                kLogoutIcon,
                                                height: 22,
                                                width: 22,
                                                colorFilter: const ColorFilter.mode(
                                                  kPrimaryColor,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                              Text(
                                                "Logout",
                                                style: AppStyles.workSansTextStyle().copyWith(
                                                    color: kPrimaryColor,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 15.sp
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 49,
                                    width: 5,
                                    color: menuController.selectedIndex.value == 10 ? kSecondaryColor : kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
