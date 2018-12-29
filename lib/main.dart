import 'package:flutter/material.dart';
import 'package:dev_news/notice_list_class.dart';

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
      home: NoticeList(),
    );
  }
}

