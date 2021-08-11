import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:publicidade/controller/categoria_provider.dart';
import 'package:publicidade/views/builder_categorias.dart';

class ListFreelancer extends StatefulWidget {
  @override
  _ListFreelancerState createState() => _ListFreelancerState();
}

class _ListFreelancerState extends State<ListFreelancer> {
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
        itemBuilder: (ctx, i) => Text('vazio'),
      ),
    );
  }
}
