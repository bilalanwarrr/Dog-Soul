import 'package:flutter/cupertino.dart';
import 'package:hunter/service/firebaseService.dart';

class DataProvider extends ChangeNotifier {
  FirebaseService service = FirebaseService();
  List<dynamic> categList = [];
  List<dynamic> videoList = [];
  List<dynamic> docsList = [];

  Future fetchCateg(String header) async {
    var msg = await service.fetchDocuments('categories', header);

    if (msg.docs.isNotEmpty) {
      if (categList.isNotEmpty) {
        categList.clear();
        categList = msg.docs;
      } else {
        categList = msg.docs;
      }

      categList.sort((a, b) => a.get('uid').compareTo(b.get('uid')));
      notifyListeners();
    }
  }

  Future fetchVideos() async {
    var msg = await service.fetchDocuments('videos', "6");

    if (msg.docs.isNotEmpty) {
      if (videoList.isNotEmpty) {
        videoList.clear();
        videoList = msg.docs;
      } else {
        videoList = msg.docs;
      }

      videoList.sort((a, b) => a.get('uid').compareTo(b.get('uid')));
      notifyListeners();
    }
  }

  Future fetchDocs() async {
    var msg = await service.fetchDocuments('documents', "6");

    if (msg.docs.isNotEmpty) {
      if (docsList.isNotEmpty) {
        docsList.clear();
        docsList = msg.docs;
      } else {
        docsList = msg.docs;
      }

      docsList.sort((a, b) => a.get('uid').compareTo(b.get('uid')));
      notifyListeners();
    }
  }
}
