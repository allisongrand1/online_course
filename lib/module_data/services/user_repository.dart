import 'package:cleanarchitecture/module_data/model/user.dart';
import 'package:cleanarchitecture/module_data/services/user_api.dart';
import 'package:flutter/foundation.dart';

abstract class Repository {
  getInfo() {}
}

class UserRepository implements Repository {
  final UserProvider _userProvider = UserProvider();

  @override
  Future<UserModel> getInfo() {
    return _userProvider.getUsers();
  }
}

class UserModel {
  late List<User> model;

  UserModel(this.model);

  UserModel.fromDomain(List<User> user) {

    this.model=user;
    
  }
  
}
