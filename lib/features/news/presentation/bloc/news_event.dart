part of 'news_bloc.dart';

sealed class NewsEvent {}

final class GetNewsEvent extends NewsEvent {}

final class LoadFromDbNewsEvent extends NewsEvent {
  final List<Article> news;

  LoadFromDbNewsEvent({required this.news});
}
