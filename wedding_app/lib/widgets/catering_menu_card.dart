import 'package:flutter/material.dart';
import 'package:wedding_app/themes/custom_colors.dart';
import 'package:wedding_app/utils/image_paths.dart';
import 'package:wedding_app/widgets/tab_bar/tab_content/all_content.dart';

class CateringMenuCard extends StatefulWidget {
  /// This [Widget] implements Menu Card.
  /// It is implemented on [AllTabContent].
  const CateringMenuCard({super.key});

  @override
  State<CateringMenuCard> createState() => _CateringMenuCardState();
}

class _CateringMenuCardState extends State<CateringMenuCard> {
  final List<String> categoresAndItems = [
    "3 Live Counter",
    "4 Main",
    "3 Desserts",
    "3 Desserts",
    "3 Desserts",
    "3 Desserts",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      child: Image.asset(
                        ImagePaths.foodImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    child: Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        color: CustomColors.violetColor,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff8d56c5),
                            CustomColors.violetColor,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Popular",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "South Breakfast",
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColors.darkTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Divider(
                    color: CustomColors.dividerColor,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: CustomColors.greyColor,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Min 10 - Max 120",
                            style: TextStyle(color: CustomColors.greyColor),
                          )
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Starts at ",
                          style: TextStyle(
                            fontSize: 18,
                            color: CustomColors.deepGreyColor,
                          ),
                          children: [
                            TextSpan(
                              text: "₹299",
                              style:
                                  TextStyle(color: CustomColors.darkTextColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: CustomColors.dividerColor,
                  ),
                  const Text(
                    "12 Categories and 40 items",
                    style: TextStyle(
                      fontSize: 14,
                      color: CustomColors.violetColor,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            categoresAndItems.length,
                            (index) {
                              return Text(
                                categoresAndItems[index],
                                style: const TextStyle(
                                  color: CustomColors.greyTextColor,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
