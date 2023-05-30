import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class GalleryService {
  //이미지 업로드 여러개
  void uploadImages(Map<String, dynamic> myInfo) async {
    List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();

    if (selectedFiles != null && selectedFiles.length > 0) {
      var files = List.generate(
          selectedFiles.length, (index) => File(selectedFiles[index].path));

      //트랜잭션을 하면 여러 작업을 하나의 작업으로 간주함(원자성)
      //작업 수행 중 실패시  이전 상태로 롤백됨.
      try {
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          DocumentReference doc =
              await FirebaseFirestore.instance.collection("gallery").doc();

          List tasks = [];

          for (File file in files) {
            UploadTask task = FirebaseStorage.instance
                .ref()
                .child("gallery")
                .child(doc.id)
                .child(basename(file.path).split(".").first)
                .putFile(file);

            tasks.add(task);
          }

          List<String> urls = [];

          await Future.wait(tasks.map((task) async {
            TaskSnapshot snapshot = await task;

            if (snapshot.state == TaskState.success) {
              var url = await snapshot.ref.getDownloadURL();

              urls.add(url);
            }
          }));

          await FirebaseFirestore.instance
              .collection("gallery")
              .doc(doc.id)
              .set({
            "uid": myInfo["uid"],
            "name": myInfo["name"],
            "profile_img": myInfo["profile_img"],
            "sendDate": DateTime.now(),
            "photo_url": urls,
          });
        });

        print("최종 저장완료");
      } catch (e) {
        print("트랜잭션 실패");
      }
    }
  }

  Future<QuerySnapshot> getPhotos() {
    return FirebaseFirestore.instance
        .collection("gallery")
        .orderBy("sendDate", descending: true)
        .get();
  }

  //이미지 다운로드
  void downLoadImg(String url) async {}

  //내가 올린 이미지 삭제
  void deleteImg(String docId) async {
    FirebaseFirestore.instance.collection("gallery").doc(docId).delete();
    FirebaseStorage.instance.ref().child("gallery").child(docId).delete();
  }

  //최근 올린 사진 가져오기
  void getTheseDaysPhotos() {}
}
