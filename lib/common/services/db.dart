import 'package:first_project/common/models/widgets/db_notes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  static Database? _database;
  static const String tableNote = 'note';

  DatabaseService._internal();

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    // Get the path to the database
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');

    // Open the database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create the tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE note (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        createdOn TEXT DEFAULT CURRENT_TIMESTAMP,
        updatedOn TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  // CRUD Operations

  // Insert a new user data
  Future<int> insertNote(DbNotesModel note) async {
    final db = await database;
    return await db.insert(tableNote, note.toJson());
  }


  // Retrieve all notes
  Future<List<DbNotesModel>> getNotes({required int limit}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableNote);

    return maps.map((map) => DbNotesModel.fromJson(map)).toList();
  }


  // Get a note by ID
  Future<DbNotesModel?> getNoteById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
    await db.query(tableNote, where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return DbNotesModel.fromJson(maps.first);
    }
    return null;
  }


  // Update a note (auto-update `updatedOn` timestamp)
  Future<int> updateNote( DbNotesModel note) async {
    final db = await database;
    return await db.update(
      tableNote,
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Delete a user data
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      tableNote,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<DbNotesModel>> getNotesList({int limit = 10, int offset = 0}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      columns: ['id', 'title', 'body', 'updatedOn'], // Fetch specific columns
      limit: limit,
      offset: offset,
      orderBy: 'updatedOn DESC',
    );

    return maps.map((note) => DbNotesModel.fromJson(note)).toList();
  }



  // Close the database
  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
  }
}
