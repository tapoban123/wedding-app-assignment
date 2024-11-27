import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_app/pages/events_page.dart';
import 'package:wedding_app/providers/tab_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TabProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: "Wedding App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme: Theme.of(context).textTheme.apply(fontFamily: "Lexend"),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const EventsPage(),
      ),
    );
  }
}
