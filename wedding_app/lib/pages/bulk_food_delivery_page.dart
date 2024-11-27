import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_app/models/event_data_model.dart';
import 'package:wedding_app/providers/tab_provider.dart';
import 'package:wedding_app/themes/custom_colors.dart';
import 'package:wedding_app/utils/image_paths.dart';
import 'package:wedding_app/widgets/bulk_food_delivery_appbar.dart';
import 'package:wedding_app/widgets/platter_icon.dart';
import 'package:wedding_app/widgets/tab_bar/custom_tab_bar.dart';
import 'package:wedding_app/widgets/section_buttons_bar.dart';
import 'package:wedding_app/widgets/tab_bar/tab_content/all_content.dart';
import 'package:wedding_app/widgets/tab_bar/tab_content/snacks_content.dart';
import 'package:wedding_app/pages/events_page.dart';

class BulkFoodDeliveryPage extends StatelessWidget {
  /// This page displays the Meals the services offered by the company.
  /// This page is displayed when the user clicks on any event on [EventsPage]
  final EventDataModel eventData;

  const BulkFoodDeliveryPage({
    super.key,
    required this.eventData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        PlatterIcon(),
                        Positioned(
                          left: 14,
                          child: PlatterIcon(),
                        ),
                        Positioned(
                          left: 28,
                          child: PlatterIcon(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "3 Platters",
                    style: TextStyle(fontSize: 15.33),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.violetColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      "View Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 8,
                      child: Image.asset(
                        ImagePaths.arrowUpImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final parentWidth = constraints.maxWidth;
                  final parentHeight = constraints.maxHeight;

                  final topPadding = MediaQuery.of(context).padding.top;

                  return Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Image.asset(
                          eventData.imgPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 50,
                              spreadRadius: 28,
                              offset: Offset(0, 18),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: topPadding,
                        child: BulkFoodDeliveryAppbar(
                          title: eventData.title,
                        ),
                      ),
                      Positioned(
                        top: parentHeight * 0.75,
                        child: SizedBox(
                          width: parentWidth,
                          child: const FractionallySizedBox(
                            widthFactor: 0.96,
                            child: SectionButtonsBar(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const CustomTabBar(),
            Expanded(
              child: Consumer<TabProvider>(
                builder: (context, tabProvider, child) {
                  if (tabProvider.currentTab == 0) {
                    return const AllTabContent();
                  } else if (tabProvider.currentTab == 3) {
                    return const SnacksTabContent();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
