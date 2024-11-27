import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  /// This card is implemented on the [EventsPage] and allows the user to navigate between different evetns of their choice.
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 145,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final parentWidth = constraints.maxWidth;
            final parentHeight = constraints.maxHeight;

            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 60,
                  width: parentWidth,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: -5.0,
                        blurRadius: 20.0,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: parentWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: parentWidth * 0.14,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
