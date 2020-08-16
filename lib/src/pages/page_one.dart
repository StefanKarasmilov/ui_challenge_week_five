import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:reusable_widgets_h_v_scroll/src/models/dummy_content.dart';


class PageOne extends StatelessWidget {

  final List<DummyContent> items = List.generate(10, (index) {
    return DummyContent(
       'https://picsum.photos/500/375/?image=4$index',
       Random().nextDouble() * 5
      );
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          _Background(),
          _Front(items)
        ],
      )
   );
  }

}

class _Front extends StatelessWidget {
  
  final items;

  _Front(this.items);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _SearchInput(),
            _Swiper(items),
            Text('Most Wanted', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            _BottomContent(items)
          ],
        ),
      )
    );
  }
}

class _BottomContent extends StatelessWidget {
  
  final List<DummyContent> items;

  _BottomContent(this.items);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return _buildCarousel(context, index ~/ 2);
          } else {
            return Divider();
          }
        },
      ),
    );

  }

  Widget _buildCarousel(BuildContext context, int index) {

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: items.length,
        controller: PageController(viewportFraction: 0.5),
        itemBuilder: (context, index) {
          return _builCarouselItem(index);
        },
      ),
    );

  }

  Widget _builCarouselItem(int index) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 1
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _image(items[index].photo),
                Text(
                  'Something',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                _bottomContent(index),
              ],
            ),
          ),
        ),
      ), 
    );

  }

  Widget _image(String photo) {

    return Image(
      width: double.infinity,
      height: 150,
      fit: BoxFit.cover,
      image: NetworkImage(photo)??NetworkImage('https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg') 
    );

  }


  Widget _bottomContent(int index) {

    return Row(
      children: <Widget>[
        RatingBar(
          onRatingUpdate: null,
          itemCount: 5,
          itemSize: 20,
          unratedColor: Colors.grey[200],
          initialRating: items[index].rating,
          itemBuilder: (context, index) => Icon(Icons.star, color: Colors.blue,),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            items[index].rating.round().toString(),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );

  }

}

class _Swiper extends StatelessWidget {
  
  final List<DummyContent> items;

  _Swiper(this.items);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        curve: Curves.easeInOut,
        itemCount: items.length,
        layout: SwiperLayout.TINDER,
        itemWidth: double.infinity,
        itemHeight: size.height * 0.5,
        itemBuilder: (context, index) {
          
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: NetworkImage(items[index].photo) 
                ),
              ),
              _description(index),
            ],
          );

        }, 
      ),
    );

  }

  Widget _description(int index) {

    return Container(
      margin: EdgeInsets.all(40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Something',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          Expanded(child: Container()),
          RatingBar(
            onRatingUpdate: null,
            itemCount: 5,
            itemSize: 30,
            initialRating: items[index].rating,
            unratedColor: Colors.grey,
            itemBuilder: (context, index) => Icon(Icons.star, color: Colors.white,),
          )
        ],
      ),
    );

  }


}

class _SearchInput extends StatelessWidget {
 
  final color = Color.fromRGBO(202, 219, 228, 1);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: size.width * 0.8,
      child: _textField(),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(40),
      ),
    );

  }

  Widget _textField() {

    return TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        hintText: 'Search destination',
        hintStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.search, color: Colors.white,),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color)
        )
      ),
    );

  }

}

class _Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            Color.fromRGBO(167, 192, 205, 1),
            Color.fromRGBO(203, 218, 229, 1)
          ] 
        )
      ),
    );

  }
}