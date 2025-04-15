part of 'news_bloc.dart';

sealed class NewsEvent {}

final class GetNewsEvent extends NewsEvent {}

final class LoadFromDbNewsEvent extends NewsEvent {
  final List<ArticleEntity> news;

  LoadFromDbNewsEvent({required this.news});
}

final class FilterDbNewsEvent extends NewsEvent {
  final FilterClosure<String> fliterClosure;

  FilterDbNewsEvent({required this.fliterClosure});
}
