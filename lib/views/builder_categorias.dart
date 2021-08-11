import 'package:flutter/material.dart';
import 'package:publicidade/controller/categoria_provider.dart';
import 'package:publicidade/models/categoria.dart';

class BuildCategorias extends StatefulWidget {
  final CategoriaDb categoria;
  const BuildCategorias(this.categoria);
  @override
  _BuildCategoriasState createState() => _BuildCategoriasState();
}

class _BuildCategoriasState extends State<BuildCategorias> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'categorias');
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 2.3,
          right: 10.0,
          bottom: 1.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.categoria.foto),
                  fit: BoxFit.fill,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150.0,
              width: 175.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 30,
                width: 135,
                child: Text(
                  widget.categoria.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple[400],
                    fontFamily: 'Commissioner',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
