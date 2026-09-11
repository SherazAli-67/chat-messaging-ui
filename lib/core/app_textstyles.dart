import 'package:chat_messaging_ui/constants/string_const.dart';
import 'package:chat_messaging_ui/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const greeting = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 24,
    fontWeight: .w500,
    color: AppColors.neutral1000Color,
    height: 1.2,
  );

  static const sectionTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 24,
    fontWeight: .w500,
    color: AppColors.neutral1000Color,
    height: 1.2,
  );

  static const unreadSubtitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w400,
    color: AppColors.neutral500Color,
    height: 1.2,
  );

  static const chatName = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 16,
    fontWeight: .w500,
    color: AppColors.neutral900Color,
    height: 1.2,
  );

  static const chatPreview = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w400,
    color: AppColors.neutral600Color,
    height: 1.2,
  );

  static const chatPreviewUnread = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w400,
    color: AppColors.neutral800Color,
    height: 1.2,
  );

  static const chatTime = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w500,
    color: AppColors.neutral600Color,
    height: 1.2,
  );

  static const storyName = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w400,
    color: AppColors.neutral600Color,
    height: 1.2,
  );

  static const addStoryLabel = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w400,
    color: AppColors.neutral800Color,
    height: 1.2,
  );

  static const newButton = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 14,
    fontWeight: .w400,
    color: AppColors.neutral100Color,
    height: 1.2,
  );

  static const cancelButton = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 14,
    fontWeight: .w500,
    color: AppColors.baseBlackColor,
    height: 1.2,
  );

  static const actionSheetTitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 12,
    fontWeight: .w500,
    color: AppColors.neutral900Color,
    height: 1.2,
  );

  static const actionSheetSubtitle = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 10,
    fontWeight: .w400,
    color: AppColors.neutral600Color,
    height: 1.2,
  );

  static const unreadBadge = TextStyle(
    fontFamily: StringConst.appFontFamily,
    fontSize: 8,
    fontWeight: .w500,
    color: AppColors.whiteColor,
    height: 1.2,
  );
}
