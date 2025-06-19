import 'package:chat_task/data/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  final List<Message> messages = [
    Message(
        text: "Hello, how are you doing?",
        isMe: true,
        time: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(
        text: "I'm doing well, thank you! How can I help you today?",
        isMe: false,
        time: DateTime.now().subtract(const Duration(minutes: 4))),
    Message(
        text:
            "I have a question about the return policy for a product I purchased.",
        isMe: true,
        time: DateTime.now().subtract(const Duration(minutes: 3))),
    Message(
        text: "I'm doing well, thank you! How can I help you today?",
        isMe: false,
        time: DateTime.now().subtract(const Duration(minutes: 2))),
    Message(
        text:
            "I have a question about the return policy for a product I purchased.",
        isMe: true,
        time: DateTime.now().subtract(const Duration(minutes: 1))),
  ];
  final List<String> backgrounds = [
    "assets/images/Rectangle 22.png",
    "assets/images/Rectangle 21.png",
    "assets/images/Rectangle 22.png",
    "assets/images/Rectangle 21.png",
    "assets/images/Rectangle 21.png",
    "assets/images/Rectangle 22.png",
  ];
  List<String> chatBoxColors = [
    "#6C52FF",
    "#C5048E",
    "#FFDD00",
    "#FF5852",
    "#009022",
    "#00A4B6",
  ];
  Future<void> addMessage({required String text}) async {
    Message message = Message(text: text, isMe: true, time: DateTime.now());
    if (text.isNotEmpty) {
      messages.add(message);
    }
    emit(MessageAdded());
  }

  int currentBackgroundIndex = 0;

  Future<void> changeBackground(int index) async {
    currentBackgroundIndex = index;
    emit(BackgroundChanged());
  }

  int currentChatBoxColorIndex = 0;
  Future<void> changeChatBoxColor({required int index}) async {
    currentChatBoxColorIndex = index;
    emit(ChatBoxColorChanged());
  }

  Future<void> deleteChat() async {
    messages.clear();
    emit(ChatDeleted());
  }

  Future<void> deleteMessage(int index) async {
    messages[index].isDeleted = true;
    emit(MessageDeleted());
  }
}
