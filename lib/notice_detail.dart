import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  var img;
  var title;
  var date;
  var description;

  Detail(this.img, this.title, this.date, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Material(
          elevation: 4.0,
          borderRadius: new BorderRadius.circular(6.0),
          child: new ListView(
            children: <Widget>[
              _getImage(img),
              _getBody(title, date, description),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImage(img) {
    return Container(
      height: 200.0,
      child: new Image.network(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getBody(title, date, description) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getTitle(title),
          _getDate(date),
          _getDescription(description),
        ],
      ),
    );
  }

  _getTitle(tittle) {
    return new Text(tittle,
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }

  _getDate(date) {

    return new Container(
        margin: new EdgeInsets.only(top: 5.0),
    child: new Text(date,
    style: new TextStyle(
    fontSize: 10.0,
    color: Colors.grey
        ),
      ),
    );
  }
  _getDescription(description) {
    return new Container(
      margin: new  EdgeInsets.only(top: 20.0),
      child: new Text(description),
    );
  }

}