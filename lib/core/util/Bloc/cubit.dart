import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_algoriza/core/util/Bloc/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of(context);
  late Database database;

  //To Create DataBase
  //  -User Sqflite package - path package
  //  -use path pacakge for join
  //  -set name of DataBase (Users)
  //  -Create state AppDataBaseCreatedState
  //Call it when Open App
  void CreatDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'users.db');
    debugPrint('AppDataBaseCreate');
    openAppDataBase(path: path);
    emit(AppDataBaseCreatedState());
  }

  void openAppDataBase({required String path}) async {
    openDatabase(path, version: 1,
        //Call once time when create DataBase
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute('CREATE TABLE UsersTB (id INTEGER PRIMARY KEY, name TEXT)');

      debugPrint('Table Created');
      emit(AppDataBaseTableCreatedState());
    },

        //call every time when open DataBase
        onOpen: (Database db) {
      debugPrint('AppDataBaseOpened');
      database = db;
      GetUserDate();
      emit(AppDataBaseOpenedState());
    });
  }


  TextEditingController UserNameController = new TextEditingController();
  void InsertUserDate() {
    if(SelectedUser.isNotEmpty){
      UpdateUserDate();
      return;
    }

    database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO UsersTB(name) VALUES("${UserNameController.text}")');
    }).then((value) {
      debugPrint('Users Data insert');
      UserNameController.clear();
      GetUserDate();
      emit(AppDataBaseUsersCreatedState());
    });
  }


  List<Map> UsersList = [];
  void GetUserDate() async {
    UsersList = [];
    emit(AppDataBaseLoadingState());
    database.rawQuery('SELECT * FROM UsersTB').then((value) {
      debugPrint('Users Data Fetched');
      UsersList = value;
      debugPrint(UsersList.toString());
      emit(AppDataBaseUsersState());
    });
  }

  Map SelectedUser={};
  void SelecteduserToUpdate({required Map User}){
    SelectedUser=User;
    UserNameController.text=SelectedUser['name'];
    emit(AppSelectedUserState());
  }
  void UpdateUserDate()async {
    database.rawUpdate(
        'UPDATE UsersTB SET name = ? WHERE id = ${SelectedUser['id']}',
        ['${UserNameController.text}']).then((value) {
          SelectedUser={};
          UserNameController.clear();
          debugPrint('Upate User Data');
          GetUserDate();
    });

  }

  void DeleteItem({required int id})async{
    database.rawDelete('DELETE FROM UsersTB WHERE id = ?', ['$id']).then((value) {
      GetUserDate();
      emit(AppDeleteItemState());
    });

  }

  void deleteAll({required Database db}) async {
    database.rawDelete('Delete  from UsersTB').then((value) {
      GetUserDate();
      emit(AppDeleteAllDataBaseState());
    });
  }
}
