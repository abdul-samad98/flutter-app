import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hyakah/product_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hyakah/secondPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff424242),
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: HomeBody(),
      appBar: AppBar(
        backgroundColor: Color(0xff424242),
        centerTitle: true,
        title: Text(
          'Hyakah',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Icon(Icons.shopping_basket),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: Container(
        width: 300,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey[800],
              width: 300,
              height: 140,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  Image.network(
                      'https://www.hyakah.com/wp-content/uploads/2019/05/%D8%B4%D8%B9%D8%A7%D8%B1-%D8%AD%D9%8A%D8%A7%D9%83%D8%A9-02.png'),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.track_changes,
                color: Colors.grey[800],
              ),
              title: Text('Track Orders'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.grey[800],
              ),
              title: Text('My Account'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.assessment,
                color: Colors.grey[800],
              ),
              title: Text('Account Summary'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.live_help,
                color: Colors.grey[800],
              ),
              title: Text('Customer Service'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[800],
              ),
              title: Text('FAQs'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              color: Colors.grey,
              indent: 15,
              endIndent: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.contact_phone,
                color: Colors.grey[800],
              ),
              title: Text('Contact Us'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

final List<String> imgList = [
  'https://www.hyakah.com/wp-content/uploads/2019/08/color-img.jpg',
  'https://www.hyakah.com/wp-content/uploads/2019/05/casual-1.png',
  'https://www.hyakah.com/wp-content/uploads/2019/08/travel-img.jpg',
];

final themeColor = new Color(0xffccb67a);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          CachedNetworkImage(
            placeholder: (context, url) => Center(
                child: Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                backgroundColor: Color(0xffdcdcdc),
                valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                strokeWidth: 2.0,
              ),
            )),
            imageUrl: i,
            fit: BoxFit.cover,
            width: 1000.0,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CarouselSlider(
                      items: child,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 30.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(
                          imgList,
                          (index, url) {
                            return Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Color(0xffdac284)
                                      : Color(0xff8e8e8e)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height:MediaQuery.of(context).size.width * 0.363,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.hardEdge,
                          elevation: 2.0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Stack(
                                children: <Widget>[
                                  Image.network('https://www.hyakah.com/wp-content/uploads/2019/05/classic-1.png'),
                                  Center(
                                    child: Text(
                              'Colored Abaya',
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 18.0,fontWeight: FontWeight.w800,),
                              textAlign: TextAlign.center,
                            ),
                                  )
                                ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Stack(
                                children: <Widget>[
                                  Image.network('https://www.hyakah.com/wp-content/uploads/2019/05/party-wear.png'),
                                  Center(
                                    child: Text(
                              'Abayat Al Nawaim',
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 18.0,fontWeight: FontWeight.w800,),
                              textAlign: TextAlign.center,
                            ),
                                  )
                                ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Stack(
                                children: <Widget>[
                                  Image.network('https://www.hyakah.com/wp-content/uploads/2019/08/color-img.jpg'),
                                  Center(
                                    child: Text(
                              'Abayat Al Nawaim',
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 18.0,fontWeight: FontWeight.w800,),
                              textAlign: TextAlign.center,
                            ),
                                  )
                                ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Stack(
                                children: <Widget>[
                                  Image.network('https://www.hyakah.com/wp-content/uploads/2019/05/party-wear.png'),
                                  Center(
                                    child: Text(
                              'Abayat Al Nawaim',
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 18.0,fontWeight: FontWeight.w800,),
                              textAlign: TextAlign.center,
                            ),
                                  )
                                ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 50,
                            ),
                            Positioned(
                              top: 25.0,
                              right: 1.0,
                              child: Container(
                                height: 2.0,
                                width: 1000.0,
                                color: Color(0xffd9bf8f),
                              ),
                            ),
                            Positioned(
                              top: 22.0,
                              right: 1.5,
                              child: Transform.rotate(
                                angle: 48,
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  color: Color(0xffd9bf8f),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('New Arrivals',
                            style: TextStyle(fontSize: 20.0)),
                      ),
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 50,
                            ),
                            Positioned(
                              top: 25.0,
                              left: 1.0,
                              child: Container(
                                height: 2.0,
                                width: 1000.0,
                                color: Color(0xffd9bf8f),
                              ),
                            ),
                            Positioned(
                              top: 22.0,
                              left: 1.5,
                              child: Transform.rotate(
                                angle: 48,
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  color: Color(0xffd9bf8f),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          childCount: 1,
        )),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CardsTab();
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

class CardsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDet()),
              );
            },
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          height: 124.0,
                          child: Center(
                              child: Container(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              backgroundColor: Color(0xffdcdcdc),
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(themeColor),
                              strokeWidth: 2.0,
                            ),
                          )),
                        ),
                        imageUrl:
                            'https://www.hyakah.com/wp-content/uploads/2019/09/IMG_0590.jpg',
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      left: 0.0,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 66, 66, 66),
                              Color.fromARGB(150, 66, 66, 66),
                              Color.fromARGB(0, 66, 66, 66)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'A modern abaya with gold embroidered  sides',
                              style: TextStyle(
                                  color: Color(0xffd9bf8f), fontSize: 12.0),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Text('S.R 280.00',
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
