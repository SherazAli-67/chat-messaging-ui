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
            //greeting, greeting
            Text(AppData.greeting, style: AppTextStyles.greeting,),
            // Text(AppData.greeting, style: AppTextStyles.greeting),
            //unreadMessagesLabel, unreadSubtitle
            Text(AppData.unreadMessagesLabel, style: AppTextStyles.unreadSubtitle,)
            // Text(AppData.unreadMessagesLabel, style: AppTextStyles.unreadSubtitle),
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
              //icAddUser, 16
              child: SvgPicture.asset(AppIcons.icAddUser)
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
                //icAddStoryRing-png, 50
                Image.asset(AppIcons.icAddStoryRing, width: 50, height: 50),
                // Image.asset(AppIcons.icAddStoryRing, width: 50, height: 50),
                //icAdd, 20
                SvgPicture.asset(AppIcons.icAdd, width: 20,)
                // SvgPicture.asset(AppIcons.icAdd, width: 20, height: 20),
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

            //avatarAsset, 50, cover
            child: Image.asset(story.avatarAsset, height: 50, fit: .cover),
          ),
          //story.name, storyName, .center, maxLines: 1, .ellipsis
          Text(story.name, style: AppTextStyles.storyName, maxLines: 1, overflow: .ellipsis,)

        ],
      ),
    );
  }

  Widget _buildChatsSectionHeader() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        //chats, sectionTitle
        Text(StringConst.chats, style: AppTextStyles.sectionTitle,),
        //icMore, width:20, height:4
        SvgPicture.asset(AppIcons.icMore, height: 4, width: 20)
      ],
    );
  }

  Widget _buildChatTile({required ChatPreview chat}) {
    final hasUnread = chat.unreadCount > 0;

    return Row(
      spacing: 14,
      crossAxisAlignment: .start,
      children: [
        //chat.avatarAsset, 50, cover
        ClipOval(
          child: Image.asset(chat.avatarAsset, height: 50,)
        ),
        Expanded(
          child: Padding(
            padding: .symmetric(vertical: 6),
            child: Column(
              spacing: 5,
              crossAxisAlignment: .start,
              children: [
                //chat.name, chatName, maxLines:1, ellipsis
                Text(chat.name, style: AppTextStyles.chatName, maxLines: 1, overflow: .ellipsis),
                Row(
                  spacing: 6,
                  children: [
                    if (chat.showReadReceipt)
                      //icTickDouble, 16
                      SvgPicture.asset(AppIcons.icTickDouble),
                    Expanded(
                      child: Text(
                        //chat.lastMessage
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
              Text(chat.time, style: AppTextStyles.chatTime,),
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
