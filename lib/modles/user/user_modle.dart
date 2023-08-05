import 'package:hive/hive.dart';

part 'user_modle.g.dart';

@HiveType(typeId: 1)
class UserModle extends HiveObject {
  @HiveField(0)
  String? imageUser;

  UserModle({
    this.imageUser,
  });
}
