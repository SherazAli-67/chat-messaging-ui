import 'dart:ui';

import 'package:chat_messaging_ui/constants/string_const.dart';
import 'package:chat_messaging_ui/core/app_colors.dart';
import 'package:chat_messaging_ui/core/app_data.dart';
import 'package:chat_messaging_ui/core/app_icons.dart';
import 'package:chat_messaging_ui/core/app_textstyles.dart';
import 'package:chat_messaging_ui/core/models/new_action_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  bool _isNewSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.navigationShell,
        if (_isNewSheetOpen) Positioned.fill(child: _buildNewActionSheet()),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: _buildBottomNav(),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Material(
      color: AppColors.whiteColor,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(top: BorderSide(color: AppColors.neutral200Color)),
        ),
        padding: .fromLTRB(47, 16, 47, 16 + MediaQuery.paddingOf(context).bottom),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() => _isNewSheetOpen = false);
                widget.navigationShell.goBranch(0);
              },
              child: SvgPicture.asset(AppIcons.icHome, width: 24, height: 24),
            ),
            GestureDetector(
              onTap: () => setState(() => _isNewSheetOpen = !_isNewSheetOpen),
              child: Container(
                padding: .symmetric(horizontal: 48, vertical: 11),
                decoration: BoxDecoration(
                  color: _isNewSheetOpen ? AppColors.whiteColor : AppColors.neutral1000Color,
                  borderRadius: .circular(1000),
                  border: _isNewSheetOpen ? .all(color: AppColors.neutral200Color) : null,
                ),
                child: _isNewSheetOpen
                    ? Text(StringConst.cancel, style: AppTextStyles.cancelButton)
                    : Row(
                        spacing: 4,
                        mainAxisSize: .min,
                        children: [
                          SvgPicture.asset(AppIcons.icPlus, width: 20, height: 20),
                          Text(StringConst.newLabel, style: AppTextStyles.newButton),
                        ],
                      ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _isNewSheetOpen = false);
                widget.navigationShell.goBranch(1);
              },
              child: SvgPicture.asset(AppIcons.icProfile, width: 24, height: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewActionSheet() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => setState(() => _isNewSheetOpen = false),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: AppColors.whiteColor.withValues(alpha: 0.35)),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 74 + MediaQuery.paddingOf(context).bottom,
          child: Material(
            color: AppColors.whiteColor,
            borderRadius: .circular(16),
            child: Padding(
              padding: .symmetric(horizontal: 20, vertical: 24),
              child: Column(
                mainAxisSize: .min,
                children: [
                  for (var i = 0; i < AppData.newActions.length; i++) ...[
                    _buildNewActionRow(action: AppData.newActions[i]),
                    if (i < AppData.newActions.length - 1)
                      Padding(
                        padding: .symmetric(vertical: 16),
                        child: Divider(height: 1, thickness: 1, color: AppColors.neutral200Color),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewActionRow({required NewActionItem action}) {
    return Row(
      spacing: 12,
      children: [
        SvgPicture.asset(action.iconAsset, width: 20, height: 20),
        Expanded(
          child: Column(
            spacing: 4,
            crossAxisAlignment: .start,
            children: [
              Text(action.title, style: AppTextStyles.actionSheetTitle),
              Text(action.subtitle, style: AppTextStyles.actionSheetSubtitle),
            ],
          ),
        ),
      ],
    );
  }
}
