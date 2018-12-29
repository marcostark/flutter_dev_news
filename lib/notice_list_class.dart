import 'package:dev_news/notice_class.dart';
import 'package:flutter/material.dart';
import 'news_api.dart';

class NoticeList extends StatefulWidget{

  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;

}

class _NoticeListPageState extends State<NoticeList>{

  List _news = new List();
  var repository = new NewsApi();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Dev News"),
          centerTitle: true,
        ),
      body: new Container(
        child: _getListViewWidget(),
      ),
        bottomNavigationBar: _getBottomNavigationBar()
    );
  }


  //BottomNavigationBar

  Widget _getBottomNavigationBar(){
    return new BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        //type: BottomNavigationBarType.shifting, // Colorindo
    items: [
      new BottomNavigationBarItem(
          icon: Icon(Icons.code),
          title: Text('Inicio'),
          //backgroundColor: Colors.green
          ),

      new BottomNavigationBarItem(
        icon: Icon(Icons.category),
        title: Text('Categorias'),
        //backgroundColor: Colors.green
      ),

      new BottomNavigationBarItem(
          icon: Icon(Icons.info),
          title: Text('Sobre'),
          //backgroundColor: Colors.green
          )
    ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    loadNews();
  }

  Widget _getListViewWidget(){

    var list = new ListView.builder(
        itemCount: _news.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index){
          return _news[index];
        }
    );

    return list;
  }

  loadNews() async{

    List resultNews = await repository.loadNews();

    setState(() {

      resultNews.forEach((item) {

        var notice = new Notice(
            item['url_img'],
            item['tittle'],
            item['date'],
            item['description']
        );
        _news.add(notice);

      });
    });
  }

}