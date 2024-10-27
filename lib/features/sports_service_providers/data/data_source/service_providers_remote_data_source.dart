//init add_service_provider_to_firebase branch
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firebase_storage_services.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'package:path/path.dart';

abstract class ServiceProvidersRemoteDataSource {
  Future<void> addServiceToFirestore(PlaygroundRequestModel playground);
  Future<List<String>> addImagesToStorage(List<File> images);
  Future<bool> deleteImagesFromStorage(List<File> images);
}

@Injectable(as: ServiceProvidersRemoteDataSource)
class ServiceProvidersRemoteDataSourceImpl
    implements ServiceProvidersRemoteDataSource {
  FirestoreService firestoreServices;
  FirebaseStorageServices storageServies;
  ServiceProvidersRemoteDataSourceImpl(
      {required this.firestoreServices, required this.storageServies});

  @override
  Future<void> addServiceToFirestore(PlaygroundRequestModel playground) async {
    return executeTryAndCatchForDataLayer(() async {
      var collRef = firestoreServices.firestore
          .collection(FirebaseCollections.playgroundsRequests);
      var docRef = collRef.doc();
      playground.playgroundId = docRef.id;
      return await docRef.set(playground.toMap());
    });
  }

  @override
  Future<List<String>> addImagesToStorage(List<File> images) async {
    List<String> imagesUrl = [];

    return executeTryAndCatchForDataLayer(() async {
      for (var image in images) {
        Reference firebaseStorageRef =
            storageServies.storage.ref().child(basename(image.path));

        UploadTask uploadTask = firebaseStorageRef.putFile(image);

        TaskSnapshot taskSnapshot = await uploadTask;

        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        imagesUrl.add(downloadUrl);
      }
      return imagesUrl;
    });
  }

  @override
  Future<bool> deleteImagesFromStorage(List<File> images) async {
    return executeTryAndCatchForDataLayer(() async {
      for (var image in images) {
        Reference firebaseStorageRef =
            storageServies.storage.ref().child(basename(image.path));

        await firebaseStorageRef.delete();
      }
      return true;
    });
  }
}
