import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/home/search/bloc/search.bloc.dart';
import 'package:rxdart/rxdart.dart';

class SearchChampionController extends Disposable {
  final NavitHttpClient http;
  final SearchBloc bloc;

  SearchChampionController({required this.http, required this.bloc}) {
    _queue.stream
        .throttleTime(const Duration(milliseconds: 300))
        .debounceTime(const Duration(seconds: 1))
        .distinct()
        .listen(_search);
  }

  @override
  void dispose() {
    _queue.close();
  }

  final BehaviorSubject<String> _queue = BehaviorSubject<String>();

  Future<void> search(String query) async {
    _queue.sink.add(query);
  }

  Future<void> _search(String query) async {
    bloc.add(OnLoadingSearchEvent());
    final foldable = await resolveRequest<List<ChampionModel>>(
      http.request,
      SearchRequest(query: query),
      (data) {
        List<dynamic> list =
            data["data"].map((x) => ChampionModel.fromJson(x)).toList();
        List<ChampionModel> result = List<ChampionModel>.from(list);
        return result;
      },
    );
    foldable.fold((error) {
      bloc.add(OnErrorSearchEvent(error));
    }, (value) {
      bloc.add(OnSuccessSearchEvent(value));
    });
  }
}

class SearchRequest extends INavitRequest {
  final String query;

  SearchRequest({required this.query});
  @override
  String get path => 'http://localhost:8080/api/v1/search/$query';

  @override
  Map<String, dynamic> get headers =>
      {'Accept': '*/*', 'content-type': 'text/plain'};

  @override
  Map<String, dynamic> get extras => {'external': true};
}
