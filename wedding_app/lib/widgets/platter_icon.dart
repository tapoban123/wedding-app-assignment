import 'package:flutter/material.dart';
import 'package:wedding_app/utils/image_paths.dart';

class PlatterIcon extends StatelessWidget {
  /// Custom Platter Icon displayed on the bottom of [BulkFoodDeliveryPage].
  const PlatterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2.5,
        ),
        image: const DecorationImage(
          image: AssetImage(ImagePaths.samosasImg),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
