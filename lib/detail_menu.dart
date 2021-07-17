import 'package:flutter/material.dart';
import 'package:zakat/model/content_menu.dart';

class DetailMenu extends StatelessWidget {
  final ContentMenu content;

  DetailMenu({required this.content});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(content: content);
        } else {
          return DetailMobilePage(content: content);
        }
      },
    );
  }
}


class ZakatFitrah extends StatefulWidget {
  @override
  _ZakatFitrahState createState() => _ZakatFitrahState();
}

class _ZakatFitrahState extends State<ZakatFitrah> {
  var categories = ['Beras','Uang'];

  String categoryValue = 'Uang';

  int money = 35000;
  double rice = 3.5;
  //var nominal = "35000";
  int people = 1;

  int totalPaidMoney = 35000;

  double totalPaidRice = 3.5;

  void nominalCounter(status, categoryValue) {
    setState(() {
      if (categoryValue == "Uang") {
        if (status == "add") {
          money += 1000;
        } else {
          money -= 1000;
        }

        totalPaidMoney = people * money;
      } else {
        if (status == "add") {
          rice += 3.5;
        } else {
          rice -= 3.5;
        }

        totalPaidRice = people * rice;
      }

    });
  }

  void peopleCounter(status, categoryValue) {
    setState(() {

      if (status == "add") {
        people += 1;
      } else {
        people -= 1;
      }

      if (categoryValue == "Uang") {
        totalPaidMoney = people * money;
      } else {
        totalPaidRice = people * rice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: (56 / 812.0) * screenHeight,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.greenAccent,
              backgroundColor: Color(0xFF43A047),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: Text(
              "Hitung",
              style: TextStyle(
                fontSize: (18 / 375.0) * screenWidth,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (100 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Kategori",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              DropdownButton<String>(
                value: categoryValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: (18 / 375.0) * screenWidth,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue){
                  setState(() {
                    categoryValue = newValue!;
                  });
                },
              ),
              Spacer(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (("$categoryValue"=="Uang" ? 100 : 90) / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "$categoryValue",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {nominalCounter("remove","$categoryValue");},
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$categoryValue"=="Uang" ? "$money" : "$rice",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                ),
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {nominalCounter("add","$categoryValue");},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (80 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Muzakki",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {peopleCounter("remove", "$categoryValue");},
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$people",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                ),
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {peopleCounter("add", "$categoryValue");},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFF5F6F9),
          thickness: 3,
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (100 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Total",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),

              Text(
                "$categoryValue"=="Uang" ? "$totalPaidMoney" : "$totalPaidRice",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),

            ],
          ),
        ),
      ],
    );
  }
}


class Fidyah extends StatefulWidget {
  @override
  _FidyahState createState() => _FidyahState();
}

class _FidyahState extends State<Fidyah> {

  var categories = ['Beras','Uang'];

  String categoryValue = 'Uang';

  int money = 15000;
  double rice = 1.5;

  int people = 1;

  int day = 1;

  int totalPaidMoney = 15000;

  double totalPaidRice = 1.5;

  void nominalCounter(status, categoryValue) {
    setState(() {
      if (categoryValue == "Uang") {
        if (status == "add") {
          money += 1000;
        } else {
          money -= 1000;
        }

        totalPaidMoney = people * money * day;
      } else {
        if (status == "add") {
          rice += 0.5;
        } else {
          rice -= 0.5;
        }

        totalPaidRice = people * rice * day;
      }

    });
  }

  void peopleCounter(status, categoryValue) {
    setState(() {

      if (status == "add") {
        people += 1;
      } else {
        people -= 1;
      }

      if (categoryValue == "Uang") {
        totalPaidMoney = people * money * day;
      } else {
        totalPaidRice = people * rice * day;
      }
    });
  }

  void dayCounter(status, categoryValue) {
    setState(() {

      if (status == "add") {
        day += 1;
      } else {
        day -= 1;
      }

      if (categoryValue == "Uang") {
        totalPaidMoney = people * money * day;
      } else {
        totalPaidRice = people * rice * day;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double screenHeight = _mediaQueryData.size.height;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: (56 / 812.0) * screenHeight,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.greenAccent,
              backgroundColor: Color(0xFF43A047),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () {},
            child: Text(
              "Hitung",
              style: TextStyle(
                fontSize: (18 / 375.0) * screenWidth,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (100 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Kategori",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              DropdownButton<String>(
                value: categoryValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: (18 / 375.0) * screenWidth,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue){
                  setState(() {
                    categoryValue = newValue!;
                  });
                },
              ),
              Spacer(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (("$categoryValue"=="Uang" ? 100 : 90) / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "$categoryValue",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {nominalCounter("remove","$categoryValue");},
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$categoryValue"=="Uang" ? "$money" : "$rice",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                ),
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {nominalCounter("add","$categoryValue");},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (80 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Muzakki",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {peopleCounter("remove", "$categoryValue");},
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$people",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                ),
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {peopleCounter("add", "$categoryValue");},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (80 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Hari",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {dayCounter("remove","$categoryValue");},
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$day",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                ),
              ),
              Spacer(),
              SizedBox(
                width: (40 / 375.0) * screenWidth,
                height: (40 / 375.0) * screenWidth,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {dayCounter("add","$categoryValue");},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFF5F6F9),
          thickness: 3,
        ),
        Container(
          margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    width: (100 / 375.0) * screenWidth,
                    child: Container(
                      child: Text(
                        "Total",
                        style: TextStyle(
                          fontSize: (18 / 375.0) * screenWidth,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),

              Text(
                "$categoryValue"=="Uang" ? "$totalPaidMoney" : "$totalPaidRice",
                style: TextStyle(
                  fontSize: (18 / 375.0) * screenWidth,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),

            ],
          ),
        ),
      ],
    );
  }

}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final ContentMenu content;

  const DetailMobilePage({required this.content});


  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*
            SizedBox(
              width: (238 / 375.0) * screenWidth,
              child: AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: content.nameMenu,
                  child: Image.asset(content.imageAsset),
                ),
              ),
            ),
             */
            Stack(
              children: <Widget>[
                Image.asset(content.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
              padding: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: (20 / 375.0) * screenWidth),
                        child: Text(
                          content.nameMenu,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.all((15 / 375.0) * screenWidth),
                          width: (64 / 375.0) * screenWidth,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: FavoriteButton(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: (20 / 375.0) * screenWidth,
                          right: (64 / 375.0) * screenWidth,
                        ),
                        child: Text(
                          content.description,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
              padding: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
                    padding: EdgeInsets.only(top: (20 / 375.0) * screenWidth),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.15,
                        right: screenWidth * 0.15,
                        bottom: (40 / 375.0) * screenWidth,
                        top: (15 / 375.0) * screenWidth,
                      ),
                      child: CalculatorZakat(nameMenu: content.nameMenu),
                    ),
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

class CalculatorZakat extends StatelessWidget {
  final String nameMenu;

  const CalculatorZakat({
    required this.nameMenu,
  });

  @override
  Widget build(BuildContext context) {
    if (nameMenu == "Zakat Fitrah") {
      return ZakatFitrah();
    } else if (nameMenu == "Fidyah") {
      return Fidyah();
    } else {
      return Container();
    }
  }
}

class DetailWebPage extends StatefulWidget {
  final ContentMenu content;

  DetailWebPage({required this.content});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Center(
            child: Container(
              width: screenWidth <= 1200 ? 800 : 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Image.asset(widget.content.imageAsset),
                                Container(
                                  child: Text(
                                    widget.content.nameMenu,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: 'Staatliches',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    widget.content.description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Oxygen',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

