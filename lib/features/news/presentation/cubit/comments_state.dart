part of 'comments_cubit.dart';

@Deprecated('These states are not really used. Replace the logic without Cubit')
@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initial() = _Initial;
  const factory CommentsState.fetched(
      {required Stream<List<CommentEntity>> streams}) = _Fetched;
}
