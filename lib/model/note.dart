import 'package:isar/isar.dart';

part 'note.g.dart'; //needed to generate file//then run flutter pub run build_runner build

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
