import 'package:json_annotation/json_annotation.dart';

part 'auth_token_pair.g.dart';

/// Auth token pair.
@JsonSerializable()
class AuthTokenPair {
  final String accessToken;
  final String refreshToken;

  const AuthTokenPair({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokenPair.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenPairFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenPairToJson(this);
}
