import 'package:chat_task/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class ChangeBackgroundOrChatBoxItem extends StatelessWidget {
  final String image;
  final int index;
  final VoidCallback change;
  final bool isChatBox;
  const ChangeBackgroundOrChatBoxItem({
    super.key,
    required this.image,
    required this.index,
    required this.change,
    required this.isChatBox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isChatBox
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.w),
                        width: 110.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                            color: HexColor(image),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.w),
                                bottomLeft: Radius.circular(10.w),
                                bottomRight: Radius.circular(10.w))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Hi",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Image.asset(
                  image,
                  width: 110.w,
                  height: 100.h,
                ),
          GestureDetector(
            onTap: change,
            child: Container(
              width: 130.w,
              height: 35.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.purble,
                    AppColors.darkBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Center(
                child: Text(
                  "Change",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
