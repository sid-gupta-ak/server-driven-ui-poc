import 'dart:convert';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:kodeco_networking/network/remote_data_source.dart';

import '../../models/result.dart';

part 'json_infinite_scrollable_list_builder.g.dart';

@jsonWidget
abstract class _JsonInfiniteScrollableListBuilder extends JsonWidgetBuilder {
  const _JsonInfiniteScrollableListBuilder({required super.args});

  @override
  _InfiniteScrollableList buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  });
// {
//   // TODO: implement buildCustom
//   throw UnimplementedError();
// }
}

class _InfiniteScrollableList extends StatefulWidget {
  _InfiniteScrollableList({
    super.key,
    required this.dataUrl,
    required this.itemTemplate,
    @JsonBuildArg() required this.data,
  });

  final String dataUrl;
  final Map<String, dynamic> itemTemplate;
  final JsonWidgetData data;

  // note - can be instantiated with url
  final RemoteDataSource apiResponse = RemoteDataSource();

  @override
  State<_InfiniteScrollableList> createState() =>
      _InfiniteScrollableListState();
}

class _InfiniteScrollableListState extends State<_InfiniteScrollableList> {
  final _pagingController = PagingController<int, dynamic>(firstPageKey: 0);
  late final JsonWidgetData _data;
  late final JsonWidgetRegistry _registry;

  Future<void> _fetchPage(int pageKey) async {
    print('fetch page being called with $pageKey');
    try {
      Result newPage = await widget.apiResponse.getPokemons(pageKey);

      final previousCount = _pagingController.itemList?.length ?? 0;
      var isLastPage = false;

      if (newPage is SuccessState) {
        var pokemons = (newPage as SuccessState).value['results'];
        isLastPage = (previousCount + pokemons.length) > 100;

        if (isLastPage) {
          _pagingController.appendLastPage(pokemons);
        } else {
          final nextPageKey = (pageKey + pokemons.length) as int;
          _pagingController.appendPage(pokemons, nextPageKey);
        }
      } else if (newPage is ErrorState) {
        // return Text('error');
      } else {
        // return CircularProgressIndicator();
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _data = JsonWidgetData.fromDynamic(widget.itemTemplate);
    _registry = JsonWidgetRegistry();
    super.initState();
  }

  @override
  void dispose() {
    print('dispose being called');
    // TODO: implement dispose
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build of infinite called');

    return RefreshIndicator(
      child: PagedListView.separated(
        pagingController: _pagingController,
        padding: const EdgeInsets.all(16),
        builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, value, index) {
              var pokemon = value as Map<String, dynamic>;
              _registry.setValue('title', pokemon['name']);
              _registry.setValue('pokemon', pokemon);
              return _data.build(context: context, registry: _registry);
            },
            firstPageErrorIndicatorBuilder: (context) =>
                Text('first page failed')),
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
      ),
      onRefresh: () => Future.sync(() => _pagingController.refresh()),
    );
  }
}
