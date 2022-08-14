import 'package:flutter/material.dart';

class LigaPage extends StatefulWidget {
  const LigaPage({Key? key}) : super(key: key);

  @override
  State<LigaPage> createState() => _LigaPageState();
}

class _LigaPageState extends State<LigaPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Liga Page"),
    ));
  }
}
