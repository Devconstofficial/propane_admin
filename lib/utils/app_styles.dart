import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle buttonTextStyle() => GoogleFonts.workSans(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: kBlackColor);

  static TextStyle headingTextStyle() => GoogleFonts.montserrat(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: kBlackColor);

  static TextStyle rubikTextStyle() => GoogleFonts.rubik(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: kBlackColor);

  static TextStyle workSansTextStyle() => GoogleFonts.workSans(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: kBlackColor);

  static TextStyle poppinsTextStyle() => GoogleFonts.poppins(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: kBlackColor,);
  
  static TextStyle robotoTextStyle() => GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: kBlackColor.withOpacity(0.4),);

  static TextStyle interTextStyle() => GoogleFonts.inter(
    fontSize: 16.sp, fontWeight: FontWeight.w500, color: kBlackColor,);

  static TextStyle latoTextStyle() => GoogleFonts.lato(
    fontSize: 16.sp, fontWeight: FontWeight.w400, color: kTermsColor,);

  static BorderRadius get customBorderAll => BorderRadius.all(
    Radius.circular(8),
  );

  static BorderRadius get searchFieldBorder20=> BorderRadius.all(
    Radius.circular(20),
  );

  static BorderRadius get customBorder16=> BorderRadius.all(
    Radius.circular(16),
  );


  static BorderRadius get customBorderAll100 => BorderRadius.all(
    Radius.circular(100),
  );

  static BorderRadius get customBorder8 => BorderRadius.all(
    Radius.circular(8),
  );

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: 37.w);
  EdgeInsets get horizontal28 => EdgeInsets.symmetric(horizontal: 28.w);
  EdgeInsets get appBarPadding => EdgeInsets.only(left: 28.0.w,right: 10.w,top: 30);
  EdgeInsets get horizontal16 => EdgeInsets.symmetric(horizontal: 16.0.w);
  EdgeInsets get horizontal24 => EdgeInsets.symmetric(horizontal: 24.0.w);
  EdgeInsets get vertical24 => const EdgeInsets.symmetric(vertical: 24.0);
  EdgeInsets get horizontal8 => EdgeInsets.symmetric(horizontal: 8.0.w);
  EdgeInsets get paginationBtnPadding => EdgeInsets.symmetric(horizontal: 6.0.w);
  EdgeInsets get paddingAll20 => const EdgeInsets.all(20.0);
  EdgeInsets get paddingAll21 => const EdgeInsets.all(21.0);
  EdgeInsets get paddingAll24 => const EdgeInsets.all(24.0);
  EdgeInsets get paddingAll16 => const EdgeInsets.all(16.0);
  EdgeInsets get dialogPadding => EdgeInsets.symmetric(vertical: 24,horizontal: 35.w);
  EdgeInsets get shareDialogPadding => EdgeInsets.symmetric(vertical: 24,horizontal: 26.w);
  EdgeInsets get alertDialogPadding => EdgeInsets.symmetric(vertical: 24,horizontal: 35.w);
  EdgeInsets get subsTilePadding => EdgeInsets.symmetric(horizontal: 25.w,vertical: 12);
  EdgeInsets get bottomSheetPadding => EdgeInsets.symmetric(vertical: 30,horizontal: 36.w);
  EdgeInsets get contentPadding => EdgeInsets.symmetric(horizontal: 20.w,vertical: 18);
  EdgeInsets get loginContainerPadding => EdgeInsets.symmetric(horizontal: 70.w,vertical: 40);
  EdgeInsets get chatPadding => EdgeInsets.symmetric(vertical: 12,horizontal: 24.w);


  static BoxDecoration get boxDecor => BoxDecoration(
    borderRadius: AppStyles.searchFieldBorder20,
    color: kSecondaryColor,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(0, 4),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
  );

  static BoxDecoration get mapContainerDecor => BoxDecoration(
    borderRadius: AppStyles.customBorderAll,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(0, 4),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ],
  );
}

double getWidth(double pixelValue) {
  double baseScreenWidth = 375.0;
  return (pixelValue / baseScreenWidth) * 100.w;
}

double getHeight(double pixelValue) {
  double baseScreenHeight = 812.0;
  return (pixelValue / baseScreenHeight) * 100.h;
}
