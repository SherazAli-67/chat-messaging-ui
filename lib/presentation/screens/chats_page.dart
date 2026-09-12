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
                itemBuilder: (_, index) => _buildChatTile(chat: AppData.chats[index], index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPressable({required Widget child}) {
    return _PressScale(child: child);
  }

  Widget _buildEntrance({required int index, required Widget child}) {
    final start = (index * 0.08).clamp(0.0, 0.5);
    final end = (start + 0.45).clamp(0.0, 1.0);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      curve: Interval(start, end, curve: Curves.easeOutCubic),
      builder: (_, value, animatedChild) => Opacity(
        opacity: value,
        child: Transform.translate(offset: Offset(0, 12 * (1 - value)), child: animatedChild),
      ),
      child: child,
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
        _buildPressable(
          child: Stack(
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
                child: SvgPicture.asset(AppIcons.icAddUser),
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
    return _buildPressable(
      child: SizedBox(
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
                  SvgPicture.asset(AppIcons.icAdd, width: 20),
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
      ),
    );
  }

  Widget _buildStoryItem({required Story story}) {
    return _buildPressable(
      child: SizedBox(
        width: 50,
        child: Column(
          spacing: 8,
          children: [
            ClipOval(
              child: Image.asset(story.avatarAsset, height: 50, fit: .cover),
            ),
            Text(story.name, style: AppTextStyles.storyName, maxLines: 1, overflow: .ellipsis),
          ],
        ),
      ),
    );
  }

  Widget _buildChatsSectionHeader() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(StringConst.chats, style: AppTextStyles.sectionTitle),
        _buildPressable(child: SvgPicture.asset(AppIcons.icMore, height: 4, width: 20)),
      ],
    );
  }

  Widget _buildChatTile({required ChatPreview chat, required int index}) {
    final hasUnread = chat.unreadCount > 0;
    return _buildEntrance(
      index: index,
      child: _buildPressable(
        child: Row(
          spacing: 14,
          crossAxisAlignment: .start,
          children: [
            ClipOval(
              child: Image.asset(chat.avatarAsset, height: 50),
            ),
            Expanded(
              child: Padding(
                padding: .symmetric(vertical: 6),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [
                    Text(chat.name, style: AppTextStyles.chatName, maxLines: 1, overflow: .ellipsis),
                    Row(
                      spacing: 6,
                      children: [
                        if (chat.showReadReceipt) SvgPicture.asset(AppIcons.icTickDouble),
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
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeOutBack,
                      builder: (_, value, child) => Transform.scale(scale: value, child: child),
                      child: Container(
                        width: 22,
                        height: 22,
                        alignment: .center,
                        decoration: BoxDecoration(
                          color: AppColors.errorColor,
                          shape: .circle,
                        ),
                        child: Text('${chat.unreadCount}', style: AppTextStyles.unreadBadge),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PressScale extends StatefulWidget {
  const _PressScale({required this.child});

  final Widget child;

  @override
  State<_PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<_PressScale> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: .opaque,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
