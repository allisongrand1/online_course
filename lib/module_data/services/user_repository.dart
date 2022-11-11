import 'package:cleanarchitecture/model/user.dart';
import 'package:cleanarchitecture/module_data/services/user_api.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}