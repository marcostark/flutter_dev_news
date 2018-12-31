import 'package:dev_news/tabs/categories.dart';
import 'package:dev_news/tabs/info.dart';
import 'package:flutter/material.dart';
import 'package:dev_news/tabs/home.dart';

void main() => runApp(DevNewsApp());

class DevNewsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Tabs(),
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {

  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
      appBar: new AppBar(
        title: new Text(
          _title_app,
          style: new TextStyle(
            fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),

      //Content of tabs
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new Home(),
          new Categories(),
          new Info()
        ],
      ),

      //Tabs
      bottomNavigationBar: _getBottomNavigationBar(),

//      //Drawer
//      drawer: new Drawer(
//          child: new ListView(
//            children: <Widget>[
//              new Container(
//                height: 120.0,
//                child: new DrawerHeader(
//                  padding: new EdgeInsets.all(0.0),
//                  decoration: new BoxDecoration(
//                    color: new Color(0xFFECEFF1),
//                  ),
//                  child: new Center(
//                    child: new FlutterLogo(
//                      colors: Colors.blueGrey,
//                      size: 54.0,
//                    ),
//                  ),
//                ),
//              ),
//              new ListTile(
//                  leading: new Icon(Icons.chat),
//                  title: new Text('Suporte'),
//                  onTap: () {
//                    Navigator.pop(context);
//                    Navigator.of(context).pushNamed('/support');
//                  }
//              ),
//              new ListTile(
//                  leading: new Icon(Icons.info),
//                  title: new Text('About'),
//                  onTap: () {
//                    Navigator.pop(context);
//                    Navigator.of(context).pushNamed('/about');
//                  }
//              ),
//              new Divider(),
//              new ListTile(
//                  leading: new Icon(Icons.exit_to_app),
//                  title: new Text('Sign Out'),
//                  onTap: () {
//                    Navigator.pop(context);
//                  }
//              ),
//            ],
//          )
//      )
  );


  Widget _getBottomNavigationBar(){
    return new BottomNavigationBar(
      onTap: onTap,
      currentIndex: _tab,
      //type: BottomNavigationBarType.shifting, // Colorindo
      items: TabItems.map((TabItem) {
        return new BottomNavigationBarItem(
          title: new Text(TabItem.title),
          icon: new Icon(TabItem.icon),
        );
      }).toList(),
    );
  }

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;

      case 2:
        this._title_app = TabItems[2].title;
        break;
    }
  }
}

class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Dev News', icon: Icons.code),
  const TabItem(title: 'Categorias', icon: Icons.category),
  const TabItem(title: 'Sobre', icon: Icons.info)
];


