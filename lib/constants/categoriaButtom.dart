import 'package:flutter/material.dart';
import 'package:publicidade/models/categoria_model.dart';

class ClienteDropdownButton extends StatefulWidget {
  ClienteDropdownButton({Key key, this.callback}) : super(key: key);

  final Function(CategoriaModel) callback;

  @override
  _ClienteDropdownButtonState createState() => _ClienteDropdownButtonState();
}

class _ClienteDropdownButtonState extends State<ClienteDropdownButton> {
  CategoriaModel categoriaSelecionada;

  List<CategoriaModel> categorias = [
    CategoriaModel(id: 1, nome: "Academia"),
    CategoriaModel(id: 2, nome: "Salão"),
    CategoriaModel(id: 3, nome: "Barbearia"),
    CategoriaModel(id: 4, nome: "Lava Jato"),
    CategoriaModel(id: 5, nome: "Padaria"),
    CategoriaModel(id: 6, nome: "Oficina"),
    CategoriaModel(id: 7, nome: "Bar"),
    CategoriaModel(id: 8, nome: "Pizzaria"),
    CategoriaModel(id: 9, nome: "Farmacia"),
    CategoriaModel(id: 10, nome: "Hotel"),
    CategoriaModel(id: 11, nome: "Informatica"),
    CategoriaModel(id: 12, nome: "Restaurante"),
    CategoriaModel(id: 13, nome: "Lanchonete"),
    CategoriaModel(id: 14, nome: "Autonomo"),
    CategoriaModel(id: 15, nome: "Freelancer"),
    CategoriaModel(id: 16, nome: "Advocacia"),
    CategoriaModel(id: 17, nome: "Finanças"),
    CategoriaModel(id: 18, nome: "Contabilidade"),
    CategoriaModel(id: 19, nome: "Agro Negocio"),
    CategoriaModel(id: 20, nome: "Lojas"),
    CategoriaModel(id: 21, nome: "Supermercado"),
    CategoriaModel(id: 22, nome: "Cartorários/Notariais"),
    CategoriaModel(id: 23, nome: "Clinica"),
    CategoriaModel(id: 24, nome: "Auto Eletrica"),
    CategoriaModel(id: 25, nome: "Auto Peças"),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DropdownButton<int>(
          value: (categoriaSelecionada == null)
              ? categoriaSelecionada
              : categoriaSelecionada.id,
          hint: Text("Selecionar Ramo",
              style: TextStyle(color: Colors.purple[900])),
          icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.chevron_right, color: Colors.purple[900])),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.purple[900]),
          underline: Container(
            height: 2,
            color: Colors.purple[900],
          ),
          onChanged: (int idSelecionado) {
            setState(() {
              categoriaSelecionada = categorias
                  .firstWhere((cliente) => cliente.id == idSelecionado);
            });
            widget.callback(categoriaSelecionada);
          },
          items:
              categorias.map<DropdownMenuItem<int>>((CategoriaModel cliente) {
            return DropdownMenuItem<int>(
              value: cliente.id,
              child: Text(
                cliente.nome,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
