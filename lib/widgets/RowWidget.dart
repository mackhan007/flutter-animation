import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internship/pages/NewPage.dart';

class RowWidget extends StatelessWidget {
  final String imagePath, firstname, lastname, userImage;
  const RowWidget(
      {Key? key,
      required this.imagePath,
      required this.firstname,
      required this.lastname,
      required this.userImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 800),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        NextPage(
                          imagePath: imagePath,
                          firstname: firstname,
                          lastname: lastname,
                          userImage: userImage,
                          transitionAnimation: animation,
                        )));
          },
          child: Hero(
            tag: imagePath,
            transitionOnUserGestures: true,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
        ),
        Positioned(
            bottom: 15,
            left: 15,
            child: Container(
              child: Row(
                children: [
                  Hero(
                    tag: userImage,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: userImage,
                            width: 45,
                            height: 45,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Hero(
                    tag: firstname,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        firstname + ' ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: lastname,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        lastname + ' ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
