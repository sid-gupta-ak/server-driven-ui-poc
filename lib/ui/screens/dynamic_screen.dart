import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:kodeco_networking/ui/widgets/dynamic_simple_scaffold.dart';
import 'package:kodeco_networking/ui/widgets/json_infinite_scrollable_list_builder.dart';

class DynamicScreen extends StatefulWidget {
  DynamicScreen({super.key});

  @override
  State<DynamicScreen> createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  Map<String, dynamic> jsonData = {"type": "placeholder"};

  Future<Map<String, dynamic>> readJson() async {
    // final String jsonString =
    //     await rootBundle.loadString('assets/json/scaffold.json');

    final String jsonString =
        await rootBundle.loadString('assets/json/infinite_list.json');

    var newJsonData = json.decode(jsonString);
    return newJsonData;
  }

  @override
  Widget build(BuildContext context) {
    print('build of dynamic screen called');
    return Scaffold(
      body: DynamicSimpleScaffold(jsonData: jsonData),
    );
  }

  @override
  void initState() {
    super.initState();

    var registry = JsonWidgetRegistry.instance;
    registry.registerCustomBuilder(JsonInfiniteScrollableListBuilder.kType,
        JsonWidgetBuilderContainer(
      builder: (map, {registry}) {
        return JsonInfiniteScrollableListBuilder.fromDynamic(map);
      },
    ));

    readJson().then((newData) {
      print('calling set state');
      setState(() {
        jsonData = newData;
      });
    });
  }
}
