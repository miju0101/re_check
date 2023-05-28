import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  Map<String, dynamic> my = {
    "email": "fffdjd23@gmail.com",
    "name": "야옹",
    "profile_img":
        "https://lh3.googleusercontent.com/a/AAcHTtf-kUHdCIz-GhNoSxZidMFBwJtKs9Futl1Nh1ohvw=s96-c",
    "uid": "sKQR2hjQuzYjWiEHClaMDKGaJTi1",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(my["profile_img"]),
                ),
                Text(my["name"]),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text("로그아웃"),
            )
          ],
        ),
      ),
    );
  }
}
