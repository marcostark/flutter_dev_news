import 'package:dev_news/notice_class.dart';
import 'package:flutter/material.dart';
import '../news_api.dart';

class Home extends StatefulWidget{

  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;

}

class _NoticeListPageState extends State<Home>{

  List _categorys = new List();
  var _category_selected = 0;

  PageController _tabController;
  var _title_app = null;

  List _news = new List();
  var repository = new NewsApi();
  int _tab = 0;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            _getListcategory(),
            new Expanded(child: _getListViewWidget(), )
          ],
        )
      ),
//
//        //Content of tabs
//        body: new PageView(
//          controller: _tabController,
//          onPageChanged: onTabChanged,
//          children: <Widget>[
//            //_getListcategory(),
//            new Categories(),
//            new Info()
//          ],
//        ),
//
//        bottomNavigationBar: _getBottomNavigationBar()
    );
  }

  @override
  void initState() {
    setCategorys();
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

//            item['backdrop_path'],
//            item['tittle'],
//            item['release_date'],
//            item['overview']
        );
        _news.add(notice);

      });
    });
  }

  Widget _getListcategory() {

    ListView listCategory = new ListView.builder(
        itemCount: _categorys.length,
        scrollDirection: Axis.horizontal, // Listanfo categorias na horizontal
        itemBuilder: (context, index){
          return _createCategoryItem(index);
        }
    );
    return new Container(
      height: 55.0,
      child: listCategory,
    );
  }

  Widget _createCategoryItem(index) {

    return new GestureDetector(
      onTap: () {
        onTapCategory(index);
      },
      child: new Center(
        child: new Container(
          margin: new EdgeInsets.only(left:10.0),
          child: new Material(
            //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            elevation: 2.0,
            borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
            clipBehavior: Clip.antiAlias,
            child: new Container(
              padding: new EdgeInsets.only(left: 12.0, top: 7.0, bottom: 7.0, right: 12.0),
              color: _category_selected == index ? Colors.blue[800]:Colors.blue[500],
              child: new Text(_categorys[index],
                style: new TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapCategory(index) {
    setState(() {
      _category_selected = index;
    });
  }

  void setCategorys() {
    _categorys.add("Programação");
    _categorys.add("IA");
    _categorys.add("Tecnologia");
    _categorys.add("Educação");
    _categorys.add("Mobile");
  }
}

