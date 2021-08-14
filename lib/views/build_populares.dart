import 'package:flutter/material.dart';
import 'package:publicidade/models/categoria.dart';

//CONSTRUÇÃO DA LISTA DE POPULARES

class BuildPopulares extends StatefulWidget {
  @override
  _BuildPopularesState createState() => _BuildPopularesState();
}

class _BuildPopularesState extends State<BuildPopulares> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'populares');
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
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(''),
                  fit: BoxFit.fill,
                ),
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
                  'Null',
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
