import 'package:flutter/material.dart';

import 'dynamic_screen.dart';

class PaginatedInfiniteList extends StatefulWidget {
  const PaginatedInfiniteList({super.key});

  @override
  State<PaginatedInfiniteList> createState() => _PaginatedInfiniteListState();
}

class _PaginatedInfiniteListState extends State<PaginatedInfiniteList> {
  final List<Widget> _slivers = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    print("inside init");
    loadData();
  }

  loadData() async {
    print("========= loadData called with $_currentPage");
    if (_currentPage == 0) {
      _slivers.add(DynamicScreen(assetFile: 'assets/json/infinite_list.json'));
      _slivers
          .add(DynamicScreen(assetFile: 'assets/json/infinite_list_2.json'));
      setState(() {
        print("Adding data for first time");
        _currentPage = 1;
      });
    } else if (_currentPage == 1) {
      _slivers.add(DynamicScreen(assetFile: 'assets/json/infinite_list.json'));
      _slivers
          .add(DynamicScreen(assetFile: 'assets/json/infinite_list_2.json'));
      setState(() {
        print("Adding data for second time");
        _currentPage = 2;
      });
    } else if (_currentPage == 2) {
      _slivers.add(DynamicScreen(assetFile: 'assets/json/infinite_list.json'));
      _slivers
          .add(DynamicScreen(assetFile: 'assets/json/infinite_list_2.json'));
      setState(() {
        print("Adding data for third time");
        _currentPage = 3;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // catch
  @override
  Widget build(BuildContext context) {
    print("Build called");
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter == 0) {
            print('Calling load data from scroll notification');
            // User has reached the end of the list
            // Load more data or trigger pagination in flutter
            loadData();
          }
          return false;
        },
        child: CustomScrollView(
          slivers: _slivers,
        ),
      ),
    );
  }
}
