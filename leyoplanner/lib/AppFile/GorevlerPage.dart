import 'package:flutter/material.dart';
import 'package:leyoplanner/AppFile/dialog/confirm_dialog.dart';
import 'package:leyoplanner/http/item_service.dart';
import 'package:leyoplanner/model/item.dart';

class GorevlerPage extends StatefulWidget {
  @override
  _ShoppingListItemPageState createState() => _ShoppingListItemPageState();
}

class _ShoppingListItemPageState extends State<GorevlerPage> {
  ItemService _itemService;

  @override
  void initState() {
    _itemService = ItemService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _itemService.fetchItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Item item = snapshot.data[index];

              return GestureDetector(
                onLongPress: () async {
                  bool result = await showDialog(
                      context: context,
                      builder: (BuildContext context) => ConfirmDialog(
                            item: item,
                          ));

                  item.isArchived = result;
                  await _itemService.editItem(item);
                  setState(() {});
                },
                child: CheckboxListTile(
                  title: Text(item.name),
                  onChanged: (bool value) async {
                    item.isCompleted = !item.isCompleted;
                    await _itemService.editItem(item);
                    setState(() {});
                  },
                  value: item.isCompleted,
                ),
              );
            },
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
