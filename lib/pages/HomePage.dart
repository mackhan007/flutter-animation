import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/util/Constants.dart';
import 'package:internship/widgets/RowWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageList = [
    Constants.image3,
    Constants.image2,
    Constants.image1,
  ];

  List<String> nameList = [
    'Caleb George',
    'Teemu Paananen',
    'Leonard coette',
    'Macky',
    'test',
    'testing',
  ];

  List<String> imageUrls = [
    "https://media.vanityfair.com/photos/5a73b140b2a509799a078af7/master/w_2560%2Cc_limit/Siobhan-O'connor-Medium.jpg",
    'https://lh3.googleusercontent.com/proxy/QBiAP4EX2FfEdVUXyzC_YPUQIuJha3QtgWUVpA1f_mUkei71sRYEWe_Tgnmr7nvujYpW_A6j_MlxUDgZFCfPEMe9Rj1hyZp6xLuFw29-GfI0KQioyZfO1PSo0fuRDg',
    'https://images.ctfassets.net/1wryd5vd9xez/4DxzhQY7WFsbtTkoYntq23/a4a04701649e92a929010a6a860b66bf/https___cdn-images-1.medium.com_max_2000_1_Y6l_FDhxOI1AhjL56dHh8g.jpeg',
    'https://images.squarespace-cdn.com/content/v1/559b2478e4b05d22b1e75b2d/1549568089409-SJ70E6DVG3XTE70232OL/Nesbit.jpg',
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'https://st3.depositphotos.com/9881890/16378/i/600/depositphotos_163785870-stock-photo-blonde-smiling-businesswoman.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, position) {
                  return RowWidget(
                    imagePath: imageList[position % imageList.length],
                    firstname: nameList[position].split(' ').first,
                    lastname: nameList[position].split(' ').last,
                    userImage: imageUrls[position],
                  );
                }),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text('Platns',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        )),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 28,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
