import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/result.dart';
import 'package:olkon_test_work/core/database/daos/news_dao.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';
import 'package:olkon_test_work/features/news/domain/repositories/i_news_repository.dart';
import 'package:olkon_test_work/typedefs/filter_closure.dart';

part 'news_event.dart';
part 'news_state.dart';

/// {@template news_bloc.class}
/// Requests the news and writes it to the database. Subscribed to database updates to change the state. 
/// After applying the filter, it returns news, the content or title of which corresponds to the transmitted closure.
/// {@endtemplate}
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required this.newsRepository,
    required this.newsDao,
  }) : super(LoadingNewsState()) {
    on<NewsEvent>((event, emitter) async {
      await switch (event) {
        GetNewsEvent() => getNews(event, emitter),
        LoadFromDbNewsEvent() => loadFromDb(event, emitter),
        FilterDbNewsEvent() => filterDbNews(event, emitter)
      };
    });

    newsSubscription = newsDao.getDbArticlesStream().listen(
      (v) {
        if (kDebugMode) {
          log(v.length.toString() + ' from DB', name: 'NewsBloc');
        }

        add(
          LoadFromDbNewsEvent(news: v),
        );
      },
    );
  }

  final INewsRepository newsRepository;
  final NewsDao newsDao;
  late final StreamSubscription<List<ArticleEntity>> newsSubscription;

  Future<void> getNews(GetNewsEvent event, Emitter<NewsState> emitter) async {
    try {
      final result = await newsRepository.getNews();
      return switch (result) {
        ResultOk<NewsOkResponse, Failure<Object?>>(:final data) =>
          newsDao.writeNews(
            data.articles.toSet(),
          ),
        ResultFailed<NewsOkResponse, Failure<Object?>>() => null,
      };
    } on Object catch (e, _) {
      emitter(
        ErrorNewsState(
            news: switch (state) {
          LoadedNewsState(:final news) => news,
          LoadingNewsState() => [],
          ErrorNewsState(:final news) => news,
        }),
      );
    }
  }

  Future<void> filterDbNews(
      FilterDbNewsEvent event, Emitter<NewsState> emitter) async {
        /// TODO(me):  Add cases for other states at the time of receiving the event
    if (state is LoadedNewsState) {
      emitter(
        (state as LoadedNewsState).copyWith(
          fliterClosure: event.fliterClosure,
          news: (state as LoadedNewsState).fliterClosure != null
              ? (await newsDao.getDbArticles())
                  .where(
                    (element) =>
                        (state as LoadedNewsState)
                            .fliterClosure!(element.content ?? '') ||
                        (state as LoadedNewsState)
                            .fliterClosure!(element.title ?? ''),
                  )
                  .toList()
              : (await newsDao.getDbArticles()),
        ),
      );
    }
  }

  Future<void> loadFromDb(
      LoadFromDbNewsEvent event, Emitter<NewsState> emitter) async {
    if (state is LoadedNewsState &&
        (state as LoadedNewsState).fliterClosure != null) {
      emitter(
        LoadedNewsState(
          news: event.news
            ..where(
              (element) => (state as LoadedNewsState)
                  .fliterClosure!(element.content ?? ''),
            ),
        ),
      );
    } else {
      emitter(
        LoadedNewsState(news: event.news),
      );
    }
  }

  @override
  Future<void> close() {
    newsSubscription.cancel();
    return super.close();
  }

  @override
  void onChange(Change<NewsState> change) {
    if (change.currentState is LoadedNewsState &&
        change.nextState is LoadedNewsState) {
      log(
          (change.currentState as LoadedNewsState).news.length.toString() +
              '\n ${(change.nextState as LoadedNewsState).news.length.toString()}',
          name: 'NewsBloc');
    }

    super.onChange(change);
  }
}
