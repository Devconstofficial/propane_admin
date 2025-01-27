import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import 'delete_dialog.dart';

class CustomDataRow {
  final String column1Text;
  final String column2Text;
  final String column3Text;
  final String column4Text;
  final String? column5Text;
  final int? index;
  final bool isSwitchOn;
  final bool? isSwitchButton;
  final bool? isCoupon;
  final Function(bool, int)? onSwitchChanged;
  final BuildContext context;

  CustomDataRow({
    required this.column1Text,
    required this.column2Text,
    required this.column3Text,
    required this.column4Text,
    this.column5Text,
    this.index,
    required this.isSwitchOn,
    this.isSwitchButton,
    this.onSwitchChanged,
    this.isCoupon,
    required this.context,
  });

  DataRow buildRow() {
    return DataRow(
      cells: [
        DataCell(
            Text(
                      column1Text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    )),
        DataCell(Text(
          column2Text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(Text(
          column3Text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppStyles.workSansTextStyle()
              .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
        )),
        DataCell(
          Center(
            child: Container(
              width: 93.w,
              height: 27,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  column4Text,
                  style: AppStyles.workSansTextStyle().copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ),
        isSwitchButton == true ? DataCell(
          Center(
            child: SizedBox(
              height: 30,
              child: Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: isSwitchOn!,
                  activeColor: kWhiteColor,
                  inactiveThumbColor: kWhiteColor,
                  trackOutlineColor:
                  const WidgetStatePropertyAll(Colors.transparent),
                  activeTrackColor: kPrimaryColor,
                  onChanged: (value) {
                    onSwitchChanged!(value, index!);
                  },
                ),
              ),
            ),
          ),
        ) : DataCell(
          Center(
            child: Container(
              height: 32,
              width: 96,
              decoration: BoxDecoration(
                  borderRadius: AppStyles.customBorder8,
                  color: kActionsBtnColor,
                  border: Border.all(color: kTableBorderColor, width: 0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: SvgPicture.asset(
                          kEditIcon,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: kLightGreyColor,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteDialog(
                                onDelete: () {},
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset(
                          kDeleteIcon,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
