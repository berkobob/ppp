import 'dart:developer' as d;
import 'package:ppp/models/item.dart';
import 'package:ppp/services/microsoft.dart';

import 'base.dart';

class OneNotes extends Base {
  Microsoft microsoft = Microsoft();

  Future hasAccess() async {
    updateStatus(Service.busy);
    final result = await microsoft.isConnected();
    updateStatus(result != null ? Service.access : Service.denied);
    await getItems();
  }

  Future getItems() async {
    updateStatus(Service.busy);
    final allSections = await microsoft.getSections();
    final sections =
        allSections.where((section) => section.notebook == 'RPM').toList();
    var count = 1;
    await Future.forEach(sections, (section) async {
      final pages = await microsoft.getPages(section);
      d.log('Reading section ${count++} of ${sections.length}');
      await Future.forEach(pages, (page) async {
        final newItems = await microsoft.getContent(page);
        if (newItems.length > 0) {
          items += newItems;
          notifyListeners();
        }
      });
    });
    updateStatus(Service.access);
  }

  // Future getItems() async {
  //   updateStatus(Service.busy);

  //   final sections = await microsoft.getSections();
  //   final pages =
  //       Future.wait(sections.map((section) => microsoft.getPages(section)));
  //   pages.((page) => microsoft.getContent(page));
  //   print(x);
  //   updateStatus(Service.access);
  // }

  Future getItemsOld() async {
    if (status != Service.access) return;
    updateStatus(Service.busy);

    final sections = await microsoft.getSections();
    final section = sections
        .firstWhere((section) => section.displayName == 'Unfiled Notes');

    final pages = await microsoft.getPages(section);
    final page = pages.firstWhere((page) => page.title == 'ANTOINE');

    items = await microsoft.getContent(page);

    updateStatus(Service.access);
  }

  Future<bool> delete(Item item) async {
    return await microsoft.done(item);
  }
}
