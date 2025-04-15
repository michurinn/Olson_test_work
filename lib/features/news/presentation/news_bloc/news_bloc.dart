import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/failure.dart';
import 'package:olkon_test_work/core/architecture/domain/entity/result.dart';
import 'package:olkon_test_work/core/database/daos/news_dao.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';
import 'package:olkon_test_work/features/news/domain/repositories/i_news_repository.dart';
import 'package:olkon_test_work/typedefs/filter_closure.dart';

part 'news_event.dart';
part 'news_state.dart';

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
          (v) => add(
            LoadFromDbNewsEvent(news: v),
          ),
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
    if (state is LoadedNewsState) {
      emitter(
        (state as LoadedNewsState).copyWith(
          fliterClosure: event.fliterClosure,
          news: (state as LoadedNewsState).fliterClosure != null
              ? (await newsDao.getDbArticles())
                  .where(
                    (element) => (state as LoadedNewsState)
                        .fliterClosure!(element.content ?? ''),
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
}
