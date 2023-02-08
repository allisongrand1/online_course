import 'package:get_it/get_it.dart';
import 'package:work_with_firebase/module_data/server/server.dart';

GetIt getIt = GetIt.instance;

class Repository {
  void setup() {
    getIt.registerSingleton<Service>(Service());
  }
}
