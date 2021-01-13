import 'package:ppp/models/item.dart';
import 'package:ppp/services/microsoft.dart';

import 'base.dart';

class OneNotes extends Base {
  Microsoft microsoft = Microsoft();

  Future hasAccess() async {
    updateStatus(Service.busy);
    final result = await microsoft.isConnected();
    updateStatus(result != null ? Service.access : Service.denied);
    getItems("");
  }

  Future getItems([String list]) async {
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
