import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'circle_icon_button.dart';

// The home app bar: the Facebook wordmark, three round buttons,
// and the primary tab bar sitting in AppBar.bottom.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  static const List<IconData> tabIcons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront,
    Icons.people_outline,
    Icons.notifications_none,
    Icons.menu,
  ];

  // the app bar is taller than usual because of the tab bar under it
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      title: const Text(
        'Facebook',
        style: TextStyle(
          color: AppColors.blue,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [
        CircleIconButton(icon: Icons.add),
        CircleIconButton(icon: Icons.search),
        CircleIconButton(icon: Icons.messenger_outline),
        SizedBox(width: 8),
      ],
      // AppBar.bottom holds the primary tab bar, as the brief describes
      bottom: TabBar(
        indicatorColor: AppColors.blue,
        indicatorWeight: 3,
        labelColor: AppColors.blue,
        unselectedLabelColor: AppColors.gray,
        // built from the list instead of writing six Tab widgets by hand
        tabs: tabIcons.map((icon) => Tab(icon: Icon(icon))).toList(),
      ),
    );
  }
}
