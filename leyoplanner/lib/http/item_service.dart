import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leyoplanner/model/item.dart';

class ItemService {
  final String _serviceUrl = 'https://kesali-shopping.herokuapp.com/item/';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(_serviceUrl);

    if (response.statusCode == 200) {
      Iterable items = json.decode(response.body);

      return items.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception("Something went wrong");
    }
  }

  Future<Item> addItem(String itemJson) async {
    final response = await http.post(_serviceUrl,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: itemJson);

    if (response.statusCode == 201) {
      Map item = json.decode(response.body);
      return Item.fromJson(item);
    } else {
      throw Exception("something went wrong");
    }
  }

  Future<Item> editItem(Item item) async {
    final response = await http.patch('$_serviceUrl${item.id}',
        headers: {'content-type': 'application/json'}, body: item.toJson());

    if (response.statusCode == 200) {
      Map item = json.decode(response.body);
      return Item.fromJson(item);
    } else {
      throw Exception("something went wrong");
    }
  }
}
