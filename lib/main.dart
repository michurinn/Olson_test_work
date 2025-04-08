import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olkon_test_work/core/architecture/data/converter/converter.dart';
import 'package:olkon_test_work/core/database/app_database.dart';
import 'package:olkon_test_work/core/database/daos/news_dao.dart';
import 'package:olkon_test_work/features/news/data/news_converter.dart';
import 'package:olkon_test_work/features/news/data/repositories/news_repository.dart';
import 'package:olkon_test_work/features/news/domain/entities/news_response.dart';
import 'package:olkon_test_work/features/news/presentation/bloc/news_bloc.dart';
import 'package:olkon_test_work/features/news/presentation/news_view.dart';
import 'package:olkon_test_work/typedefs/json_typedef.dart';
import 'package:olkon_test_work/urls/urls.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized().scheduleWarmUpFrame();
  runApp(const MyApp());
}

final AppDatabase db = AppDatabase();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(
          newsDao: NewsDao(db),
          newsRepository: NewsRepository(
              dio: Dio()..options.baseUrl = (Urls.baseUrl),
              responseConverter: NewsConverter(),
              apiKey: 'b8912f071a4c43fa898e8c6835f3cf44'),
        )..add(
            GetNewsEvent(),
          ),
        child: const NewsView(),
      ),
    );
  }
}
