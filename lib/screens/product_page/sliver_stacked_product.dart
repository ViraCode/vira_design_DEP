import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliverStackedProduct extends StatefulWidget {
  static const String route = "/product_page/sliver_stacked_product";
  static const String name = "Sliver Stacked Product";
  @override
  _SliverStackedProductState createState() => _SliverStackedProductState();
}

class _SliverStackedProductState extends State<SliverStackedProduct> {
  int _current = 0;
  List<String> imgList;
  @override
  void initState() {
    imgList = [
      'https://cdn.luxe.digital/media/2019/09/12085003/casual-dress-code-men-style-summer-luxe-digital.jpg',
      'https://raw.githubusercontent.com/SajadAbdr/vira_design/master/online_assets/587277-515x515-1.jpg',
      'https://raw.githubusercontent.com/SajadAbdr/vira_design/master/online_assets/food-product-png-1.png'
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Container(
          height: MediaQuery.of(context).size.height * 3,
          child: Stack(
            children: [
              Positioned(
                left: 20,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              SizedBox(
                child: Container(
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Container(
                      child: CarouselSlider(
                        items: imgList
                                ?.map((item) => Container(
                                      child: Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: Image.network(item,
                                              fit: BoxFit.fitWidth,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width),
                                        ),
                                      ),
                                    ))
                                ?.toList() ??
                            [],
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height / 2,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            aspectRatio: MediaQuery.of(context).size.height /
                                MediaQuery.of(context).size.width,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ]),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.45,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 2,
                ),
              ),
            ],
          ),
        ))
      ],
    ));
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final String price;
  final String offPrice;
  final List<Map<String, dynamic>>
      categories; // [{"text": "String", "iconData": IconData}]
  final String imageURL;
  MyCard(
      {this.title, this.price, this.imageURL, this.categories, this.offPrice});

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1))),
        child: Container(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.02,
                  height: 150,
                  child: Card(
                      child: Image.network(
                    imageURL,
                    // fit: BoxFit.fill,
                  )),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Text(
                          "$title",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 28,
                            fontFamily: 'Oswald',
                          ),
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    offPrice.isNotEmpty
                        ? Text("\n$offPrice",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decorationStyle: TextDecorationStyle.wavy,
                              decorationThickness: 5,
                              decorationColor: Colors.black,
                              fontSize: MediaQuery.of(context).size.width / 27,
                            ))
                        : null,
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          price,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 30,
                              fontFamily: 'Oswald',
                              color: Colors.white,
                              decoration: offPrice == null
                                  ? null
                                  : TextDecoration.lineThrough),
                        ),
                      ),
                    ),
                  ],
                ),
                Wrap(alignment: WrapAlignment.center, spacing: 4, children: [
                  for (int i = 0; i < categories.length; i++)
                    Chip(
                      backgroundColor: Colors.green,
                      label: Text(
                        categories[i]["text"],
                        style: TextStyle(color: Colors.white),
                      ),
                      avatar:
                          Icon(categories[i]["iconData"], color: Colors.white),
                    ),
                ]),
              ],
            ),
          ),
        )));
  }
}
