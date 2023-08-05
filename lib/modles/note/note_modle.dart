import 'package:hive/hive.dart';

part 'note_modle.g.dart';

@HiveType(typeId: 0)
class NoteModle extends HiveObject {
  @HiveField(0)
  String body;
  @HiveField(1)
  String date;
  @HiveField(2)
  int colorType;
  @HiveField(3)
  String? imageUrl;
  @HiveField(4)
  bool? isFavorite;
  NoteModle({
    required this.body,
    required this.date,
    this.isFavorite,
    required this.colorType,
    this.imageUrl,
  });
}
