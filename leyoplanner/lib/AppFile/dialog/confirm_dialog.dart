import 'package:flutter/material.dart';
import 'package:leyoplanner/model/item.dart';

class ConfirmDialog extends StatelessWidget {
  final Item item;
  const ConfirmDialog({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(item.name),
      content: Text("Confirm to delete ${item.name}"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            "cancel",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            "delete",
            style: TextStyle(color: Colors.white),
          ),
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}
