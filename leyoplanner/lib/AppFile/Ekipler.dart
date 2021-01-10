import 'package:flutter/material.dart';

class EkiplerPage extends StatefulWidget {
  EkiplerPage({Key key}) : super(key: key);

  @override
  _EkiplerPageState createState() => _EkiplerPageState();
}

class _EkiplerPageState extends State<EkiplerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ekipler"),
      ),
    );
  }
}
