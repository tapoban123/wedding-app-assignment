import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_app/providers/tab_provider.dart';
import 'package:wedding_app/themes/custom_colors.dart';

class TabBarButton extends StatelessWidget {
  final String buttonText;
  final int tabNum;
  final VoidCallback onTap;

  const TabBarButton({
    super.key,
    required this.buttonText,
    required this.tabNum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Consumer<TabProvider>(
        builder: (context, tabProvider, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: 14,
                color: tabProvider.currentTab == tabNum
                    ? CustomColors.pinkColor
                    : CustomColors.darkTextColor,
              ),
              duration: const Duration(milliseconds: 300),
              child: Text(buttonText),
            ),
            const SizedBox(
              height: 2,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: 60,
              decoration: BoxDecoration(
                color: tabProvider.currentTab == tabNum
                    ? CustomColors.pinkColor
                    : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
