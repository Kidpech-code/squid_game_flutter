import 'package:flutter/material.dart';
import '../constants/text_styles.dart';

class GameOverScreen extends StatelessWidget {
  final VoidCallback onTryAgain;

  const GameOverScreen({super.key, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ELIMINATED!', style: GameTextStyles.eliminated),
            const SizedBox(height: 20),
            const Text(
              'YOU MOVED DURING RED LIGHT!',
              style: GameTextStyles.subtitle,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: onTryAgain,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text('TRY AGAIN', style: GameTextStyles.button),
            ),
          ],
        ),
      ),
    );
  }
}
