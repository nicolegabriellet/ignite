import 'package:flutter/material.dart';
import 'helpers/direction.dart';
import 'helpers/joypad.dart';
import 'package:flame/game.dart';
import 'contri_side_game.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  ContriSideGame game = ContriSideGame();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LogInPage();
                }));
              },
              child: const Text('Next'),
            ),
          ],
        ));
  }

  void onJoypadDirectionChanged(Direction direction) {
    game.onJoypadDirectionChanged(direction);
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  LogInState createState() => LogInState();
}


class LogInState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ), 
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: const Center(
        child: Text(
          "LEADERBOARD",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          ),
        ),
        // body: Stack(
        //   children: [
        //     Align(
        //       alignment: Alignment.bottomRight,
        //       child: Padding(
        //         padding: const EdgeInsets.all(32.0),
        //       ),
        //     ),
        //     TextButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return const MainGamePage();
        //         }));
        //       },
        //       child: const Text('Back'),
        //     ),
        //   ],
        // )
        ));
        
  }
}
