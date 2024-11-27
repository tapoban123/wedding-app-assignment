import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_app/providers/tab_provider.dart';
import 'package:wedding_app/widgets/tab_bar/widgets/tab_bar_button.dart';

class CustomTabBar extends StatelessWidget {
  /// Allows the user to change tab of meals.
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 0.2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Consumer<TabProvider>(
        builder: (context, tabProvider, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabBarButton(
              buttonText: "ALL (8)",
              tabNum: 0,
              onTap: () {
                tabProvider.changeTab(0);
              },
            ),
            TabBarButton(
              buttonText: "Breakfast",
              tabNum: 1,
              onTap: () {
                tabProvider.changeTab(1);
              },
            ),
            TabBarButton(
              buttonText: "Lunch & Dinner",
              tabNum: 2,
              onTap: () {
                tabProvider.changeTab(2);
              },
            ),
            TabBarButton(
              buttonText: "Snacks",
              tabNum: 3,
              onTap: () {
                tabProvider.changeTab(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
