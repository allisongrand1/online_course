import 'package:cleanarchitecture/module_data/model/user.dart';
import 'package:cleanarchitecture/module_data/services/user_api.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

abstract class Repository {
  setup() {}
}

class UserRepository implements Repository {
  GetIt getIt = GetIt.instance;

  void setup() {
    getIt.registerSingleton<UserProvider>(UserProvider());
    getIt.registerSingleton<UserModel>(UserModel());
  }

}

class UserModel {
  late List<User> model;

  UserModel();

  UserModel.fromDomain(List<User> user) {
    this.model = user;
  }
}
