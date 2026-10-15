import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../widgets/empty_tab.dart';
import '../widgets/feed_tab.dart';
import '../widgets/home_app_bar.dart';

// This file now holds one class and nothing else: the screen wires the
// app bar to the tab views, every piece of UI lives in its own widget.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController wires the TabBar to the TabBarView, so no
    // TabController has to be created and disposed by hand
    return DefaultTabController(
      length: HomeAppBar.tabIcons.length,
      child: const Scaffold(
        backgroundColor: AppColors.white,
        appBar: HomeAppBar(),
        body: TabBarView(
          children: [
            FeedTab(),
            EmptyTab(label: 'Watch'),
            EmptyTab(label: 'Marketplace'),
            EmptyTab(label: 'Groups'),
            EmptyTab(label: 'Notifications'),
            EmptyTab(label: 'Menu'),
          ],
        ),
      ),
    );
  }
}
