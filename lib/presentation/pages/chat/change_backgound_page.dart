import 'package:chat_task/presentation/controllers/chat/chat_cubit.dart';
import 'package:chat_task/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/chat/change_background_or_chatbox_item.dart';

class ChangeBackgoundPage extends StatelessWidget {
  const ChangeBackgoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Change Background",
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 40.h),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/images/cyber-security-modern-internet-browsing-meadow-pattern-with-lighting-effect-dark-background 1.png"))),
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25.w,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: ChatCubit.get(context).backgrounds.length,
                    itemBuilder: (context, index) {
                      var background =
                          ChatCubit.get(context).backgrounds[index];
                      return ChangeBackgroundOrChatBoxItem(
                        image: background,
                        index: index,
                        change: () {
                          ChatCubit.get(context)
                              .changeBackground(index)
                              .then((_) {
                            Navigator.pop(context);
                          });
                        },
                        isChatBox: false,
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
