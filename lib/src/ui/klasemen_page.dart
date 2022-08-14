import 'package:flutter/material.dart';

class KlasemenPage extends StatefulWidget {
  const KlasemenPage({Key? key}) : super(key: key);

  @override
  State<KlasemenPage> createState() => _KlasemenPageState();
}

class _KlasemenPageState extends State<KlasemenPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Klasemen Page"),
    ));
  }
}
