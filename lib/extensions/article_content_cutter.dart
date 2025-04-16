/// {@template ArticleContentCutter.class}
/// Cutter for getting only the aviable content (News API add [+3133 Chars] after 200)
/// {@endtemplate}
extension ArticleContentCutter on String {
  String cutForAPI() => substring(0, 200);
}
