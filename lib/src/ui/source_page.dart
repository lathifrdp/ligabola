import 'package:flutter/material.dart';
import 'package:liga_bola/src/helper/theme_colors.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: Text(
        "Aplikasi ini adalah aplikasi yang menampilkan liga dan klasemen olah raga sepak bola yang sedang berlangsung. Data ini didapatkan dari API public yang bernama Football Standings API. Berikut adalah link API tersebut. Link: https://github.com/azharimm/football-standings-api",
        style: TextStyle(color: grayColor70),
      ),
    ));
  }
}
