import 'package:flutter/material.dart';
import 'package:netflix/database/sqflite.dart';
import '../model/moviemodel.dart';
import 'homepage.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final MyListDatabaseHelper myListDbHelper = MyListDatabaseHelper.instance;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: myListDbHelper.getMyList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('My List is empty.'));
          } else {
            List<MovieModel> myList = snapshot.data!;
            return ListView.builder(
              itemCount: myList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(myList[index].title),
                  subtitle: Text(myList[index].director),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showEditMovieBottomSheet(context, myList[index]);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await myListDbHelper.deleteMovie(myList[index].id);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMovieBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddMovieBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: _buildAddEditMovieForm((movie) async {
            await myListDbHelper.insertMovie(movie);
            setState(() {});
            Navigator.pop(context);
          }),
        ),
      ),
    );
  }

  void _showEditMovieBottomSheet(BuildContext context, MovieModel movie) {
    _titleController.text = movie.title;
    _directorController.text = movie.director;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: _buildAddEditMovieForm((updatedMovie) async {
            await myListDbHelper.updateMovie(updatedMovie);
            setState(() {});
            Navigator.pop(context);
          }),
        ),
      ),
    );
  }

  Widget _buildAddEditMovieForm(Function(MovieModel) onSubmit) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _directorController,
            decoration: InputDecoration(labelText: 'Director'),
          ),
          ElevatedButton(
            onPressed: () {
              final movie = MovieModel(
                title: _titleController.text,
                director: _directorController.text,
              );
              onSubmit(movie);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
