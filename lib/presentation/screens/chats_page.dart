import 'package:chat_messaging_ui/constants/string_const.dart';
import 'package:chat_messaging_ui/core/app_colors.dart';
import 'package:chat_messaging_ui/core/app_data.dart';
import 'package:chat_messaging_ui/core/app_icons.dart';
import 'package:chat_messaging_ui/core/app_textstyles.dart';
import 'package:chat_messaging_ui/core/models/chat_preview.dart';
import 'package:chat_messaging_ui/core/models/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          spacing: 28,
          children: [
            Padding(
              padding: .only(left: 20, right: 20, top: 24),
              child: _buildGreetingHeader(),
            ),
            _buildStoriesRow(),
            Padding(
              padding: .symmetric(horizontal: 20),
              child: _buildChatsSectionHeader(),
            ),
            Expanded(
              child: ListView.separated(
                padding: .fromLTRB(20, 0, 20, 90 + bottomInset),
                itemCount: AppData.chats.length,
                separatorBuilder: (_, _) => const SizedBox(height: 20),
                itemBuilder: (_, index) => _buildChatTile(chat: AppData.chats[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingHeader() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .start,
      children: [
        Column(
          spacing: 4,
          crossAxisAlignment: .start,
          children: [
            Text(AppData.greeting, style: AppTextStyles.greeting),
            Text(AppData.unreadMessagesLabel, style: AppTextStyles.unreadSubtitle),
          ],
        ),
        Stack(
          clipBehavior: .none,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.neutral200Color,
                shape: .circle,
              ),
              alignment: .center,
              child: SvgPicture.asset(AppIcons.icAddUser, width: 16, height: 16),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.errorColor,
                  shape: .circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStoriesRow() {
    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: .horizontal,
        padding: .symmetric(horizontal: 20),
        itemCount: AppData.stories.length + 1,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (_, index) {
          if (index == 0) return _buildAddStoryItem();
          return _buildStoryItem(story: AppData.stories[index - 1]);
        },
      ),
    );
  }

  Widget _buildAddStoryItem() {
    return SizedBox(
      width: 57,
      child: Column(
        spacing: 8,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              alignment: .center,
              children: [
                Image.asset(AppIcons.icAddStoryRing, width: 50, height: 50),
                SvgPicture.asset(AppIcons.icAdd, width: 20, height: 20),
              ],
            ),
          ),
          Text(
            StringConst.addStory,
            style: AppTextStyles.addStoryLabel,
            textAlign: .center,
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem({required Story story}) {
    return SizedBox(
      width: 50,
      child: Column(
        spacing: 8,
        children: [
          ClipOval(
            child: Image.asset(story.avatarAsset, width: 50, height: 50, fit: .cover),
          ),
          Text(
            story.name,
            style: AppTextStyles.storyName,
            textAlign: .center,
            maxLines: 1,
            overflow: .ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildChatsSectionHeader() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(StringConst.chats, style: AppTextStyles.sectionTitle),
        SvgPicture.asset(AppIcons.icMore, width: 20, height: 4),
      ],
    );
  }

  Widget _buildChatTile({required ChatPreview chat}) {
    final hasUnread = chat.unreadCount > 0;

    return Row(
      spacing: 14,
      crossAxisAlignment: .start,
      children: [
        ClipOval(
          child: Image.asset(chat.avatarAsset, width: 50, height: 50, fit: .cover),
        ),
        Expanded(
          child: Padding(
            padding: .symmetric(vertical: 6),
            child: Column(
              spacing: 5,
              crossAxisAlignment: .start,
              children: [
                Text(
                  chat.name,
                  style: AppTextStyles.chatName,
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
                Row(
                  spacing: 6,
                  children: [
                    if (chat.showReadReceipt)
                      SvgPicture.asset(AppIcons.icTickDouble, width: 16, height: 16),
                    Expanded(
                      child: Text(
                        chat.lastMessage,
                        style: hasUnread ? AppTextStyles.chatPreviewUnread : AppTextStyles.chatPreview,
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: .only(top: 4),
          child: Column(
            spacing: 4,
            crossAxisAlignment: .end,
            children: [
              Text(chat.time, style: AppTextStyles.chatTime),
              if (hasUnread)
                Container(
                  width: 22,
                  height: 22,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: AppColors.errorColor,
                    shape: .circle,
                  ),
                  child: Text('${chat.unreadCount}', style: AppTextStyles.unreadBadge),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
