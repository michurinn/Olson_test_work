extension ArticleContentCutter on String {
  String cutForAPI() => substring(0, 200);
}
