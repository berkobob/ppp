import 'item.dart';

class Block extends Item {
  List<Item> items = [];
  Block() : super(source: Source.block, id: null, title: "Give me a name");
}
