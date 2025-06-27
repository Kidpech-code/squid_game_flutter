import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'game/red_light_green_light_game.dart';

class SquidGameApp extends StatefulWidget {
  const SquidGameApp({super.key});

  @override
  State<SquidGameApp> createState() => _SquidGameAppState();
}

class _SquidGameAppState extends State<SquidGameApp> {
  bool _showSplash = true;

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showSplash
        ? SplashScreen(onSplashComplete: _onSplashComplete)
        : const RedLightGreenLightGame();
  }
}
