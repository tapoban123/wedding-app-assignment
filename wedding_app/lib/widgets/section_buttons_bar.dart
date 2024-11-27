import 'package:flutter/material.dart';
import 'package:wedding_app/themes/custom_colors.dart';

enum Section {
  /// This [Enum] helps us in changing the text of each button.
  bulkFoodDelivery(name: "Bulk Food Delivery"),
  cateringService(name: "Catering Service");

  final String name;

  const Section({
    required this.name,
  });
}

class SectionButtonsBar extends StatefulWidget {
  /// This [Widget] is used on [BulkFoodDeliveryPage].
  /// 
  /// Allows the user to switch from BulkFoodDelivery to CateringService.
  const SectionButtonsBar({super.key});

  @override
  State<SectionButtonsBar> createState() => _SectionButtonsBarState();
}

class _SectionButtonsBarState extends State<SectionButtonsBar>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> cateringServiceSelected = ValueNotifier(false);
  late AnimationController _controller;
  late Animation<double> _animation;

  String buttonText1 = Section.bulkFoodDelivery.name;
  String buttonText2 = Section.cateringService.name;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final parentWidth = constraints.maxWidth;
          final parentHeight = constraints.maxHeight;

          return ValueListenableBuilder(
            valueListenable: cateringServiceSelected,
            builder: (context, cateringService, child) => Stack(
              children: [
                AnimatedPositionedDirectional(
                  duration: const Duration(milliseconds: 300),
                  start: cateringService ? parentWidth * 0.52 : 0,
                  child: Container(
                    height: 56,
                    width: parentWidth * 0.48,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                    ),
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: parentWidth * 0.024),
                    child: FadeTransition(
                      opacity: _animation,
                      child: Text(
                        buttonText1,
                        style: TextStyle(
                          color: CustomColors.violetColor,
                          fontSize: parentWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositionedDirectional(
                  duration: const Duration(milliseconds: 300),
                  end: cateringService ? parentWidth * 0.52 : 0,
                  child: GestureDetector(
                    onTap: () async {
                      cateringServiceSelected.value =
                          !cateringServiceSelected.value;

                      await _controller.forward();

                      String temp;

                      if (_controller.isCompleted) {
                        temp = buttonText1;
                        buttonText1 = buttonText2;
                        buttonText2 = temp;

                        setState(() {});

                        _controller.reverse();
                      }
                    },
                    child: Container(
                      height: 40,
                      width: parentWidth * 0.48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      alignment: Alignment.center,
                      child: FadeTransition(
                        opacity: _animation,
                        child: Text(
                          buttonText2,
                          style: TextStyle(
                            color: CustomColors.deepGreyColor,
                            fontSize: parentWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// class SectionButtonsBar extends StatefulWidget {
//   const SectionButtonsBar({super.key});

//   @override
//   State<SectionButtonsBar> createState() => _SectionButtonsBarState();
// }

// class _SectionButtonsBarState extends State<SectionButtonsBar> {
//   ValueNotifier<bool> cateringServiceSelected = ValueNotifier(false);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 100,
//       child: ValueListenableBuilder(
//         valueListenable: cateringServiceSelected,
//         builder: (context, cateringService, child) => LayoutBuilder(
//           builder: (context, constraints) {
//             final parentWidth = constraints.maxWidth;
//             final parentHeight = constraints.maxHeight;

//             return Stack(
//               alignment: Alignment.topLeft,
//               children: [
//                 AnimatedPositionedDirectional(
//                   duration: const Duration(milliseconds: 200),
//                   curve: Curves.easeIn,
//                   start: cateringService ? parentWidth * 0.52 : 0,
//                   child: Container(
//                     width: parentWidth * 0.48,
//                     height: 56,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(14),
//                         topRight: Radius.circular(14),
//                       ),
//                     ),
//                     alignment: Alignment.topCenter,
//                     padding: const EdgeInsets.only(top: 14),
//                   ),
//                 ),
//                 AnimatedPositionedDirectional(
//                   duration: const Duration(milliseconds: 200),
//                   curve: Curves.easeInExpo,
//                   end: cateringService ? parentWidth * 0.52 : 0,
//                   child: GestureDetector(
//                     onTap: () {
//                       cateringServiceSelected.value =
//                           !cateringServiceSelected.value;
//                     },
//                     child: Container(
//                       width: parentWidth * 0.48,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.85),
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: parentWidth * 0.05,
//                   top: 10,
//                   child: GestureDetector(
//                     onTap: () {
//                       if (cateringService) {
//                         cateringServiceSelected.value =
//                             !cateringServiceSelected.value;
//                       }
//                     },
//                     child: const Text("Bulk Food Delivery"),
//                   ),
//                 ),
//                 Positioned(
//                   right: parentWidth * 0.07,
//                   top: 10,
//                   child: GestureDetector(
//                     onTap: () {
//                       if (cateringService == false) {
//                         cateringServiceSelected.value =
//                             !cateringServiceSelected.value;
//                       }
//                     },
//                     child: const Text("Catering Service"),
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
