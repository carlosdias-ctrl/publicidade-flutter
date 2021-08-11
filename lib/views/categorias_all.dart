import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:publicidade/controller/categoria_provider.dart';
import 'package:publicidade/views/builder_categorias.dart';

class ListCategorias extends StatefulWidget {
  @override
  _ListCategoriasState createState() => _ListCategoriasState();
}

class _ListCategoriasState extends State<ListCategorias> {
  @override
  Widget build(BuildContext context) {
    final CategoriaProvider categoria = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepPurple,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 25),
            icon: Icon(
              Icons.search,
              color: Colors.deepPurple,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350,
          childAspectRatio: 2 / 2.2,
          crossAxisSpacing: 17,
          //mainAxisSpacing: 5.0,
        ),
        itemCount: categoria.count,
        itemBuilder: (ctx, i) => BuildCategorias(
          categoria.byIndex(i),
        ),
      ),
    );
  }
}
