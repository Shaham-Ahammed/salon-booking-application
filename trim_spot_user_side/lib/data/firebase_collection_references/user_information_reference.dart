import 'package:cloud_firestore/cloud_firestore.dart';


final CollectionReference userCollections =
    FirebaseFirestore.instance.collection('user_information');