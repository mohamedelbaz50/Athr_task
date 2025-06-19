import 'package:chat_task/data/models/message_model.dart';
import 'package:chat_task/presentation/controllers/chat/chat_cubit.dart';
import 'package:chat_task/presentation/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatefulWidget {
  final Message message;
  final int index;
  const MessageBubble({
    super.key,
    required this.message,
    required this.index,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool isDeletedOpened = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Align(
        alignment:
            widget.message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !widget.message.isMe ? const UserImage() : const SizedBox(),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: widget.message.isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  !widget.message.isMe
                      ? Text(
                          "Maria",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp),
                        )
                      : const SizedBox(),
                  GestureDetector(
                    onLongPress: () {
                      setState(() {
                        if (widget.message.isMe) {
                          isDeletedOpened = !isDeletedOpened;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: (widget.message.isMe &&
                                  !widget.message.isDeleted)
                              ? HexColor(ChatCubit.get(context).chatBoxColors[
                                  ChatCubit.get(context)
                                      .currentChatBoxColorIndex])
                              : widget.message.isDeleted
                                  ? Colors.grey
                                  : Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                  widget.message.isMe ? 0 : 10.w),
                              topLeft: Radius.circular(
                                  widget.message.isMe ? 10.w : 0),
                              bottomLeft: Radius.circular(10.w),
                              bottomRight: Radius.circular(10.w))),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 30.w),
                      child: widget.message.isDeleted
                          ? Row(
                              children: [
                                Image.asset("assets/images/Frame 42.png",
                                    width: 24.w, height: 24.w),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "You deleted this message",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp),
                                )
                              ],
                            )
                          : Text(
                              widget.message.text,
                              style: TextStyle(
                                  color: widget.message.isMe
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp),
                            ),
                    ),
                  ),
                  isDeletedOpened
                      ? GestureDetector(
                          onTap: () {
                            ChatCubit.get(context)
                                .deleteMessage(widget.index)
                                .then((_) {
                              setState(() {
                                isDeletedOpened = false;
                              });
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            width: 170.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7.h),
                                    bottomLeft: Radius.circular(7.h))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delete message",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp),
                                ),
                                Image.asset(
                                  "assets/images/tabler_trash.png",
                                  width: 24.w,
                                  height: 24.w,
                                )
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Text(
                    DateFormat('h:mm a').format(widget.message.time),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
