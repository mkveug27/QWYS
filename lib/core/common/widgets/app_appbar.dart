import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:qwys/core/core.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.leadingWidth = 52,
    this.showBack = false,
    this.backgroundColor,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final double? leadingWidth;
  final bool showBack;
  final Color? backgroundColor;

  static const double _height = 52;
  static const double _iconSize = 20;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    final canPop = ModalRoute.of(context)?.canPop ?? false;

    return AppBar(
      leading: _buildLeading(context, canPop),
      automaticallyImplyLeading: false,
      clipBehavior: Clip.none,
      backgroundColor: backgroundColor ?? colors.transparent,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      titleSpacing: canPop ? sPadding : mPadding,
      title: title,
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: mPadding),
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: colors.transparent,
      iconTheme: IconThemeData(
        size: _iconSize,
        color: colors.textIconDefault,
      ),
      actionsIconTheme: const IconThemeData(size: _iconSize),
    );
  }

  Widget? _buildLeading(BuildContext context, bool canPop) {
    if (leading != null) return leading;
    if (!canPop && !showBack) return null;

    return Align(
      alignment: Alignment.centerRight,
      child: AppIconButton(
        icon: Icons.arrow_left,
        buttonSize: IconButtonSize.medium,
        buttonColor: IconButtonColor.def,
        onTap: () => _handleBack(context, canPop),
      ),
    );
  }

  void _handleBack(BuildContext context, bool canPop) {
    if (canPop) {
      context.pop();
    } else {
      context.go('/home');
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
