import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class Avaliacao extends StatefulWidget {
  @override
  _AvaliacaoState createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  double _ratingStar = 0;
  double _ratingStarLong = 0;
  double _ratingSmile = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Rating : $_ratingStar',
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(height: 8),
        RatingBar(
          onRatingChanged: (rating) => setState(() => _ratingStar = rating),
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
        ),
        SizedBox(height: 32),
        Text(
          'Read Only Rating : 3.5',
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(height: 8),
        RatingBar.readOnly(
          initialRating: 3.5,
          isHalfAllowed: true,
          halfFilledIcon: Icons.star_half,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
        ),
        SizedBox(height: 32),
        Text(
          'Rating : $_ratingStarLong',
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(height: 8),
        RatingBar(
          maxRating: 10,
          onRatingChanged: (rating) => setState(() => _ratingStarLong = rating),
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          halfFilledIcon: Icons.star_half,
          isHalfAllowed: true,
          filledColor: Colors.amber,
          size: 36,
        ),
        SizedBox(height: 32),
        Text(
          'Rating : $_ratingSmile',
          style: Theme.of(context).textTheme.subhead,
        ),
        SizedBox(height: 8),
        RatingBar(
          onRatingChanged: (rating) => setState(() => _ratingSmile = rating),
          filledIcon: Icons.sentiment_satisfied,
          emptyIcon: Icons.sentiment_dissatisfied,
          halfFilledIcon: Icons.sentiment_neutral,
          isHalfAllowed: true,
          filledColor: Colors.green,
          emptyColor: Colors.redAccent,
          halfFilledColor: Colors.amberAccent,
          size: 48,
        ),
      ],
    );
  }
}
