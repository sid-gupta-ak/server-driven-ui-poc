import 'package:flutter/material.dart';
import 'ui/screens/paginated_infinite_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: PaginatedInfiniteList()
    );
  }
}
