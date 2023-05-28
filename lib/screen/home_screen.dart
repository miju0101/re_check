import 'package:check/screen/gallery_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Map<String, dynamic>> checks = [
    {
      "name": "야옹",
      "photo_url":
          "https://firebasestorage.googleapis.com/v0/b/gallery-7e9ba.appspot.com/o/gallery%2FO8ys30kmfIfLSYVkAxot?alt=media&token=6a0d0ef0-32c3-46b3-89d2-80dd191e1638",
      "profile_img":
          "https://lh3.googleusercontent.com/a/AAcHTtf-kUHdCIz-GhNoSxZidMFBwJtKs9Futl1Nh1ohvw=s96-c",
      "sendDate": "2023년 5월 28일 오후 2시 32분 20초 UTC+9",
      "uid": "sKQR2hjQuzYjWiEHClaMDKGaJTi1"
    },
    {
      "name": "야옹",
      "photo_url":
          "https://firebasestorage.googleapis.com/v0/b/gallery-7e9ba.appspot.com/o/gallery%2FO8ys30kmfIfLSYVkAxot?alt=media&token=6a0d0ef0-32c3-46b3-89d2-80dd191e1638",
      "profile_img":
          "https://lh3.googleusercontent.com/a/AAcHTtf-kUHdCIz-GhNoSxZidMFBwJtKs9Futl1Nh1ohvw=s96-c",
      "sendDate": "2023년 5월 28일 오후 2시 32분 20초 UTC+9",
      "uid": "sKQR2hjQuzYjWiEHClaMDKGaJTi1"
    },
    {
      "name": "야옹",
      "photo_url":
          "https://firebasestorage.googleapis.com/v0/b/gallery-7e9ba.appspot.com/o/gallery%2FO8ys30kmfIfLSYVkAxot?alt=media&token=6a0d0ef0-32c3-46b3-89d2-80dd191e1638",
      "profile_img":
          "https://lh3.googleusercontent.com/a/AAcHTtf-kUHdCIz-GhNoSxZidMFBwJtKs9Futl1Nh1ohvw=s96-c",
      "sendDate": "2023년 5월 28일 오후 2시 32분 20초 UTC+9",
      "uid": "sKQR2hjQuzYjWiEHClaMDKGaJTi1"
    },
    {
      "name": "야옹",
      "photo_url":
          "https://firebasestorage.googleapis.com/v0/b/gallery-7e9ba.appspot.com/o/gallery%2FO8ys30kmfIfLSYVkAxot?alt=media&token=6a0d0ef0-32c3-46b3-89d2-80dd191e1638",
      "profile_img":
          "https://lh3.googleusercontent.com/a/AAcHTtf-kUHdCIz-GhNoSxZidMFBwJtKs9Futl1Nh1ohvw=s96-c",
      "sendDate": "2023년 5월 28일 오후 2시 32분 20초 UTC+9",
      "uid": "sKQR2hjQuzYjWiEHClaMDKGaJTi1"
    },
    {
      "name": "야옹",
      "photo_url":
          "https://firebasestorage.googleapis.com/v0/b/gallery-7e9ba.appspot.com/o/gallery%2FO8ys30kmfIfLSYVkAxot?alt=media&token=6a0d0ef0-32c3-46b3-89d2-80dd191e1638",
      "profile_img":
          "https://lh3.googleusercontent.com/a/AAcHTtf-kUHdCIz-GhNoSxZidMFBwJtKs9Futl1Nh1ohvw=s96-c",
      "sendDate": "2023년 5월 28일 오후 2시 32분 20초 UTC+9",
      "uid": "sKQR2hjQuzYjWiEHClaMDKGaJTi1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("오늘 출석"),
                  Spacer(),
                  //체크 버튼
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("출석하기"),
                  )
                ],
              ),
              //체크 목록
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: checks.length,
                itemBuilder: (context, index) {
                  var current_user = checks[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          current_user["profile_img"],
                        ),
                      ),
                      Text(
                        current_user["name"],
                      )
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryScreen(),
                    ),
                  );
                },
                child: Text("갤러리"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
