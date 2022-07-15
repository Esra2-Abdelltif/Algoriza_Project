import 'package:flutter/foundation.dart';

@immutable
abstract class AppStates
{
  const AppStates();
}


class AppInitialState extends AppStates {}
class AppDataBaseCreatedState extends AppStates {}
class AppDataBaseTableCreatedState extends AppStates {}

class AppDataBaseOpenedState extends AppStates {}

class AppDataBaseUsersCreatedState extends AppStates {}
class AppDataBaseUsersState extends AppStates {}
class AppDataBaseLoadingState extends AppStates {}
class AppSelectedUserState extends AppStates {}
class AppDeleteItemState extends AppStates{}
class AppDeleteAllDataBaseState extends AppStates{}





