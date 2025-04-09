import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment_dto.dart';
import 'package:olkon_test_work/features/news/presentation/cubit/comments_cubit.dart';
import 'package:olkon_test_work/features/news/presentation/news_bloc/news_bloc.dart';
import 'package:olkon_test_work/features/news/presentation/widgets/article_widget.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get news'),
        leading: IconButton.filled(
          onPressed: () => context.read<NewsBloc>().add(
                GetNewsEvent(),
              ),
          icon: const Icon(Icons.refresh),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return switch (state) {
            LoadingNewsState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            // TODO: Handle this case.
            LoadedNewsState(:final news) ||
            ErrorNewsState(:final news) =>
              ConstrainedBox(
                constraints: BoxConstraints.loose(
                  MediaQuery.sizeOf(context),
                ),
                child: BlocBuilder<CommentsCubit, CommentsState>(
                  builder: (context, cubitState) => ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return ArticleWidget(
                          article: news[index],
                          commentsStream: context
                              .watch<CommentsCubit>()
                              .initCommentsStream(news[index].id));
                    },
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
