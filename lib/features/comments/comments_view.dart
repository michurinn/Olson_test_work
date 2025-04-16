import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/app/app_scope.dart';
import 'package:olkon_test_work/extensions/article_content_cutter.dart';
import 'package:olkon_test_work/extensions/date_extension.dart';
import 'package:olkon_test_work/extensions/string_hardcoded.dart';
import 'package:olkon_test_work/extensions/theme_extensions/build_context_theme_text_style_extension.dart';
import 'package:olkon_test_work/features/comments/presentation/dialogs/add_comment_dialog.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';
import 'package:olkon_test_work/features/news/domain/entities/comment_dto.dart';
import 'package:olkon_test_work/features/news/presentation/cubit/comments_cubit.dart';

/// {@template CommentsView.class}
/// Comments Screen
/// {@endtemplate}
class CommentsView extends StatefulWidget {
  const CommentsView({super.key, required this.article});
  final ArticleEntity article;

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  late final ScrollController _scrollCOntroller;

  @override
  void initState() {
    super.initState();
    _scrollCOntroller = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () => _scrollCOntroller.animateTo(
            _scrollCOntroller.position.maxScrollExtent,

            /// TODO(me): remake with the value depends of the length of the list
            duration: Durations.extralong4,
            curve: Curves.ease),
      ),
    );
  }

  @override
  void dispose() {
    _scrollCOntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.article.content ?? '');
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments details page'.hardcoded),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
        child: OutlinedButton(
          onPressed: () => showDescriptionDialog(
            context,
            (value) async {
              context.read<CommentsCubit>().addComment(
                    CommentDto(
                      userName: context
                          .read<IAppScope>()
                          .authenticationController
                          .currentUser
                          .name,
                      articleId: widget.article.id,
                      date: DateTime.now().toUtc(),
                      text: value,
                    ),
                  );
              await Future.delayed(
                Durations.extralong1,
                () => _scrollCOntroller.animateTo(
                    _scrollCOntroller.position.maxScrollExtent,

                    /// TODO(me): remake with the value depends of the length of the list
                    duration: Durations.extralong4,
                    curve: Curves.ease),
              );
            },
          ),
          child: Text(
            'Add the comment'.hardcoded,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          controller: _scrollCOntroller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (widget.article.author != null &&
                      widget.article.author!.isNotEmpty)
                    Text(
                      widget.article.author!,
                      style: context.themeTextStyle.title1,
                      textAlign: TextAlign.center,
                    ),
                  if (widget.article.title != null &&
                      widget.article.title!.isNotEmpty)
                    Text(widget.article.title!,
                        style: context.themeTextStyle.title2,
                        textAlign: TextAlign.center),
                  if (widget.article.urlToImage?.isNotEmpty == true)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: widget.article.urlToImage!,
                        errorWidget: (context, url, error) =>
                            const SizedBox.shrink(),
                      ),
                    )
                  else
                    const SizedBox(
                      height: 8,
                    ),
                  if (widget.article.description != null &&
                      widget.article.description!.isNotEmpty)
                    Text(
                      widget.article.description!,
                      style: context.themeTextStyle.text1,
                    ),
                  if (widget.article.content != null &&
                      widget.article.content!.isNotEmpty)
                    Text(
                      widget.article.content!.cutForAPI(),
                      style: context.themeTextStyle.text2,
                    ),
                ],
              ),
            ),
            StreamBuilder(
              stream: context
                  .read<CommentsCubit>()
                  .initCommentsStream(widget.article.id),
              builder: (context, snapshot) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  sliver: SliverList.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: snapshot.hasData && snapshot.data!.isNotEmpty
                        ? snapshot.data!.length
                        : 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(snapshot.data![index].userName ?? '', style: context.themeTextStyle.title3,),
                                  Text(
                                    snapshot.data![index].date.getCommentDate(),
                                  ),
                                ],
                              ),
                              Text(snapshot.data![index].text),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
