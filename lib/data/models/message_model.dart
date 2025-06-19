class Message {
  final String text;
  final bool isMe;
  final DateTime time;
  bool isDeleted;

  Message(
      {required this.text,
      required this.isMe,
      required this.time,
      this.isDeleted = false});
}
