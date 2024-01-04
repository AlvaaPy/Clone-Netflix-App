class MovieModel {
  int? id; // Change 'int' to 'int?' to allow null

  String title;
  String director;

  MovieModel({
    this.id,
    required this.title,
    required this.director,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'director': director,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      director: map['director'],
    );
  }
}
