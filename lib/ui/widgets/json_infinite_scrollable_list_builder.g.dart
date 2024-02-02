// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_infinite_scrollable_list_builder.dart';

// **************************************************************************
// Generator: JsonWidgetLibraryBuilder
// **************************************************************************

// ignore_for_file: avoid_init_to_null
// ignore_for_file: deprecated_member_use
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: prefer_final_locals
// ignore_for_file: prefer_if_null_operators
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unused_local_variable

class JsonInfiniteScrollableListBuilder
    extends _JsonInfiniteScrollableListBuilder {
  const JsonInfiniteScrollableListBuilder({required super.args});

  static const kType = 'infinite_scrollable_list';

  /// Constant that can be referenced for the builder's type.
  @override
  String get type => kType;

  /// Static function that is capable of decoding the widget from a dynamic JSON
  /// or YAML set of values.
  static JsonInfiniteScrollableListBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) =>
      JsonInfiniteScrollableListBuilder(
        args: map,
      );

  @override
  JsonInfiniteScrollableListBuilderModel createModel({
    ChildWidgetBuilder? childBuilder,
    required JsonWidgetData data,
  }) {
    final model = JsonInfiniteScrollableListBuilderModel.fromDynamic(
      args,
      registry: data.jsonWidgetRegistry,
    );

    return model;
  }

  @override
  _InfiniteScrollableList buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    final model = createModel(
      childBuilder: childBuilder,
      data: data,
    );

    return _InfiniteScrollableList(
      data: data,
      dataUrl: model.dataUrl,
      itemTemplate: model.itemTemplate,
      key: key,
      maxSize: model.maxSize,
    );
  }
}

class JsonInfiniteScrollableList extends JsonWidgetData {
  JsonInfiniteScrollableList({
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
    required this.dataUrl,
    required this.itemTemplate,
    this.maxSize,
  }) : super(
          jsonWidgetArgs: JsonInfiniteScrollableListBuilderModel.fromDynamic(
            {
              'dataUrl': dataUrl,
              'itemTemplate': itemTemplate,
              'maxSize': maxSize,
              ...args,
            },
            args: args,
            registry: registry,
          ),
          jsonWidgetBuilder: () => JsonInfiniteScrollableListBuilder(
            args: JsonInfiniteScrollableListBuilderModel.fromDynamic(
              {
                'dataUrl': dataUrl,
                'itemTemplate': itemTemplate,
                'maxSize': maxSize,
                ...args,
              },
              args: args,
              registry: registry,
            ),
          ),
          jsonWidgetType: JsonInfiniteScrollableListBuilder.kType,
        );

  final String dataUrl;

  final Map<String, dynamic> itemTemplate;

  final int? maxSize;
}

class JsonInfiniteScrollableListBuilderModel extends JsonWidgetBuilderModel {
  const JsonInfiniteScrollableListBuilderModel(
    super.args, {
    required this.dataUrl,
    required this.itemTemplate,
    this.maxSize,
  });

  final String dataUrl;

  final Map<String, dynamic> itemTemplate;

  final int? maxSize;

  static JsonInfiniteScrollableListBuilderModel fromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    final result = maybeFromDynamic(
      map,
      args: args,
      registry: registry,
    );

    if (result == null) {
      throw Exception(
        '[JsonInfiniteScrollableListBuilder]: requested to parse from dynamic, but the input is null.',
      );
    }

    return result;
  }

  static JsonInfiniteScrollableListBuilderModel? maybeFromDynamic(
    dynamic map, {
    Map<String, dynamic> args = const {},
    JsonWidgetRegistry? registry,
  }) {
    JsonInfiniteScrollableListBuilderModel? result;

    if (map != null) {
      if (map is String) {
        map = yaon.parse(
          map,
          normalize: true,
        );
      }

      if (map is JsonInfiniteScrollableListBuilderModel) {
        result = map;
      } else {
        registry ??= JsonWidgetRegistry.instance;
        map = registry.processArgs(map, <String>{}).value;
        result = JsonInfiniteScrollableListBuilderModel(
          args,
          dataUrl: map['dataUrl'],
          itemTemplate: map['itemTemplate'],
          maxSize: () {
            dynamic parsed = JsonClass.maybeParseInt(map['maxSize']);

            return parsed;
          }(),
        );
      }
    }

    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    return JsonClass.removeNull({
      'dataUrl': dataUrl,
      'itemTemplate': itemTemplate,
      'maxSize': maxSize,
      ...args,
    });
  }
}

class InfiniteScrollableListSchema {
  static const id =
      'https://peiffer-innovations.github.io/flutter_json_schemas/schemas/kodeco_networking/infinite_scrollable_list.json';

  static final schema = <String, Object>{
    r'$schema': 'http://json-schema.org/draft-07/schema#',
    r'$id': id,
    'title': '_InfiniteScrollableList',
    'type': 'object',
    'additionalProperties': false,
    'properties': {
      'dataUrl': SchemaHelper.stringSchema,
      'itemTemplate': SchemaHelper.anySchema,
      'maxSize': SchemaHelper.numberSchema,
    },
  };
}
