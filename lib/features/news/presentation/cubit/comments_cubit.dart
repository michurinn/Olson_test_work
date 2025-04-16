import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olkon_test_work/core/database/daos/comments_dao.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment_dto.dart';
part 'comments_state.dart';
part 'comments_cubit.freezed.dart';

@Deprecated('These states are not really used. Replace the logic without Cubit')
class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this.commentsDao) : super(const CommentsState.initial());

  final CommentsDao commentsDao;

  Stream<List<CommentEntity>> initCommentsStream(int articleId) async* {
    yield* commentsDao.getDbArticlesStream(articleId);
  }

  void addComment(CommentDto comment) async {
    await commentsDao.writeComment(comment);
  }
}
