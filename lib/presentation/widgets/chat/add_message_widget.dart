import 'package:chat_task/core/styles/colors.dart';
import 'package:chat_task/presentation/controllers/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMessageWidget extends StatelessWidget {
  const AddMessageWidget({
    super.key,
    required this.cubit,
  });

  final ChatCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.purble,
            AppColors.darkBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/solar_camera-linear.png",
                width: 30.w,
                height: 30.w,
              )),
          Expanded(
              child: SizedBox(
            height: 55.h,
            child: TextFormField(
              onFieldSubmitted: (value) {
                cubit.addMessage(text: value);
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Write Something...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.w))),
            ),
          )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/ic_round-mic.png",
                width: 30.w,
                height: 30.w,
              ))
        ],
      ),
    );
  }
}
