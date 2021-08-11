import 'dart:math';
import 'package:flutter/material.dart';
import 'package:publicidade/data/usuarios.dart';
import 'package:publicidade/models/usuario.dart';

class UsuarioProvider with ChangeNotifier {
  final Map<String, UsuarioDb> _items = {...Usuarios};

  List<UsuarioDb> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  UsuarioDb byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(UsuarioDb usuario) {
    if (usuario == null) {
      return;
    }

    if (usuario.id != null &&
        usuario.id.trim().isNotEmpty &&
        _items.containsKey(
          usuario.id,
        )) {
      _items.update(
          usuario.id,
          (_) => UsuarioDb(
                id: usuario.id,
                name: usuario.name,
                telefone: usuario.telefone,
                instagram: usuario.instagram,
                mail: usuario.mail,
                facebook: usuario.facebook,
                whats: usuario.whats,
                urlFoto: usuario.urlFoto,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => UsuarioDb(
                id: id,
                name: usuario.name,
                telefone: usuario.telefone,
                instagram: usuario.instagram,
                mail: usuario.mail,
                facebook: usuario.facebook,
                whats: usuario.whats,
                urlFoto: usuario.urlFoto,
              ));
    }
    notifyListeners();
  }

  void remove(UsuarioDb usuario) {
    if (usuario != null && usuario.id != null) {
      _items.remove(usuario.id);
      notifyListeners();
    }
  }
}
