import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:work_with_firebase/module_data/repository/repository.dart';
import 'package:work_with_firebase/module_ui/src.dart';
import 'package:work_with_firebase/firebase_options.dart';
import 'package:work_with_firebase/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  final repository = Repository();
  repository.setup();
  runApp(const MyApp());
}
