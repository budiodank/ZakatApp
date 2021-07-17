import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakat/model/content_news.dart';
import 'package:zakat/model/content_menu.dart';
import 'package:zakat/detail_screen.dart';
import 'package:zakat/detail_menu.dart';


class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;

    ContentMenu contentMenu;

    return Scaffold(
      body:
      SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF43A047),
                      Color(0xFF1B5E20),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                      },
                      child: SvgPicture.asset("images/menu.svg"),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: (offset < 0) ? 0 : offset,
                            child: SvgPicture.asset(
                              "images/dr_corona.svg",
                              width: 230,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          Positioned(
                            top: 20 - offset / 2,
                            left: 150,
                            child: Text(
                              "${'Bayar Zakat'} \n${'Di Sini Aja!'}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ).copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(), // I don't know why it can't work without container
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //child : Row(
              //padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*
                        ListView.builder(
                          //scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final ContentMenu contentMenu = contentMenuList[index];
                            return new GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return DetailMenu(content: contentMenu);
                                  }));
                                },
                                child: SizedBox(
                                  width: (55 / 812.0) * screenHeight,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all((5 / 375.0) * screenWidth),
                                        height: (55 / 812.0) * screenHeight,
                                        width: (55 / 375.0) * screenWidth,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFECDF),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset(contentMenu.images),
                                      ),
                                      SizedBox(height: 5),
                                      Text(contentMenu.name, textAlign: TextAlign.center)
                                    ],
                                  ),
                                ),
                            );
                          },
                          itemCount: contentNewsList.length,
                        ),*/
                  GestureDetector(
                    onTap: () {
                      contentMenu = contentMenuList[0];
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailMenu(content: contentMenu);
                      }));
                    },
                    child: SizedBox(
                      width: (55 / 812.0) * screenHeight,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all((5 / 375.0) * screenWidth),
                            height: (55 / 812.0) * screenHeight,
                            width: (55 / 375.0) * screenWidth,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFECDF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset("images/donation.svg"),
                          ),
                          SizedBox(height: 5),
                          Text("Zakat Fitrah", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      contentMenu = contentMenuList[1];
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailMenu(content: contentMenu);
                      }));
                    },
                    child: SizedBox(
                      width: (55 / 812.0) * screenHeight,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all((5 / 375.0) * screenWidth),
                            height: (55 / 812.0) * screenHeight,
                            width: (55 / 375.0) * screenWidth,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFECDF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset("images/help.svg"),
                          ),
                          SizedBox(height: 5),
                          Text("Zakat Maal", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      contentMenu = contentMenuList[2];
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailMenu(content: contentMenu);
                      }));
                    },
                    child: SizedBox(
                      width: (55 / 812.0) * screenHeight,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all((5 / 375.0) * screenWidth),
                            height: (55 / 812.0) * screenHeight,
                            width: (55 / 375.0) * screenWidth,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFECDF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset("images/food.svg"),
                          ),
                          SizedBox(height: 5),
                          Text("Fidyah", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      contentMenu = contentMenuList[3];
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailMenu(content: contentMenu);
                      }));
                    },
                    child: SizedBox(
                      width: (55 / 812.0) * screenHeight,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all((5 / 375.0) * screenWidth),
                            height: (55 / 812.0) * screenHeight,
                            width: (55 / 375.0) * screenWidth,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFECDF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset("images/charity.svg"),
                          ),
                          SizedBox(height: 5),
                          Text("Infaq", textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //),
            Container(
              child:
              Column(
                children: [
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: (20 / 375.0) * screenWidth),
                      child: Text(
                        "News",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final ContentNews content = contentNewsList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailScreen(content: content);
                          }));
                        },
                        child:
                        new Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              Image.asset(content.imageAsset),
                              ListTile(
                                leading: Icon(Icons.arrow_drop_down_circle),
                                title: Text(content.title),
                                subtitle: Text(
                                  content.category,
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  content.content,
                                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: contentNewsList.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}