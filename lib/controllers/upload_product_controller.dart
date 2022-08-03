import 'dart:io';

import 'package:efotballactseller_app/const.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class UploadProductController {
  _uploadImageToStorage(File? imageUrl) async {
    final productId = uuid.v4();
    Reference ref = firebaseStorage.ref().child('products').child(productId);
    UploadTask uploadTask = ref.putFile(imageUrl!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  var uuid = Uuid();
  Future<String> uploadProducts(String title, String id, var price,
      String category, String description, File? imageUrl) async {
    String res = 'Something happend';
    try {
      final productId = uuid.v4();
      if (title.isNotEmpty &&
          price.isNotEmpty &&
          category.isNotEmpty &&
          description.isNotEmpty &&
          imageUrl != null) {
        String downloadUrl = await _uploadImageToStorage(imageUrl);
        await firebaseStore.collection('products').doc(productId).set({
          'title': title,
          'id': id,
          'price': price,
          'category': category,
          'description': description,
          'imageUrl': downloadUrl,
        });
      }
    } catch (e) {}
    return res;
  }
}
