import 'package:chat_task/core/styles/colors.dart';
import 'package:chat_task/presentation/controllers/chat/chat_cubit.dart';
import 'package:chat_task/presentation/controllers/chat/chat_state.dart';
import 'package:chat_task/presentation/pages/change_chat_box_page.dart';
import 'package:chat_task/presentation/pages/chat/change_backgound_page.dart';
import 'package:chat_task/presentation/widgets/chat/add_message_widget.dart';
import 'package:chat_task/presentation/widgets/chat/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        cubit.messages.sort((a, b) => a.time.compareTo(b.time));
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 75.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const UserImage(),
                    SizedBox(
                      width: 7.5.w,
                    ),
                    Text(
                      "Maria",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/fluent_call-12-regular.png",
                          width: 28.w,
                          height: 28.w,
                        )),
                    PopupMenuButton<String>(
                      color: Colors.white,
                      icon: Image.asset(
                        "assets/images/charm_menu-meatball.png",
                        width: 28.w,
                        height: 28.w,
                      ),
                      onSelected: (String choice) {
                        switch (choice) {
                          case 'Change Background':
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangeBackgoundPage()));
                            break;
                          case 'Change Chat Box':
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangeChatBoxPage()));
                            break;
                          case 'Delete Chat':
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Delete Chat?"),
                                content: const Text(
                                    "Are you sure you want to delete this chat?"),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      cubit.deleteChat().then((_) {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Text("Delete",
                                        style: TextStyle(color: Colors.red)),
                                  ),
                                ],
                              ),
                            );
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem<String>(
                          value: 'Change Background',
                          child: Text('Change Background'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Change Chat Box',
                          child: Text('Change Chat Box'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Delete Chat',
                          child: Text('Delete Chat'),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            centerTitle: true,
            elevation: 0,
            flexibleSpace: Container(
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
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            cubit.backgrounds[cubit.currentBackgroundIndex]))),
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var message = ChatCubit.get(context).messages[index];
                    return MessageBubble(
                      message: message,
                      index: index,
                    );
                  },
                  itemCount: ChatCubit.get(context).messages.length,
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                ),
              )),
              AddMessageWidget(cubit: cubit)
            ],
          ),
        );
      },
    );
  }
}

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.w,
      child: Image.asset("assets/images/Ellipse 2.png"),
    );
  }
}
