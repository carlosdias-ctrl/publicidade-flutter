import 'package:flutter/material.dart';

class UsuarioDb {
  final String id;
  final String name;
  final String telefone;
  final String instagram;
  final String mail;
  final String facebook;
  final String whats;
  final String urlFoto;

  const UsuarioDb({
    @required this.id,
    @required this.name,
    @required this.telefone,
    @required this.instagram,
    @required this.mail,
    @required this.facebook,
    @required this.whats,
    @required this.urlFoto,
  });
}
