import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:interview_demo/modules/static_pages/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final List<IconData> bottomNavigationArray = [
    Icons.search,
    Icons.message,
    Icons.home_filled,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case 'home':
                return MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                );
              default:
                return MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                );
            }
          },
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 100,
          child: Container(
            height: 75,
            width: MediaQuery.sizeOf(context).width * 0.80,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 34, 33, 38),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                ...List.generate(
                  bottomNavigationArray.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        log('calling set state');
                        selectedIndex = index;
                        if (index == 2) {
                          _navigatorKey.currentState
                              ?.pushReplacementNamed('home');
                        }
                      }),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedIndex == index
                                ? const Color.fromARGB(255, 252, 167, 22)
                                : const Color.fromARGB(255, 27, 26, 31)),
                        duration: const Duration(milliseconds: 200),
                        height: selectedIndex == index ? 50 : 40,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: selectedIndex == index ? 30 : 20,
                          child: Icon(
                            size: selectedIndex == index ? 30 : 20,
                            bottomNavigationArray[index],
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ));
  }
}
