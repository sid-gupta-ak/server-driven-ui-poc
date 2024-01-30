import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DynamicSimpleScaffold extends StatefulWidget {
  DynamicSimpleScaffold({
    required this.jsonData,
    super.key,
  });

  final Map<String, dynamic> jsonData;

  @override
  State<DynamicSimpleScaffold> createState() => _DynamicSimpleScaffoldState();
}

class _DynamicSimpleScaffoldState extends State<DynamicSimpleScaffold> {
  late JsonWidgetData _data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    _data = JsonWidgetData.fromDynamic(widget.jsonData);
    return _data.build(context: context);
  }
}
