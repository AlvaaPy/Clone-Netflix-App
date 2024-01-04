import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/downloadmodel.dart';
import '../model/moviemodel.dart';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = 'users.db';
  static const String tableUsers = 'users';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnEmail = 'email';
  static const String columnPassword = 'password';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $tableUsers (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT,
            $columnEmail TEXT,
            $columnPassword TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert(tableUsers, user);
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tableUsers,
      where: '$columnEmail = ? AND $columnPassword = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? result.first : null;
  }
}

class DownloadDatabaseHelper {
  static const _databaseName = 'download_database.db';
  static const _databaseVersion = 1;

  static const tableDownload = 'download';
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnDescription = 'description';

  DownloadDatabaseHelper._privateConstructor();
  static final DownloadDatabaseHelper instance =
      DownloadDatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableDownload (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT,
        $columnDescription TEXT
      )
    ''');
  }

  Future<int> insert(DownloadModel download) async {
    Database db = await database;
    return await db.insert(tableDownload, download.toMap());
  }

  Future<List<DownloadModel>> getAllDownloads() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableDownload);
    return List.generate(maps.length, (i) {
      return DownloadModel.fromMap(maps[i]);
    });
  }

  Future<int> update(DownloadModel download) async {
    Database db = await database;
    return await db.update(tableDownload, download.toMap(),
        where: '$columnId = ?', whereArgs: [download.id]);
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db
        .delete(tableDownload, where: '$columnId = ?', whereArgs: [id]);
  }
}

class MyListDatabaseHelper {
  static const _databaseName = 'my_list_database.db';
  static const _databaseVersion = 1;

  static const tableMyList = 'my_list';
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnDirector = 'director';

  MyListDatabaseHelper._privateConstructor();
  static final MyListDatabaseHelper instance =
      MyListDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableMyList (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT,
        $columnDirector TEXT
      )
    ''');
  }

  Future<int> insertMovie(MovieModel movie) async {
    Database db = await database;
    return await db.insert(tableMyList, movie.toMap());
  }

  Future<List<MovieModel>> getMyList() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableMyList);
    return List.generate(maps.length, (i) {
      return MovieModel.fromMap(maps[i]);
    });
  }

  Future<int> updateMovie(MovieModel movie) async {
    Database db = await database;

    if (movie.id != null) {
      return await db.update(tableMyList, movie.toMap(),
          where: '$columnId = ?', whereArgs: [movie.id!]);
    } else {
      throw Exception("Cannot update a movie without a valid id");
    }
  }

  Future<int> deleteMovie(int? id) async {
    if (id != null) {
      Database db = await database;
      return await db
          .delete(tableMyList, where: '$columnId = ?', whereArgs: [id]);
    } else {
      throw Exception("Cannot delete a movie without a valid id");
    }
  }
}
