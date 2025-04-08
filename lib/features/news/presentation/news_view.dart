import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/features/news/presentation/bloc/news_bloc.dart';

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
                child: ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) => Card(
                    child: Text(
                      news[index].content ?? news[index].hashCode.toString(),
                    ),
                  ),
                ),
              ),
          };
        },
      ),
    );
  }
}
