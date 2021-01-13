import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:ppp/models/notebook.dart';
import 'package:ppp/models/onenote.dart';
import 'package:ppp/models/page.dart';
import 'package:ppp/models/section.dart';
import 'package:ppp/services/azure.dart';

class Microsoft {
  final azure = Azure();
  final String url = 'https://graph.microsoft.com/v1.0/me/onenote/';
  Future<Map<String, String>> get header async => {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer ' + await azure.token
      };

  Future<String> isConnected() async {
    final endpoint = 'https://graph.microsoft.com/v1.0/me/';
    final response = await http.get(endpoint, headers: await header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['userPrincipalName'];
    }
    print("Response code: ${response.statusCode}: ${response.reasonPhrase}");
    return null;
  }

  Future<List<dynamic>> getNotebooks() async {
    final endpoint = '${url}notebooks';
    try {
      final response = await http.get(endpoint, headers: await header);
      if (response.statusCode != 200) {
        print("Status code: ${response.statusCode}: ${response.reasonPhrase}");
        return [];
      }
      final json = jsonDecode(response.body)['value'];
      return json.map((notebook) => Notebook(notebook)).toList();
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<dynamic>> getSections() async {
    final endpoint = url + 'sections';
    try {
      final response = await http.get(endpoint, headers: await header);
      final json = jsonDecode(response.body)['value'];
      return json.map((section) => Section(section)).toList();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<List<dynamic>> getPages(Section section) async {
    final endpoint = url + 'sections/${section.id}/pages';
    final response = await http.get(endpoint, headers: await header);
    final json = jsonDecode(response.body)['value'];
    return json.map((page) => Page(page)).toList();
  }

  Future<List<dynamic>> getContent(Page page) async {
    List<OneNote> items = [];
    final url = page.url + '?includeIDs=true';
    final response = await http.get(url, headers: await header);
    final document = parse(response.body);
    final ps = document.getElementsByTagName('p');
    ps.forEach((p) {
      p.attributes.forEach((x, y) {
        if (y.contains('to-do')) {
          items.add(OneNote(
              title: p.text, id: p.id, url: page.url, html: p.outerHtml));
        }
      });
    });
    return items;
  }

  Future<bool> done(OneNote item) async {
    print(item.url);
    final body = jsonEncode(
        {"target": item.id, "action": "replace", "content": item.html});
    print(body);
    print(body.runtimeType);
    final response =
        await http.patch(item.url, headers: await header, body: body);
    print(response.statusCode);
    print(response.reasonPhrase);
    return true;
    // "<p data-tag='to-do:completed' data-id='${item.id}'>${item.title}</p>"
  }
}
