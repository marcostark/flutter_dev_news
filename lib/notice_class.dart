import 'package:flutter/material.dart';

class Notice extends StatelessWidget {

  var _imagem;
  var _titulo;
  var _data;
  var _descricao;

  Notice(this._imagem, this._titulo, this._data, this._descricao);

  BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    this._buildContext = context;

    // Criando a view
    return new Container(
      margin: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
          top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: _getListTile(),
      ),
    );
  }

  Widget _getListTile(){

    return new Container(
      height: 95.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new FadeInImage.assetNetwork(placeholder: '', image: _imagem,fit: BoxFit.cover,width: 95.0, height: 95.0,),
          _getColumnText(_titulo, _data, _descricao),
        ],
      ),
    );
  }

  Widget _getColumnText(titulo, data, descricao) {

    return Expanded(
      child: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getTitleWidget(_titulo),
            _getDateWidget(_data),
            _getDescriptionWidget(_descricao),
          ],
        ),
      ),
    );
  }

  Widget _getTitleWidget(String name) {
    return new Text(
      name,
      maxLines: 1,
      style: new TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _getDescriptionWidget(String description) {
    return new Container(
      margin: new EdgeInsets.only(top: 0.5),
      child: new Text(description, maxLines: 2,),
    );
  }

  Widget _getDateWidget(String date) {
    return new Text(
      date,
      style: new TextStyle(color: Colors.grey, fontSize: 10.0),
    );
  }

}