import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:get/get.dart';/
// import 'package:unibook/model/book.dart';
// import 'package:unibook/ui/imageStack.dart';
// import 'package:unibook/ui/widgets/bookCard.dart';
// import 'package:unibook/util/configs.dart';
// import 'package:easy_localization/easy_localization.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  int _current = 0;
  List<String> imgList;
  List<Widget> imageSliders;
  @override
  void initState() {
    imgList = selectedBook.stringImageToList();
    print(imgList);
    imageSliders = imgList
            ?.map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(item,
                                fit: BoxFit.contain, width: 600),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                              ),
                            ),
                          ],
                        )),
                  ),
                ))
            ?.toList() ??
        [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text(selectedBook.name),
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
          // height: MediaQuery.of(context).size.height,
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
              centerTitle: true,
              // titleSpacing: 100,
              automaticallyImplyLeading: false,
              expandedHeight: 252.0,
              backgroundColor: Colors.transparent,
              toolbarHeight: 80,
              // title: CircleAvatar(
              //   child: Icon(
              //     Icons.ac_unit,
              //     color: Colors.blue,
              //   ),
              // ),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius:
                      //       BorderRadius.only(bottomLeft: Radius.circular(2)),
                      // ),
                      // height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(children: [
                Expanded(
                  child: CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ])))),
          SliverToBoxAdapter(
            child: Container(
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 20,
                                        bottom: 10),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: Icon(
                                              catIcons[selectedBook.category]),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          selectedBook.category,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "McLaren"),
                                        ).tr()
                                      ],
                                    )),
                                Expanded(child: Container()),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 5,
                                        )
                                      ],
                                      gradient: LinearGradient(colors: [
                                        Colors.blue[50],
                                        Colors.blue[100]
                                      ]),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Text(
                                    "\$${selectedBook.price}",
                                    style: TextStyle(
                                        color: Colors.red,
                                        shadows: [
                                          Shadow(
                                              color: Colors.red, blurRadius: 2)
                                        ],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(6, 5, 6, 15),
                              child: Text(
                                selectedBook.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(color: Colors.white, blurRadius: 2)
                                    ],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    fontFamily: "McLaren"),
                              ),
                            )
                          ],
                        )),
                    // Container(
                    //     height: 100,
                    //     decoration: BoxDecoration(
                    //         color: Colors.blue,
                    //         borderRadius: BorderRadius.circular(10))),
                    Container(
                      // margin: EdgeInsets.fromLTRB(10  , 0, 10, 0),
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 25),
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              alignment: AlignmentDirectional.topStart,
                              child: ListTile(
                                leading: Icon(Icons.info, color: Colors.black),
                                title: Text(
                                  "Descriptions",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "McLaren",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ).tr(),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 40, right: 40),
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              selectedBook.detail,
                              style: TextStyle(
                                  fontFamily: "McLaren",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(40)),
                      margin: EdgeInsets.only(
                          top: 50, left: 20, right: 20, bottom: 20),
                      padding: EdgeInsets.fromLTRB(40, 16, 40, 20),
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              selectedBook.owner,
                              style: TextStyle(
                                  fontFamily: "McLaren",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    MaterialCommunityIcons.whatsapp,
                                    size: 30,
                                  )),
                              onTap: null,
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              child: CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    Icons.call,
                                    size: 30,
                                  )),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              child: CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    MaterialCommunityIcons.message,
                                    size: 30,
                                  )),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              child: CircleAvatar(
                                  radius: 30,
                                  child: Icon(
                                    MaterialCommunityIcons.telegram,
                                    size: 30,
                                  )),
                            ),
                          ],
                        )
                      ]),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.05),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
                            child: ListTile(
                              leading: Icon(
                                Icons.add_to_photos_sharp,
                                color: Colors.blue,
                              ),
                              title: Text(
                                "Similar Books",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.blue),
                              ).tr(),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, i) => BookCard(
                                    title: "my book name",
                                    price: "8546",
                                    imageURL:
                                        "https://dictionary.cambridge.org/images/thumb/book_noun_001_01679.jpg?version=5.0.115")),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
