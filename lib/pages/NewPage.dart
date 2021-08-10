import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/util/Constants.dart';

class NextPage extends StatefulWidget {
  final String imagePath, firstname, lastname, userImage;
  final Animation<double> transitionAnimation;
  const NextPage(
      {Key? key,
      required this.imagePath,
      required this.firstname,
      required this.lastname,
      required this.userImage,
      required this.transitionAnimation})
      : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<String> imageList = [
    Constants.image3,
    Constants.image2,
    Constants.image1,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            SafeArea(
              child: Hero(
                tag: widget.imagePath,
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                ),
              ),
            ),
            SafeArea(
              child: Container(
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(
                //       widget.imagePath,
                //     ),
                //     fit: BoxFit.fill,
                //   ),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    Hero(
                      tag: widget.userImage,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
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
                              imageUrl: widget.userImage,
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    Hero(
                      tag: widget.firstname,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(35, 30, 0, 0),
                          child: Text(
                            widget.firstname + ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: widget.lastname,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
                          child: Text(
                            widget.lastname + ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: widget.transitionAnimation,
                      builder: (context, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, 1),
                            end: Offset(0, 0),
                          ).animate(
                            CurvedAnimation(
                                parent: widget.transitionAnimation,
                                curve: Interval(0, 1, curve: Curves.easeIn)),
                          ),
                          child: child,
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
                            child: Text(
                              '@xteemu',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(35, 40, 0, 0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  ' Stockholm, Sweden',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.location,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  ' instagram.com/teemography',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          GestureDetector(
                            onVerticalDragUpdate: (data) {
                              if (data.delta.dy > 10) {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Photos',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Likes',
                                        style: TextStyle(
                                          fontSize: 18,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Collections',
                                        style: TextStyle(
                                          fontSize: 18,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: imageList.length,
                                        itemBuilder: (context, position) {
                                          return Container(
                                            padding: EdgeInsets.fromLTRB(
                                                40, 40, 0, 40),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Image.asset(
                                                imageList[position],
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child: AnimatedBuilder(
            //     animation: widget.transitionAnimation,
            //     builder: (context, child) {
            //       return SlideTransition(
            //         position: Tween<Offset>(
            //           begin: Offset(0, 1),
            //           end: Offset(0, 0),
            //         ).animate(
            //           CurvedAnimation(
            //               parent: widget.transitionAnimation,
            //               curve: Interval(0, 1, curve: Curves.easeIn)),
            //         ),
            //         child: child,
            //       );
            //     },
            //     child: GestureDetector(
            //       onVerticalDragUpdate: (data) {
            //         if (data.delta.dy > 10) {
            //           Navigator.pop(context);
            //         }
            //       },
            //       child: Container(
            //         height: MediaQuery.of(context).size.height * 0.45,
            //         width: MediaQuery.of(context).size.width,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(30),
            //         ),
            //         child: Column(
            //           children: [
            //             Container(
            //               margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
            //               width: MediaQuery.of(context).size.width * 0.12,
            //               height: 7,
            //               decoration: BoxDecoration(
            //                 color: Colors.grey.withOpacity(0.5),
            //                 borderRadius: BorderRadius.circular(30),
            //               ),
            //             ),
            //             SizedBox(
            //               height: 20,
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Text(
            //                   'Photos',
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 Text(
            //                   'Likes',
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     // fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 Text(
            //                   'Collections',
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     // fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Expanded(
            //               child: ListView.builder(
            //                   scrollDirection: Axis.horizontal,
            //                   itemCount: imageList.length,
            //                   itemBuilder: (context, position) {
            //                     return Container(
            //                       padding: EdgeInsets.fromLTRB(40, 40, 10, 40),
            //                       child: ClipRRect(
            //                         borderRadius: BorderRadius.circular(30),
            //                         child: Image.asset(
            //                           imageList[position],
            //                           fit: BoxFit.fill,
            //                           width: MediaQuery.of(context).size.width *
            //                               0.6,
            //                           height:
            //                               MediaQuery.of(context).size.height *
            //                                   0.3,
            //                         ),
            //                       ),
            //                     );
            //                   }),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
