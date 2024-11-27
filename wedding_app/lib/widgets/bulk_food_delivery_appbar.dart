import 'package:flutter/material.dart';
import 'package:wedding_app/pages/bulk_food_delivery_page.dart';

class BulkFoodDeliveryAppbar extends StatelessWidget {
  /// This [Widget] is displayed on top on the [BulkFoodDeliveryPage].
  final String title;
  const BulkFoodDeliveryAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: IconButton(
                enableFeedback: false,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
