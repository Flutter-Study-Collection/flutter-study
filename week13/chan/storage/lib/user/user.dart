part 'manager_info.freezed.dart';
part 'manager_info.g.dart';

@freezed
class User with _$User {

  factory User({
    @JsonKey(name: "name")
  }) = _User;
  =
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}