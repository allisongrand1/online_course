import 'package:firebase_storage/firebase_storage.dart';
import 'package:work_with_firebase/module_data/error/error_message.dart';
import 'package:work_with_firebase/module_data/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_with_firebase/module_ui/src.dart';

class Service {
  Stream<List<Product>> get data => _getProduct();
  Stream<List<Product>> get productsInCart => _getProductInCart();
  Stream<List<Product>> get productsNotInCart => _getProductNotInCart();
  Stream<User?> get authUsers => _auth.authStateChanges();
  Future<String> get loadPicture => _storage;
  Future<void> get signOut => FirebaseAuth.instance.signOut();

  final _auth = FirebaseAuth.instance;
  late Stream<List<Product>> _db;
  final _storage = FirebaseStorage.instance.ref("фон.png").getDownloadURL();

  Future signIn(String email, String password, GlobalKey<FormState> key) async {
    final isValid = key.currentState!.validate();
    if (!isValid) return;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Exception(e);
    }
  }

  Future signUp(String email, String password, GlobalKey<FormState> key) async {
    final isValid = key.currentState!.validate();
    if (!isValid) return;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);

      ErrorMessage.showSnackBar(e.message);
    }
  }

  _getProduct() {
    _db = FirebaseFirestore.instance
        .collection('products')
        .withConverter(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (Product product, _) => product.toJson())
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
    return _db;
  }

  _getProductInCart() {
    final cart = FirebaseFirestore.instance
        .collection("products")
        .where("inCart", isEqualTo: true)
        .withConverter(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (Product product, _) => product.toJson())
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());

    return cart;
  }

  _getProductNotInCart() {
    final notCart = FirebaseFirestore.instance
        .collection("products")
        .where("inCart", isEqualTo: false)
        .withConverter(
            fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!),
            toFirestore: (Product product, _) => product.toJson())
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());

    return notCart;
  }
}
