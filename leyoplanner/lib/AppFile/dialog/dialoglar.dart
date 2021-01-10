import 'package:flutter/material.dart';

class Dialoglar extends StatefulWidget {
  @override
  _DialoglarState createState() => _DialoglarState();
}

class _DialoglarState extends State<Dialoglar> {
  final _formKey = GlobalKey<FormState>();

  String _itemName; //text e yazılanı kaydetmek için.

  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Görev Ekle."),
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey, //bu key ile formu validate edebiliriz.
                child: TextFormField(
                  maxLength: 250,
                  onSaved: (value) => _itemName = value,
                  autofocus: true, //text direk yazılabilir modda olur.
                  validator: (value) {
                    if (value.isEmpty) {
                      return "validation error";
                    }
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                onPressed: _savedForm,
                child: Text("Görevi Ekle"),
                color: Theme.of(context).primaryColorLight,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _savedForm() {
    _formKey.currentState.save();
    //forma yazılan değeri itemName e eşitlemiş olduk..

    //sonra validate işlemi var
    if (_formKey.currentState.validate()) {
      Navigator.pop(context, _itemName); //dialog kapanır.
      //navigator pop context ve result parametresi alır.
    }
  }
}
