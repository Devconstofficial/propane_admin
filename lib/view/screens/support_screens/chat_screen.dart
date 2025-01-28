import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/common_code.dart';
import '../../side_menu/side_menu.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textField.dart';
import 'controller/support_controller.dart';

class ChatScreen extends GetView<SupportController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        CommonCode.unFocus(context);
      },
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideMenu(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: AppStyles.customBorder8,
                                    border: Border.all(
                                      color: kBorderColor3,
                                      width: 1.w
                                    )
                                  ),
                                  child: ClipRRect(
                                    borderRadius: AppStyles.customBorder8,
                                    child: Image.asset(
                                      kImage3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Kari Rasmussen",
                                      style: AppStyles.workSansTextStyle().copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: kGreyeshColor1),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        const CircleAvatar(radius: 3,backgroundColor: kPrimaryColor,),
                                        SizedBox(width: 4,),
                                        Text(
                                          "Online",
                                          style: AppStyles.workSansTextStyle().copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: kBlackColor.withOpacity(0.5)),
                                        ),
                                        const SizedBox(width: 8,),
                                        Text(
                                          "12:55 am",
                                          style: AppStyles.workSansTextStyle().copyWith(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: kBorderColor2),
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  'Mark as solved',
                                  style: AppStyles.workSansTextStyle().copyWith(
                                      color: kPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Obx(() {
                              return ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                itemCount: controller.messages.length,
                                itemBuilder: (context, index) {
                                  var message = controller.messages[index];
                                  bool isUser = message['isUser'] == true;
                                  return Align(
                                    alignment: isUser
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(16.h),
                                      child: Column(
                                        crossAxisAlignment: isUser
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 367.w,
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 20.w,
                                                        vertical: 12.h),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.only(
                                                        topLeft:
                                                        const Radius.circular(10),
                                                        topRight:
                                                        const Radius.circular(10),
                                                        bottomLeft: Radius.circular(isUser?10 : 0),
                                                        bottomRight: Radius.circular(isUser? 0 : 10),
                                                      ),
                                                      border: Border.all(
                                                          color: isUser
                                                          ? kBorderColor4
                                                          : kPrimaryColor,
                                                        width: 0.5
                                                      ),
                                                      color: isUser
                                                          ? kCream1Color
                                                          : kPrimaryColor,
                                                    ),
                                                    child: Text(
                                                      message['text'] as String,
                                                      style: AppStyles
                                                          .workSansTextStyle()
                                                          .copyWith(
                                                        fontSize: 16.sp,
                                                        fontWeight: FontWeight.w400,
                                                        color: isUser
                                                            ? kBlack3Color
                                                            : kWhiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Row(
                                                  children: [
                                                    isUser
                                                        ? const Icon(
                                                      Icons.check,
                                                      color: kPrimaryColor,
                                                    )
                                                        : const SizedBox(),
                                                    Text(
                                                      '14:22 am',
                                                      style: AppStyles
                                                          .workSansTextStyle()
                                                          .copyWith(
                                                        fontSize: 13.sp,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: AppStyles.customBorder8,
                        border: Border.all(color: kBorderColor4,width: 1.w)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: AppStyles.customBorder8,
                                color: kLightRedColor,
                              ),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            Expanded(
                              child: TextField(
                                controller: controller.messageController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 18),
                                  hintText: 'Your message',
                                  fillColor: kWhiteColor,
                                  hoverColor: kWhiteColor,
                                  focusColor: kWhiteColor,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none
                                ),
                              ),
                            ),
                            SvgPicture.asset(kSmilyIcon,height: 24,width: 24),
                            SizedBox(width: 19),
                            GestureDetector(
                              onTap: () {
                                controller.sendMessage(
                                    controller.messageController.text);
                                controller.messageController.clear();
                              },
                              child: Container(
                                height: 36,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: AppStyles.customBorder8,
                                  color: kLightRedColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Send',
                                      style: AppStyles.workSansTextStyle().copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: kBlackColor3),
                                    ),
                                    SizedBox(width: 8.w),
                                    const Icon(Icons.send),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 19)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
