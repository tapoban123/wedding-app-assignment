import 'package:flutter/material.dart';
import 'package:wedding_app/data/event_data.dart';
import 'package:wedding_app/pages/bulk_food_delivery_page.dart';
import 'package:wedding_app/utils/custom_page_transition.dart';
import 'package:wedding_app/widgets/event_card.dart';

class EventsPage extends StatefulWidget {
  /// This page displays all the events utilising the [eventData] in Grid format.
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Events",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0.0,
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 15),
          itemCount: eventData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 14,
            mainAxisSpacing: 10,
            mainAxisExtent: 140,
          ),
          itemBuilder: (context, index) {
            final selectedEvent = eventData[index];

            return EventCard(
              imagePath: selectedEvent.imgPath,
              title: selectedEvent.title,
              onTap: () {
                customPageTransition(
                  context,
                  navigateToPage:
                      BulkFoodDeliveryPage(eventData: selectedEvent),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
