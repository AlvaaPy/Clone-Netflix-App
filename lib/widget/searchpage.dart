import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              // ... Existing code for HomeView

              // Search button to navigate to the search page
              ElevatedButton(
                child: Text('Search'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> searchResults = [];
  List<String> movieImages = [
    "Assets/Img/1.jpg",
    "Assets/Img/2.jpg",
    "Assets/Img/3.jpg",
    "Assets/Img/4.jpg",
    "Assets/Img/5.jpg",
    "Assets/Img/6.jpg",
    "Assets/Img/7.jpg",
    "Assets/Img/8.jpg",
    "Assets/Img/9.jpg",
  ]; // Replace with your image assets

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search on Netflix',
          ),
          onChanged: (value) {
            setState(() {
              searchResults = _getSampleData()
                  .where((item) => item.contains(value))
                  .toList();
            });
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Search Results'),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: searchResults.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(searchResults[index]),
            //         onTap: () {
            //           // Implement navigation logic
            //         },
            //       );
            //     },
            //   ),
            // ),
            SizedBox(height: 20),
            Text(
              'Featured Movies',
              style: TextStyle(
                fontFamily: 'Avenir next',
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 400,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: movieImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(movieImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getSampleData() {
    return [
      'Dinner for Schmucks',
      'Movie 2',
      'TV Show 1',
      'TV Show 2',
      // Add more sample data
    ];
  }
}
