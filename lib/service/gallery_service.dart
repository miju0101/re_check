import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class GalleryService {
  //이미지 업로드
  void uploadImage(Map<String, dynamic> myInfo) async {
    XFile? selectedFiles =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedFiles != null) {
      File file = File(selectedFiles.path);

      DocumentReference doc =
          await FirebaseFirestore.instance.collection("gallery").add({});

      //gallery/{doc.id}/
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child("gallery")
          .child(doc.id)
          .putFile(file);

      task.snapshotEvents.listen((event) async {
        if (event.state == TaskState.success) {
          var url = await event.ref.getDownloadURL();

          FirebaseFirestore.instance.collection("gallery").doc(doc.id).set({
            "uid": myInfo["uid"],
            "name": myInfo["name"],
            "profile_img": myInfo["profile_img"],
            "sendDate": DateTime.now(),
            "photo_url": url,
          });
        }
      });
    }
  }

  //이미지 받아오기
  Future<QuerySnapshot> getPhotos() {
    return FirebaseFirestore.instance.collection("gallery").get();
  }

  //이미지 다운로드
  void downLoadImg() {}

  //내가 올린 이미지 삭제
  //
}
