import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:octopus/octopus.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/core/database/daos/comments_dao.dart';
import 'package:olkon_test_work/core/database/daos/news_dao.dart';
import 'package:olkon_test_work/features/authentication/presentation/presentation/login_view.dart';
import 'package:olkon_test_work/features/comments/comments_view.dart';
import 'package:olkon_test_work/features/news/data/news_converter.dart';
import 'package:olkon_test_work/features/news/data/repositories/news_repository.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';
import 'package:olkon_test_work/features/news/presentation/cubit/comments_cubit.dart';
import 'package:olkon_test_work/features/news/presentation/news_bloc/news_bloc.dart';
import 'package:olkon_test_work/features/news/presentation/news_view.dart';

enum Routes with OctopusRoute {
  login('login', title: 'Login'),
  articles('articles', title: 'Articles'),
  articleDetails('articleDetails', title: 'ArticleDetails');

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.login => const LoginView(),
        Routes.articles => MultiBlocProvider(
            providers: [
              BlocProvider<CommentsCubit>(
                create: (context) => CommentsCubit(
                  CommentsDao(context.read<IAppScope>().appConfig.database),
                ),
              ),
              BlocProvider<NewsBloc>(
                create: (context) => NewsBloc(
                  newsDao:
                      NewsDao(context.read<IAppScope>().appConfig.database),
                  newsRepository: NewsRepository(
                      dio: context.read<IAppScope>().dio,
                      responseConverter: NewsConverter(),

                      /// TODO(me): hardcoded
                      apiKey: 'b8912f071a4c43fa898e8c6835f3cf44'),
                )..add(
                    GetNewsEvent(),
                  ),
              ),
            ],
            child: const NewsView(),
          ),
        Routes.articleDetails => BlocProvider(
            create: (context) => CommentsCubit(
              CommentsDao(context.read<IAppScope>().appConfig.database),
            ),
            child: CommentsView(
              article: node.arguments.containsKey('article') &&
                      node.arguments['article'] is String
                  ? ArticleEntity.fromJson(
                      jsonDecode(node.arguments['article'] ?? ''),
                    )
                  : ArticleEntity(
                      id: -1,
                      publishedAt: DateTime.fromMicrosecondsSinceEpoch(0),
                    ),
            ),
          ),
      };
}
