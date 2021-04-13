import 'package:flutter/material.dart';
import 'package:mvvm_news_app/constants/apiKey.dart';
import 'package:mvvm_news_app/viewModel/listNewsViewModel.dart';
import 'package:mvvm_news_app/widgets/newsGrid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initialMethod();
  }

  void _initialMethod() {
    context.read<ListNewsViewModel>().fetchTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ListNewsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => _initialMethod(),
          ),
          PopupMenuButton(
            onSelected: (value) {
              listViewModel.fetchTopNewsHeadlinesByCountry(
                Constants.Countries[value],
              );
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map(
                    (v) => PopupMenuItem(
                      value: v,
                      child: Text(v),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
              child: Text(
                'Headlines',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: NewsGrid(
                articles: listViewModel.articles,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
