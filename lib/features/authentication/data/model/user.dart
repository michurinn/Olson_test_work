import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
/// {@template User.class}
/// Now kept only Username
/// {@endtemplate}
@freezed
abstract class User with _$User {
  const User._();
  bool get isAuthenticated => this is _UserAuthorized;
  const factory User.authorized({required String name}) = _UserAuthorized;
  const factory User.unauthorized({@Default(null) String? name}) =
      _UserUnauthorized;
}
