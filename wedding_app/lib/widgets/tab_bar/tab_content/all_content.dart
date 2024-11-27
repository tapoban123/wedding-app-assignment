import 'package:flutter/material.dart';
import 'package:wedding_app/widgets/catering_menu_card.dart';

class AllTabContent extends StatelessWidget {
  const AllTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            CateringMenuCard(),
            CateringMenuCard(),
          ],
        ),
      ),
    );
  }
}
