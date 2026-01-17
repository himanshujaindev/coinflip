import 'package:flutter/material.dart';
import '../presentation/main_coin_flip_screen/main_coin_flip_screen.dart';

class AppRoutes {
  // TODO: Add your routes here
  static const String initial = '/';
  static const String mainCoinFlip = '/main-coin-flip-screen';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const MainCoinFlipScreen(),
    mainCoinFlip: (context) => const MainCoinFlipScreen(),
    // TODO: Add your other routes here
  };
}
