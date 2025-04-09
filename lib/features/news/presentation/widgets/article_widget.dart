import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment_dto.dart';
import 'package:olkon_test_work/features/news/presentation/cubit/comments_cubit.dart';

class ArticleWidget extends StatefulWidget {
  const ArticleWidget(
      {super.key, required this.article, required this.commentsStream});
  final ArticleEntity article;
  final Stream<List<CommentEntity>> commentsStream;
  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => context.read<CommentsCubit>().addComment(
            CommentDto(
              articleId: widget.article.id,
              date: DateTime.now(),
            ),
          ),
      child: Container(
        height: 100,
        child: Stack(children: [
          Positioned(
            top: 20,
            child: Text(
              widget.article.content ?? widget.article.hashCode.toString(),
            ),
          ),
          StreamBuilder(
            stream: widget.commentsStream,
            builder: (context, snapshot) => snapshot.hasData
                ? Text(
                    (snapshot.data?.length ?? 0).toString(),
                  )
                : Text('No cmnt'),
          ),
        ]),
      ),
    );
  }
}
