import 'package:flutter/material.dart';

class ItemDialog extends StatefulWidget {
  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final _formKey = GlobalKey<FormState>();
  String _itemName;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("ekle"),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: TextFormField(
                  maxLength: 250,
                  autofocus: true,
                  onSaved: (value) => _itemName = value,
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
                child: Text("Ekle"),
                color: Colors.blue,
                onPressed: _saveForm,
              )
            ],
          ),
        ),
      ],
    );
  }

  void _saveForm() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      Navigator.pop(context, _itemName);
    }
  }
}