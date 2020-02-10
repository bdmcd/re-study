import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  
  @JsonKey(name: 'guid')
  final String id;

  final String name;
  final String email;
  final String photoUrl;

  User({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  User copyWith({
    String id,
    String name,
    String email,
    String photoUrl,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    photoUrl: photoUrl ?? this.photoUrl,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}