import 'package:cleanarchitecture/main.dart';
import 'package:cleanarchitecture/module_data/model/user.dart';
import 'package:cleanarchitecture/module_data/services/user_api.dart';

abstract class Repository {
  setup() {}
}

class UserRepository implements Repository {
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
