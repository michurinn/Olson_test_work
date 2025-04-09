part of 'comments_cubit.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initial() = _Initial;
  const factory CommentsState.fetched({required Stream<List<CommentEntity>> streams}) = _Fetched;
}
