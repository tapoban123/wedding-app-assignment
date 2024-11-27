import 'package:flutter/cupertino.dart';
import 'package:wedding_app/themes/custom_colors.dart';

class SnacksTabContent extends StatelessWidget {
  /// Content of the SnackBar Tab has been displayed here.
  /// 
  /// Used on [BulkFoodDeliveryPage]
  const SnacksTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CupertinoIcons.xmark_circle,
              size: 100,
              color: CustomColors.greyColor,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "No Platter Available",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
