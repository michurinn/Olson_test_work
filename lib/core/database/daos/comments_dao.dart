import 'package:drift/drift.dart';
import 'package:olkon_test_work/core/database/app_database.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment_dto.dart';

part 'comments_dao.g.dart';

@DriftAccessor(tables: [CommentsTable])
class CommentsDao extends DatabaseAccessor<AppDatabase>
    with _$CommentsDaoMixin {
  CommentsDao(super.attachedDatabase);

  Future<void> writeComment(CommentDto comment) async {
    /// TODO(me): make sure that datetime is writing in UTC or same way to unificate it
    into(commentsTable).insert(
      CommentsTableCompanion.insert(
        date: comment.date,
        articleId: comment.articleId,
        username: Value.absentIfNull(comment.userName),
        bodyText: comment.text,
      ),
    );
  }

  /// TODO(me): use for debugging
  Future<void> deleteCommentsByArticleId(int articleId) async {
    delete(commentsTable).where(
      (tbl) => tbl.articleId.equals(articleId),
    );
  }

  Stream<List<CommentEntity>> getDbArticlesStream(int articleId) async* {
    yield (await (select(commentsTable)
              ..where(
                (tbl) => tbl.articleId.equals(articleId),
              ))
            .get())
        .map(
          (e) => CommentEntity(
            id: e.id,
            date: e.date,
            articleId: e.articleId,
            userName: e.username,
            text: e.bodyText,
          ),
        )
        .toList();
    yield* (select(commentsTable)
          ..where(
            (tbl) => tbl.articleId.equals(articleId),
          ))
        .watch()
        .map(
          (event) => event
              .map(
                (e) => CommentEntity(
                  id: e.id,
                  date: e.date,
                  articleId: e.articleId,
                  userName: e.username,
                  text: e.bodyText,
                ),
              )
              .toList(),
        ).asBroadcastStream();
  }
}
