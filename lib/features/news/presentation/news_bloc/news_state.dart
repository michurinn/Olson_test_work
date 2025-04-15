part of 'news_bloc.dart';

sealed class NewsState extends Equatable {}

final class LoadingNewsState extends NewsState {
  @override
  List<Object?> get props => [];
}

final class LoadedNewsState extends NewsState {
  final List<ArticleEntity> news;
  final FilterClosure<String>? fliterClosure;
  LoadedNewsState({
    this.news = const [],
    this.fliterClosure,
  });

  @override
  List<Object?> get props => [news, fliterClosure];

  LoadedNewsState copyWith({
    List<ArticleEntity>? news,
    FilterClosure<String>?  fliterClosure,
  }) {
    return LoadedNewsState(
      news: news ?? this.news,
      fliterClosure: fliterClosure ?? this.fliterClosure,
    );
  }
}

final class ErrorNewsState extends NewsState {
  final List<ArticleEntity> news;

  ErrorNewsState({required this.news});

  @override
  List<Object?> get props => [news];
}
