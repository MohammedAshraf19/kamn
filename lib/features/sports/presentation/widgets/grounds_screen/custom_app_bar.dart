import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kamn/core/helpers/spacer.dart';
import '../../../../../core/theme/app_pallete.dart';
import '../../../../../core/utils/app_images.dart';

class CustomAppBar {
  static AppBar appBar(
      {required Function()? arrowFunction,
      required Function()? notificationIconFunction,
      required Function()? badgesIconFunction,
      required Function()? profileFunction}) {
    return AppBar(
      elevation: 0,
      backgroundColor:Colors.transparent ,//AppPallete.whiteColor,
      leadingWidth: 45,
      leading: Row(
        children: [
          horizontalSpace(10),
          InkWell(
            onTap: arrowFunction,
            child: Container(
              decoration: const BoxDecoration(
                color: AppPallete.greenColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: AppPallete.lightGrayColor,
              ),
            ),
          ),
        ],
      ),
      actions: [
        badges.Badge(
          ignorePointer: false,
          onTap: notificationIconFunction,
          position: badges.BadgePosition.topEnd(top: 10, end: 10),
          showBadge: true,
          child: IconButton(
            onPressed: badgesIconFunction,
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 32,
            ),
          ),
        ),
        horizontalSpace(10),
        InkWell(
          onTap: profileFunction,
          child: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.profileImage),
            radius: 16.0,
          ),
        ),
        horizontalSpace(10),
      ],
    );
  }
}
