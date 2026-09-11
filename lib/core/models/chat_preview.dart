class ChatPreview {
  const ChatPreview({
    required this.name,
    required this.avatarAsset,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.showReadReceipt = false,
  });

  final String name;
  final String avatarAsset;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool showReadReceipt;
}
