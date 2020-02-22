import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';




class Stores{
  final String name;
  final String ratings;
  final String image;
  final List<Items> items;

  Stores({@required this.name,@required this.ratings,@required this.image,this.items, });

  factory Stores.fromJson(Map<String, dynamic> json) {
    return Stores(
        name: json['name'] as String,
        ratings: json['ratings'] as String,
        image: json['image'] as String,
        items: List.from(json['items']).map((items) => Items.fromJson(items)).toList()
    );
  }

  Map toStores() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['ratings'] = ratings;
    map['image'] = image;
    map['items'] = [];
    return map;
  }
}

class Items {
  final String item_name;
  final String item_image;
  final String item_price;

  Items({@required this.item_name,@required this.item_image,@required this.item_price,});

  factory Items.fromJson(Map<String, dynamic> json){
    return Items(
        item_name: json['item_name'],
        item_image: json['item_image'],
        item_price: json['item_price']
    );
  }
}

