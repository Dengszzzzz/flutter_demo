import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/page/page_artice.dart';

void main() => runApp(ArticleApp());

/**
 * 快捷键 stl stf
 * */
class ArticleApp extends StatelessWidget {
  const ArticleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              '文章',
              style: TextStyle(color: Colors.white)
          ),
        ),
        body: new ArticlePage(),
      ),
    );
    return Container();
  }
}
