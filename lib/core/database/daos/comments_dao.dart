import 'package:drift/drift.dart';
import 'package:olkon_test_work/core/database/app_database.dart';

part 'comments_dao.g.dart';

@DriftAccessor(tables: [CommentsTable])
class CommentsDao extends DatabaseAccessor<AppDatabase>
    with _$CommentsDaoMixin {
  CommentsDao(super.attachedDatabase);

  
  
}
