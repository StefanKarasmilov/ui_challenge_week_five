import 'package:flutter/material.dart';


class ContainerWithPhoto extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      // height: 300,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Title',
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Image(
            fit: BoxFit.cover,
            image: NetworkImage('https://picsum.photos/500/375/?image=90')
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {}, 
                icon: Icon(Icons.access_alarms),
                label: Text('Something'),
              ),
              Expanded(child: Container()),
              FlatButton.icon(
                onPressed: () {}, 
                icon: Icon(Icons.access_alarms),
                label: Text('Something'),
              ),
            ],
          )
        ],
      ),
    );

  }

}