import 'package:flutter/material.dart';


class HorizontalScroll extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return _Card(index: index,);
        }, 
        separatorBuilder: (BuildContext context, int index) {
          return Container(margin: EdgeInsets.symmetric(horizontal: 5),);
        }, 
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      boxShadow: <BoxShadow> [
        BoxShadow(
          color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(2, 10),
        )
      ]
    ),
    child: Stack(
      children: <Widget>[
        _Image(index: index),
        _Text(),
      ],
    )
        );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        // margin: EdgeInsets.all(5),
        color: Colors.white.withOpacity(0.5),
        child: Text(
          'Something',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 200,
        width: 200,
        // margin: EdgeInsets.all(5),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage('https://picsum.photos/500/375/?image=3$index'),
        ),
      ),
    );
  }
}