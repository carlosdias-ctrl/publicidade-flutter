import 'package:flutter/material.dart';

// AVALIAÇÃO DOS USUARIOS PARA SERVIÇOS PRESTADOS PELAS EMPRESAS CADASTRADAS

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _stars = 0;

  _buildStar(int starCount) {
    return InkWell(
      child: Icon(
        Icons.star,
        // size: 30.0,
        color: _stars >= starCount ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          _stars = starCount;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Rate this post'),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildStar(1),
          _buildStar(2),
          _buildStar(3),
          _buildStar(4),
          _buildStar(5),
          _buildStar(6),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: Navigator.of(context).pop,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_stars);
          },
        )
      ],
    );
  }
}
