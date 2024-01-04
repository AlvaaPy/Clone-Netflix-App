import 'package:flutter/material.dart';
import 'vidioplay.dart';
import 'downloadpage.dart';
import 'mylist.dart';
import 'info.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final TextStyle topMenuStyle = TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w600);
  final TextStyle buttonInfoStyle = TextStyle(
      fontFamily: 'Avenir next',
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.w600);

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 430,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/Img/starwars1.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            child: Image(
                              image: AssetImage("Assets/Img/netflix.png"),
                            ),
                          ),
                          ElevatedButton(
                            child: Text('Series', style: topMenuStyle),
                            onPressed: () {
                              // Add your logic here
                            },
                          ),
                          ElevatedButton(
                            child: Text('Films', style: topMenuStyle),
                            onPressed: () {
                              // Add your logic here
                            },
                          ),
                          ElevatedButton(
                            child: Text('My List', style: topMenuStyle),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DownloadPage(),
                                ),
                              );
                              // Add your logic here
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.white, size: 30),
                          Text('My List', style: buttonInfoStyle),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color(0xff4f4f4f), // Set the background color here
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyListPage()),
                        );
                        // Add your logic here
                      },
                    ),
                    ElevatedButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          Text("Play", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Set the background color here
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NetflixLikeApp(),
                          ),
                        );
                        // Add your logic here
                      },
                    ),
                    ElevatedButton(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.info, color: Colors.white, size: 30),
                          Text('Info', style: buttonInfoStyle),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color(0xff4f4f4f), // Set the background color here
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Info(),
                          ),
                        );
                        // Add your logic here
                      },
                    )
                  ],
                ),
              ),
              makePopularWidget("Popular on Netflix"),
              makePopularWidget("Trending Now"),
              makeContinueWatching("Continue Watching for Kalle"),
              bannerMovie(),
              makeNetflixOrig('NETFLIX ORIGINALS >'),
              makePopularWidget("Watch It Again"),
              makePopularWidget("New Releases"),
              makePopularWidget("US Crime TV Programmes"),
              makePopularWidget("American Programmes"),
              makePopularWidget("Comedies"),
              makePopularWidget("Romance Programmes"),
              makePopularWidget("US Dysfunctional-family TV Programmes"),
              makePopularWidget("European Films & Programmes"),
              makePopularWidget("US Teen TV Programmes"),
              makePopularWidget("Top Picks For Kalle"),
              makePopularWidget("Documentaries"),
              makePopularWidget("US TV Drama"),
              makePopularWidget("Emotional Crime TV Programmes"),
              makePopularWidget("Ensemble TV Programmes"),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerMovie() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Available Now', style: topMenuStyle),
          ),
          Container(
            child: Image(
              image: AssetImage("Assets/Img/birdboxBanner.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.play_arrow, color: Colors.black),
                        Text('Play', style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Set the background color here
                  ),
                  onPressed: () {
                    // Add your logic here
                  },
                ),
                ElevatedButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white),
                        Text('My List', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4f4f4f), // Set the background color here
                  ),
                  onPressed: () {
                    // Add your logic here
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget makeNetflixOrig(String title) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 10),
      height: 400,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(title, style: topMenuStyle),
              ],
            ),
          ),
          Container(
            height: 350,
            child: ListView(
              padding: EdgeInsets.only(right: 6),
              scrollDirection: Axis.horizontal,
              children: makeOriginals(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> makeOriginals() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(
        Container(
          margin: EdgeInsets.only(right: 10, top: 10),
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Img/" + counter.toString() + ".jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      );
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  Widget makePopularWidget(String title) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(title, style: topMenuStyle),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              children: makeContainers(),
            ),
          )
        ],
      ),
    );
  }

  Widget makeContinueWatching(String title) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(title, style: topMenuStyle),
              ],
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(3),
              scrollDirection: Axis.horizontal,
              children: makeContinueContainers(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> makeContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(
        Container(
          padding: EdgeInsets.all(5),
          height: 200,
          child: Image(
            image: AssetImage("Assets/Img/" + counter.toString() + ".jpg"),
          ),
        ),
      );
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }

  List<Widget> makeContinueContainers() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(
        Container(
          padding: EdgeInsets.all(2),
          height: 200,
          child: Column(
            children: <Widget>[
              Container(
                height: 140,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("Assets/Img/" + counter.toString() + ".jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(
                    child: Icon(Icons.play_circle_outline, size: 70),
                    onPressed: () {
                      // Add your logic here
                    },
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.only(left: 10, right: 10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 25),
                      child: Text('S1:E' + i.toString(),
                          style: TextStyle(color: Color(0xffc1c1c1))),
                    ),
                    Icon(Icons.info, size: 15, color: Color(0xffc1c1c1))
                  ],
                ),
              )
            ],
          ),
        ),
      );
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }
}
