class Message {
  final String sender;
  final String message;
  final DateTime sendTime;

  Message({
    required this.sender,
    required this.message,
    required this.sendTime,
  });

  bool get isRightAligned {
    return sender == "Lonzo M.";
  }
}