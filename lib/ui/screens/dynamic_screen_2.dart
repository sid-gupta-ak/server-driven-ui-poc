import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:kodeco_networking/ui/widgets/dynamic_simple_scaffold.dart';
import 'package:kodeco_networking/ui/widgets/json_infinite_scrollable_list_builder.dart';

class DynamicScreen2 extends StatefulWidget {
  DynamicScreen2({super.key});

  @override
  State<DynamicScreen2> createState() => _DynamicScreen2State();
}

class _DynamicScreen2State extends State<DynamicScreen2> {
  Map<String, dynamic> jsonData = {"type": "placeholder"};

  Future<Map<String, dynamic>> readJson() async {
    // final String jsonString =
    //     await rootBundle.loadString('assets/json/scaffold.json');

    final String jsonString =
        await rootBundle.loadString('assets/json/infinite_list_2.json');

    var newJsonData = json.decode(jsonString);
    return newJsonData;
  }

  @override
  Widget build(BuildContext context) {
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
      setState(() {
        jsonData = newData;
      });
    });
  }
}
