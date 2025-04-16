part of 'news_bloc.dart';

sealed class NewsEvent {}
/// Get news from the API
final class GetNewsEvent extends NewsEvent {}
/// Load the actual state of News Table to Loaded state
final class LoadFromDbNewsEvent extends NewsEvent {
  final List<ArticleEntity> news;

  LoadFromDbNewsEvent({required this.news});
}
/// Apply fliterClosure to the result
final class FilterDbNewsEvent extends NewsEvent {
  final FilterClosure<String> fliterClosure;

  FilterDbNewsEvent({required this.fliterClosure});
}
