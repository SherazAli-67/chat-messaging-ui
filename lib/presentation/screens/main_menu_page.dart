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

          //buildBottomNav
          child: _buildBottomNav()
        ),
      ],
    );
  }

  void _goBranch(int index) {
    setState(() => _isNewSheetOpen = false);
    widget.navigationShell.goBranch(index);
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
            //icHome
            _buildBottomNavItem(currentIndex: widget.navigationShell.currentIndex, index: 0, icon: AppIcons.icHome),
            // _buildBottomNavItem(currentIndex: widget.navigationShell.currentIndex, index: 0, icon: AppIcons.icHome),
            GestureDetector(
              onTap: () => setState(() => _isNewSheetOpen = !_isNewSheetOpen),
              child: Container(
                padding: .symmetric(horizontal: 48, vertical: 11),
                decoration: BoxDecoration(
                  color: _isNewSheetOpen ? AppColors.whiteColor : AppColors.neutral1000Color,
                  borderRadius: .circular(1000),
                  border: _isNewSheetOpen ? .all(color: AppColors.neutral200Color) : null,
                  boxShadow: _isNewSheetOpen ? [
                          BoxShadow(
                            color: AppColors.neutral600Color.withValues(alpha: 0.12),
                            blurRadius: 12,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: _isNewSheetOpen
                    ? Text(StringConst.cancel, style: AppTextStyles.cancelButton)
                    : Row(
                        spacing: 4,
                        mainAxisSize: .min,
                        children: [
                          //icPlus
                          SvgPicture.asset(AppIcons.icPlus, width: 20, height: 20),
                          // SvgPicture.asset(AppIcons.icPlus, width: 20, height: 20),

                          //newLabel, newButton
                          Text(StringConst.newLabel, style: AppTextStyles.newButton,)
                          // Text(StringConst.newLabel, style: AppTextStyles.newButton),
                        ],
                      ),
              ),
            ),
            //icProfile
            _buildBottomNavItem(currentIndex: widget.navigationShell.currentIndex, index: 1, icon: AppIcons.icProfile)
            // _buildBottomNavItem(currentIndex: widget.navigationShell.currentIndex, index: 1, icon: AppIcons.icProfile),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({required int currentIndex, required int index, required String icon}) {
    return GestureDetector(
      onTap: () => _goBranch(index),
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: .mode(index == currentIndex ? AppColors.neutral1000Color : AppColors.neutral600Color, .srcIn,),
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
            elevation: 8,
            shadowColor: AppColors.neutral600Color.withValues(alpha: 0.2),
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
    return GestureDetector(
      behavior: .opaque,
      onTap: () => setState(() => _isNewSheetOpen = false),
      child: Row(
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
      ),
    );
  }
}
