import 'package:drift/drift.dart';
import 'package:olkon_test_work/core/database/app_database.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_dto.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';

part 'news_dao.g.dart';

@DriftAccessor(tables: [NewsTable, CommentsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  NewsDao(super.attachedDatabase);

  Future<void> writeNews(Set<ArticleDto> articles) async {
    await batch((batch) {
      // functions in a batch don't have to be awaited - just
      // await the whole batch afterwards.
      batch.insertAll(
        newsTable,
        articles.map((e) => NewsTableCompanion(
              author: Value.absentIfNull(e.author),
              content: Value.absentIfNull(e.content),
              description: Value.absentIfNull(e.description),
              id: Value.absentIfNull(e.hashCode),
              publishedAt: Value.absentIfNull(e.publishedAt),
              title: Value.absentIfNull(e.title),
              urlToImage: Value.absentIfNull(e.urlToImage),
            )),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  /// TODO(me): use for debugging
  Future<void> deleteAllNews() async {
    delete(newsTable).go();
    delete(commentsTable).go();
  }

  Future<void> deleteArticle(ArticleEntity article) async {
    delete(newsTable).where(
      (tbl) => tbl.id.equals(article.id),
    );
    await batch((batch) {
      batch.deleteWhere(
        commentsTable,
        (tbl) => tbl.articleId.equals(article.id),
      );
    });
  }

  Stream<List<ArticleEntity>> getDbArticlesStream() {
    return select(newsTable).watch().map((event) => event
        .map(
          (e) => ArticleEntity(
              id: e.id,
              author: e.author ?? '',
              title: e.title ?? '',
              description: e.description ?? '',
              urlToImage: e.urlToImage ?? '',
              publishedAt: e.publishedAt ?? DateTime.now(),
              content: e.content ?? ''),
        )
        .toList());
  }

  Future<List<ArticleEntity>> getDbArticles() async {
    return (await select(newsTable).get())
        .map(
          (e) => ArticleEntity(
              id: e.id,
              author: e.author ?? '',
              title: e.title ?? '',
              description: e.description ?? '',
              urlToImage: e.urlToImage ?? '',
              publishedAt: e.publishedAt ?? DateTime.now(),
              content: e.content ?? ''),
        )
        .toList();
  }
}
