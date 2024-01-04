import 'package:flutter/material.dart';
import 'homepage.dart' as Home;
import 'searchpage.dart' as Search;
import 'downloadpage.dart' as Download;
import 'subscribepage.dart' as Subs;

void main() => runApp(Netflix());

class Netflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix ',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: NetflixTabBar(),
    );
  }
}

class NetflixTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Theme(
        data: ThemeData(brightness: Brightness.dark),
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.file_download), text: "Downloads"),
              Tab(icon: Icon(Icons.subscriptions_rounded), text: "Subscribe"),
            ],
            unselectedLabelColor: Color(0xff999999),
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
          body: TabBarView(
            children: [
              Home.HomePage(),
              Search.SearchPage(),
              Download.DownloadPage(),
              Subs.SubscriptionPage(),
            ],
          ),
        ),
      ),
    );
  }
}
