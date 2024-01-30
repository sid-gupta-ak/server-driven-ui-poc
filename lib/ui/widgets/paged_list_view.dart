import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/result.dart';
import '../../network/remote_data_source.dart';

class OwnPagedListView extends StatefulWidget {
  const OwnPagedListView({super.key, required this.apiResponse,});

  final RemoteDataSource apiResponse;

  @override
  State<OwnPagedListView> createState() => _OwnPagedListViewState();
}

class _OwnPagedListViewState extends State<OwnPagedListView> {
  final _pagingController = PagingController<int, dynamic>(firstPageKey: 0);

  @override
  void initState() {
    // TODO: implement initState
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
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
  void dispose() {
    // TODO: implement dispose
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build called');

    return RefreshIndicator(child: PagedListView.separated(
      pagingController: _pagingController,
      padding: const EdgeInsets.all(16),
      builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, value, index) {
            var pokemon = value as Map<String, dynamic>;
            return ListTile(
              title: Text(pokemon['name']),
            );
          },
          firstPageErrorIndicatorBuilder: (context) => Text('first page failed')
      ),
      separatorBuilder: (context, index) => SizedBox(height: 16,),),
      onRefresh: () =>
          Future.sync(
                  () => _pagingController.refresh()
          ),
    );
  }
}
