class DownloadModel {
  int? id; // Jadikan nullable dengan menambahkan '?'
  String title;
  String description;

  DownloadModel({this.id, required this.title, required this.description});

  // Convert a DownloadModel into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Create a DownloadModel from a Map. The keys must correspond to the names of the columns in the database.
  factory DownloadModel.fromMap(Map<String, dynamic> map) {
    return DownloadModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
}
