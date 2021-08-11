import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:publicidade/data/Categorias.dart';
import 'package:publicidade/data/dbFirestore.dart';
import 'package:publicidade/models/categoria.dart';
import 'package:publicidade/models/categoria_model.dart';

class CategoriaProvider with ChangeNotifier {
  Map<String, CategoriaDb> _items = {...Categorias};

  List<CategoriaDb> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  CategoriaDb byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> put(CategoriaDb user) async {
    if (user == null) {
      return;
    }

    void remove(CategoriaDb user) {
      if (user != null && user.id != null) {
        _items.remove(user.id);
        notifyListeners();
      }
    }
  }
}
