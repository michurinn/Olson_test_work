import 'package:flutter/material.dart';
import 'package:olkon_test_work/extensions/string_hardcoded.dart';
import 'package:olkon_test_work/extensions/theme_extensions/build_context_theme_color_extensions.dart';
import 'package:olkon_test_work/extensions/theme_extensions/build_context_theme_text_style_extension.dart';
import 'package:olkon_test_work/features/news/domain/entities/article_entity.dart';

/// {@template article_widget.class}
/// Widget for displaying an article
/// {@endtemplate}
class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key, required this.article, this.commentsCount});
  final ArticleEntity article;
  final int? commentsCount;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.color?.supportLightViolent.withOpacity(.6),
        border: context.color?.supportLazar != null
            ? Border.all(color: context.color!.socialTg)
            : null,
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   alignment: Alignment.topCenter,
        //   image: CachedNetworkImageProvider(widget.article.urlToImage ?? ''),
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          child: Stack(fit: StackFit.loose, children: [
            Positioned(
              top: 0,
              child: Text(
                article.author?.isNotEmpty == true
                    ? article.author!
                    : 'Unknown source'.hardcoded,
                overflow: TextOverflow.fade,
                style: context.themeTextStyle.title5,
              ),
            ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              bottom: 20,
              child: Text(
                maxLines: 3,
                style: context.themeTextStyle.text2,
                article.content?.isNotEmpty == true
                    ? article.content!
                    : article.title?.isNotEmpty == true
                        ? article.title!
                        : article.description?.isNotEmpty == true
                            ? article.description!
                            : '',
                overflow: TextOverflow.fade,
              ),
            ),
            if (commentsCount != null)
              Positioned(
                right: 20,
                bottom: 00,
                child: Text(
                  commentsCount.toString() + ' comments'.hardcoded,
                  style: context.themeTextStyle.text4,
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
