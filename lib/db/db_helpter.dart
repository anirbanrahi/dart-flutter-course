import 'package:dart_flutter_course/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class Dbhelper {
  final String _createTableContact =
      '''create table $contactsTable(
  $contactsColId integer primary key autoincrement,
  $contactsColName text,
  $contactsColMobile text,
  $contactsColEmail text,
  $contactsColAddress text,
  $contactsColWebsite text,
  $contactsColImage text,
  $contactsColCompany text,
  $contactsColDesignation text,
  $contactsColFavorite integer )''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = p.join(root, 'contact.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async{
       await db.execute(_createTableContact);
      },
    );
  }

  Future<int> insert(ContactModel contactmodel) async {
    final db = await _open();
    return db.insert(contactsTable, contactmodel.toMap());
  }

  Future<List<ContactModel>> getAllContacts() async {
    final db = await _open();
    final mapList = await db.query(contactsTable);
    return List.generate(
      mapList.length,
      (index) => ContactModel.fromMap(mapList[index]),
    );
  }

  Future<ContactModel> getContactByID(int id) async {
    final db = await _open();
    final mapList = await db.query(
      contactsTable,
      where: '$contactsColId = ?',
      whereArgs: [id],
    );
    return ContactModel.fromMap(mapList.first);
  }

  Future<int> updateContactField(int id, Map<String, dynamic> map) async {
    final db = await _open();
    return db.update(
      contactsTable,
      map,
      where: '$contactsColId = ?',
      whereArgs: [id],
    );
  }
}
