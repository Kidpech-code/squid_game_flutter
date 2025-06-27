import 'package:flutter/material.dart';
import '../game/game_controller.dart';
import '../widgets/player_widget.dart';
import '../widgets/doll_widget.dart';
import '../widgets/finish_line_widget.dart';
import '../widgets/game_ui.dart';
import '../widgets/move_button.dart';
import '../screens/start_screen.dart';
import '../screens/game_over_screen.dart';
import '../screens/win_screen.dart';

class RedLightGreenLightGame extends StatefulWidget {
  const RedLightGreenLightGame({super.key});

  @override
  State<RedLightGreenLightGame> createState() => _RedLightGreenLightGameState();
}

class _RedLightGreenLightGameState extends State<RedLightGreenLightGame>
    with TickerProviderStateMixin {
  late GameController _gameController;

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
    _gameController.initialize(this);
  }

  @override
  void dispose() {
    _gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gameController,
        builder: (context, child) {
          return Stack(
            children: [
              // Background
              _buildBackground(),

              // Game elements (only visible when game is started)
              if (_gameController.gameState.isGameStarted) ...[
                // Game UI (guards, light indicator, stats)
                GameUI(gameState: _gameController.gameState),

                // Doll
                DollWidget(
                  gameState: _gameController.gameState,
                  dollRotationController:
                      _gameController.dollRotationController,
                ),

                // Finish line
                const FinishLineWidget(),

                // Player
                PlayerWidget(gameState: _gameController.gameState),

                // Move button
                MoveButton(
                  gameState: _gameController.gameState,
                  onMove: _gameController.movePlayer,
                ),
              ],

              // Screens based on game state
              if (!_gameController.gameState.isGameStarted)
                StartScreen(onStartGame: _gameController.startGame),

              if (_gameController.gameState.isPlayerDead)
                GameOverScreen(onTryAgain: _gameController.resetGame),

              if (_gameController.gameState.hasWon)
                WinScreen(
                  onPlayAgain: _gameController.resetGame,
                  confettiController: _gameController.confettiController,
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sprites/background_sprite.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
