import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

import 'base_text.dart';

// common appbar code to frequent use
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.transparent;
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final bool isBackButton;
  final bool isBack;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool isGroupChat;
  final Widget? widget;
  final Color? backGroundColor;
  final void Function()? onTap;
  final PreferredSizeWidget? bottom;
  final double? appBarHeight;

  const BaseAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.isBackButton = true,
    this.isBack = false,
    this.onTap,
    this.isGroupChat = false,
    this.widget,
    this.systemOverlayStyle,
    this.backGroundColor,
    this.bottom,
    this.appBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: systemOverlayStyle,
      leading: isBackButton
          ? InkWell(
              onTap: isBack
                  ? onTap
                  : () {
                      Get.back();
                    },
              child: Padding(
                  padding: EdgeInsets.all(getSize(20)),
                  child: const Icon(Icons.arrow_back_ios_rounded)),
            )
          : SizedBox(
              height: getSize(0),
            ),
      leadingWidth: getSize(70),
      title: isGroupChat
          ? widget
          : BaseText(
              text: title,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
      backgroundColor: backGroundColor ?? Colors.white,
      elevation: 0,
      actions: actions,
      centerTitle: true,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60);
}
