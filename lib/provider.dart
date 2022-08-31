import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskapp/product.dart';

class Productdetails with ChangeNotifier {
 final List <Product> _items=[  
    
  ];
  List<Product> get items{
 return [..._items];
  }
   addTx(String name,String disc,String path){
    final newTx= Product(id:DateTime.now().toString() , title: name, description: disc,imagedir: path);
    _items.add(newTx);
    print(_items.length);
    notifyListeners();
  }  

  editprod(Product editprod){
   
    if(_items.any((element) => element.id==editprod.id)){
      var prod=_items.singleWhere((element) => element.id==editprod.id);
      var int=_items.indexOf(prod);
      _items.removeAt(int);
      _items.insert(int, editprod);
      }
    notifyListeners();
  } 

  deleteprod(int i){
    _items.removeAt(i);
    notifyListeners();
  }
}