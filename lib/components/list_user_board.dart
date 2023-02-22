import 'package:flutter/material.dart';

import '../widgets/profile_picture.dart';
class ListUserInABoard extends StatelessWidget {
  final List<String> listPhotos;

  const ListUserInABoard({Key? key, required this.listPhotos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (listPhotos.isNotEmpty)
        ? SizedBox(
      width: (listPhotos.length == 1)
          ? 60
          : (listPhotos.length == 2)
          ? 90
          : (listPhotos.length == 3)
          ? 120
          : (listPhotos.length == 4)
          ? 150
          : 180,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 10,
            child: Profile_Picture(
              taille: 50,
              image: listPhotos[0],
            ),
          ),
          (listPhotos.length >= 2)
              ? Positioned(
            left: 40,
            bottom: 0,
            child: Profile_Picture(
              taille: 50,
              image: listPhotos[1],
            ),
          )
              : Container(),
          (listPhotos.length >= 3)
              ? Positioned(
            left: 70,
            bottom: 0,
            child: Profile_Picture(
              taille: 50,
              image: listPhotos[2],
            ),
          )
              : Container(),
          (listPhotos.length >= 4)
              ? Positioned(
            left: 100,
            bottom: 0,
            child: Profile_Picture(
              taille: 50,
              image: listPhotos[3],
            ),
          )
              : Container(),
          (listPhotos.length >= 5)
              ? Positioned(
            left: 130,
            bottom: 0,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  color:
                  Color.fromRGBO(5, 4, 43, 1),
                  shape: BoxShape.circle),
              child: Center(
                child: Text(
                  '+${listPhotos.length - 4}',
                  style: const TextStyle(
                      color: Colors.white),
                ),
              ),
            ),
          )
              : Container(),
        ],
      ),
    )
        : Container();
  }
}
