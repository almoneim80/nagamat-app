import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: const Text(
            "نغمات",
            style: TextStyle(
              fontFamily: "MaaAldahab",
              fontSize: 40.0,
              color: Colors.amber,
            ),
          ),
          backgroundColor: Colors.purple[200],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            mybutton("music-1.mp3", Colors.black, "سامسونج جلكسي"),
            mybutton("music-2.mp3", const Color.fromARGB(255, 189, 142, 1), "جلكسي نوت"),
            mybutton("music-3.mp3", Colors.blue, "نوكيا"),
            mybutton("music-4.mp3", const Color.fromARGB(255, 211, 100, 100), "ايفون 11"),
            mybutton("music-5.mp3", Colors.green, "واتساب"),
            mybutton("music-6.mp3", const Color.fromARGB(255, 30, 127, 192), "سامسونج S7"),
            mybutton("music-7.mp3", Colors.red, "ايفون 6"),
          ],
        ),
      ),
    );
  }

  Future<void> playSound(String url) async {
    final player = AudioPlayer();
    await player.play(AssetSource(url));
  }

  Expanded mybutton(String url, Color textColor, String musicName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: ElevatedButton(
          onPressed: () {
            playSound(url);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0)))),
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Row(
              children: [
                 Icon(
                  Icons.music_note,
                  color: textColor,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                Text(
                  musicName,
                  style: TextStyle(
                    fontFamily: "MaaAldahab",
                    fontSize: 30.0,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
