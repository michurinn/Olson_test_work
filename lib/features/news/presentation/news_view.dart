import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/features/news/presentation/cubit/comments_cubit.dart';
import 'package:olkon_test_work/features/news/presentation/news_bloc/news_bloc.dart';
import 'package:olkon_test_work/features/news/presentation/widgets/article_widget.dart';
import 'package:olkon_test_work/features/news/presentation/widgets/search_widget.dart';
import 'package:olkon_test_work/features/theme/di/theme_mode_scope.dart';
import 'package:olkon_test_work/features/theme/providers/theme_mode_provider.dart';
import 'package:olkon_test_work/navigation/pages.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get news'),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  context.read<IThemeModeScope>().themeModeController.swipeTheme();
                },
                icon: const Icon(Icons.sunny),
              ),
              IconButton(
                onPressed: () async {
                  context.read<IAppScope>().authenticationController.signOut();
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchWidget(
                onChanged: (value) => context.read<NewsBloc>().add(
                      FilterDbNewsEvent(
                        fliterClosure: (p0) =>
                            value.trimLeft().trimRight().isEmpty
                                ? true
                                : p0.toUpperCase().contains(
                                      value.toUpperCase(),
                                    ),
                      ),
                    ),
              ),
            )),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.value(
          () => context.read<NewsBloc>().add(
                GetNewsEvent(),
              ),
        ),
        child: BlocBuilder<NewsBloc, NewsState>(
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
                    builder: (context, cubitState) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                        itemCount: news.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => context.octopus.setState(
                              (state) => state
                                ..add(
                                  Routes.articleDetails.node(
                                    arguments: {
                                      'article': jsonEncode(
                                        news[index].toJson(),
                                      ),
                                    },
                                  ),
                                ),
                            ),
                            child: StreamBuilder(
                              stream: context
                                  .watch<CommentsCubit>()
                                  .initCommentsStream(news[index].id),
                              builder: (context, snapshot) => ArticleWidget(
                                  article: news[index],
                                  commentsCount: snapshot.hasData
                                      ? snapshot.data?.length
                                      : null),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
