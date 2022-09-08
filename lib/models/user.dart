import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  User();

  late String login;
  late String avatar_url;
  late String type;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  bool? hireable;
  String? bio;
  late num? public_repos;
  late num? followers;
  late num? following;
  late String? created_at;
  late String? updated_at;
  late num? total_private_repos;
  late num? owned_private_repos;

  //不同的类使用不同的mixin即可
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
