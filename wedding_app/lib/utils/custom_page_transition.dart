import 'package:flutter/material.dart';

void customPageTransition(
  /// Implements the Page Navigation Transition.
  BuildContext context, {
  required Widget navigateToPage,
}) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => navigateToPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.decelerate,
      ));

      return FadeTransition(
        opacity: tween,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  ));
}
