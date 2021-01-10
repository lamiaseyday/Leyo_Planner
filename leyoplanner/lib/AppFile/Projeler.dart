import 'package:flutter/material.dart';

class ProjelerPage extends StatefulWidget {
  ProjelerPage({Key key}) : super(key: key);

  @override
  _ProjelerPageState createState() => _ProjelerPageState();
}

class _ProjelerPageState extends State<ProjelerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projeler"),
      ),
    );
  }
}
