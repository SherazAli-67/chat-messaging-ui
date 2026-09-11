import 'package:chat_messaging_ui/constants/string_const.dart';
import 'package:chat_messaging_ui/core/app_icons.dart';
import 'package:chat_messaging_ui/core/models/chat_preview.dart';
import 'package:chat_messaging_ui/core/models/new_action_item.dart';
import 'package:chat_messaging_ui/core/models/story.dart';

class AppData {
  static const userName = 'Sheraz Ali';
  static const unreadCount = 6;

  static String get greeting => '${StringConst.greetingPrefix}$userName';

  static String get unreadMessagesLabel {
    final padded = unreadCount.toString().padLeft(2, '0');
    return '$padded${StringConst.unreadMessagesSuffix}';
  }

  static const stories = [
    Story(name: 'Caroline', avatarAsset: AppIcons.avatarCaroline),
    Story(name: 'Steve', avatarAsset: AppIcons.avatarSteve),
    Story(name: 'Gregory', avatarAsset: AppIcons.avatarGregory),
    Story(name: 'Rosalie', avatarAsset: AppIcons.avatarRosalie),
    Story(name: 'Julius', avatarAsset: AppIcons.avatarJulius),
    Story(name: 'Laura', avatarAsset: AppIcons.avatarLaura),
  ];

  static const chats = [
    ChatPreview(
      name: 'Rafael Mante',
      avatarAsset: AppIcons.avatarRafael,
      lastMessage: 'Figma ipsum component variant main',
      time: '19:45',
    ),
    ChatPreview(
      name: 'Katherine Bernhard',
      avatarAsset: AppIcons.avatarKatherine,
      lastMessage: 'Figma',
      time: '19:45',
      showReadReceipt: true,
    ),
    ChatPreview(
      name: 'Terrence Lemke',
      avatarAsset: AppIcons.avatarTerrence,
      lastMessage: 'Figma ipsum component variant main',
      time: '19:45',
      unreadCount: 2,
    ),
    ChatPreview(
      name: 'Alyssa Wisozk-Kihn',
      avatarAsset: AppIcons.avatarAlyssa,
      lastMessage: 'Figma ipsum component variant main',
      time: '19:45',
    ),
    ChatPreview(
      name: 'Andrew Legros',
      avatarAsset: AppIcons.avatarAndrew,
      lastMessage: 'Figma',
      time: '19:45',
      showReadReceipt: true,
    ),
    ChatPreview(
      name: 'Dixie Haag',
      avatarAsset: AppIcons.avatarDixie,
      lastMessage: 'Figma ipsum component variant main',
      time: '19:45',
      unreadCount: 2,
    ),
    ChatPreview(
      name: 'Rafael Mante',
      avatarAsset: AppIcons.avatarRafael,
      lastMessage: 'Figma ipsum component variant main',
      time: '19:45',
    ),
    ChatPreview(
      name: 'Katherine Bernhard',
      avatarAsset: AppIcons.avatarKatherine,
      lastMessage: 'Figma',
      time: '19:45',
      showReadReceipt: true,
    ),
    ChatPreview(
      name: 'Terrence Lemke',
      avatarAsset: AppIcons.avatarTerrence,
      lastMessage: 'Figma ipsum component variant main',
      time: '19:45',
      unreadCount: 2,
    ),
  ];

  static const newActions = [
    NewActionItem(
      title: StringConst.newChat,
      subtitle: StringConst.newChatSubtitle,
      iconAsset: AppIcons.icMessage,
    ),
    NewActionItem(
      title: StringConst.newContact,
      subtitle: StringConst.newContactSubtitle,
      iconAsset: AppIcons.icContact,
    ),
    NewActionItem(
      title: StringConst.newCommunity,
      subtitle: StringConst.newCommunitySubtitle,
      iconAsset: AppIcons.icUserGroup,
    ),
  ];
}
