import 'package:flutter/material.dart';
import 'package:mvvm_news_app/view/homeScreen.dart';
import 'package:mvvm_news_app/viewModel/listNewsViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ListNewsViewModel(),
          ),
        ],
        child: HomeScreen(),
      ),
      theme: ThemeData.dark(),
    );
  }
}
