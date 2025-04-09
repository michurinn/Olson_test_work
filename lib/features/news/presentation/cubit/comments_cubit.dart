import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olkon_test_work/core/database/daos/comments_dao.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment_dto.dart';
import 'package:rxdart/rxdart.dart';
part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this.commentsDao) : super(const CommentsState.initial());

  final CommentsDao commentsDao;

  final BehaviorSubject<List<CommentEntity>> commnetsStream = BehaviorSubject<List<CommentEntity>>();

  Stream<List<CommentEntity>> initCommentsStream(int articleId) {
    return commentsDao.getDbArticlesStream(articleId);
    if (state is _Initial) {
      emit(_Fetched(streams: commnetsStream.stream));
    }
  }

  /// TODO(me): only for tests
  void addComment(CommentDto comment) {
    commentsDao.writeComment(comment);
  }

  // void removeCommentsStream(int articleId) {
  //   commnetsStream. (
  //     commentsDao.getDbArticlesStream(articleId),
  //   );
  // }
}
