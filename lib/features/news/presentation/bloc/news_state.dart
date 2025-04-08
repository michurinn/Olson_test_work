part of 'news_bloc.dart';

sealed class NewsState {}

final class LoadingNewsState extends NewsState {}

final class LoadedNewsState extends NewsState {
  final List<Article> news;

  LoadedNewsState({required this.news});
}

final class ErrorNewsState extends NewsState {
  final List<Article> news;

  ErrorNewsState({required this.news});
}
