import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class GalleryService {
  //이미지 업로드
  // void uploadImage(Map<String, dynamic> myInfo) async {
  //   XFile? selectedFiles =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (selectedFiles != null) {
  //     File file = File(selectedFiles.path);

  //     DocumentReference doc =
  //         await FirebaseFirestore.instance.collection("gallery").add({});

  //     UploadTask task = FirebaseStorage.instance
  //         .ref()
  //         .child("gallery")
  //         .child(doc.id)
  //         .putFile(file);

  //     task.snapshotEvents.listen((event) async {
  //       if (event.state == TaskState.success) {
  //         var url = await event.ref.getDownloadURL();

  //         FirebaseFirestore.instance.collection("gallery").doc(doc.id).set({
  //           "uid": myInfo["uid"],
  //           "name": myInfo["name"],
  //           "profile_img": myInfo["profile_img"],
  //           "sendDate": DateTime.now(),
  //           "photo_url": url,
  //         });
  //       }
  //     });
  //   }
  // }

  //이미지 업로드 여러개
  void uploadImages(Map<String, dynamic> myInfo) async {
    List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();

    if (selectedFiles != null) {
      var files = List.generate(
          selectedFiles.length, (index) => File(selectedFiles[index].path));

      DocumentReference doc =
          await FirebaseFirestore.instance.collection("gallery").add({});

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

      // for (UploadTask task in tasks) {
      //   task.snapshotEvents.listen((event) async {
      //     if (event.state == TaskState.success) {
      //       var url = await event.ref.getDownloadURL();

      //       urls.add(url);
      //     }

      //     print("이미지 저장완료 완료");
      //   });
      // }

      // (chat gpt)위에 코드는 비동기 함수라 다음 아래코드와 같이 작성해야 함.
      await Future.wait(tasks.map((task) async {
        TaskSnapshot snapshot = await task;

        if (snapshot.state == TaskState.success) {
          var url = await snapshot.ref.getDownloadURL();

          urls.add(url);
        }
      }));

      FirebaseFirestore.instance.collection("gallery").doc(doc.id).set({
        "uid": myInfo["uid"],
        "name": myInfo["name"],
        "profile_img": myInfo["profile_img"],
        "sendDate": DateTime.now(),
        "photo_url": urls,
      });

      print("최종 저장완료");
    }
  }

  //이미지 받아오기
  Future<QuerySnapshot> getPhotos() {
    return FirebaseFirestore.instance.collection("gallery").get();
  }

  //이미지 다운로드
  void downLoadImg() {}

  //내가 올린 이미지 삭제
  void deleteImg(String docId) {
    FirebaseFirestore.instance.collection("gallery").doc(docId).delete();
    FirebaseStorage.instance.ref().child("gallery").child(docId).delete();
  }

  //최근 올린 사진 가져오기
  void getTheseDaysPhotos() {}
}
