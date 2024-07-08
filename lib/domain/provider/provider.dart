import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_nayak/domain/models/parking_ticket.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'provider.g.dart';

var currentUser = FirebaseAuth.instance.currentUser;
@riverpod
Future<void> createOfficer(
  CreateOfficerRef ref, {
  String id = "",
  required String batchId,
  required String userId,
  required String officerName,
  required String phoneNo,
  required String location,
}) async {
  final collection =
      FirebaseFirestore.instance.collection('officer').doc(currentUser?.uid);

  print(collection);
  print("This is office provider");
  try {
    await collection.set(
      {
        "batch_id": batchId,
        "name": officerName,
        "userId": userId,
        "phone_no": phoneNo,
        "location": location,
      },
    );
  } catch (e) {
    print("Error is $e");
  }
}



@riverpod
Future<void> createParkingTicket(
  CreateParkingTicketRef ref, {
  String id = "",
  required String numberPlate,
  required String officerId,
  required String phoneNo,
  required DateTime dateTime,
  required String dropLocation,
  required int fine,
}) async {
  final collection = FirebaseFirestore.instance.collection('parking_ticket');
  try {
    await collection.add({
      // "id": id,
      "number_plate": numberPlate,
      "phone_number": phoneNo,
      "time": dateTime,
      "drop_location": dropLocation,
      "officer_id": officerId,
      "fine": fine
    });
  } catch (e) {
    print("Create parking erro $e");
  }
}

final isAuth = StateProvider<bool>((ref) => false);
final isIntro = StateProvider<bool>((ref) => true);
final numberPlate = StateProvider<String>((ref) => "");
final officerName = StateProvider<String>((ref) => "default");

@riverpod
Future<void> updateOfficer(
  UpdateOfficerRef ref, {
  String id = "",
  required String batchId,
  required String userId,
  required String officerName,
  required String phoneNo,
  required String location,
}) async {
  final currentUser = FirebaseAuth.instance.currentUser?.uid;
  final docs = await FirebaseFirestore.instance
      .collection('officer')
      .doc(currentUser)
      .get();

  // if (querySnapshot.docs.isNotEmpty) {
  //   DocumentSnapshot docSnapshot = querySnapshot.docs.first;
  //   var documentId = docSnapshot.id;
  //   print(documentId);
  await FirebaseFirestore.instance.doc(currentUser!).update(
    {
      "batch_id": batchId,
      "name": officerName,
      "userId": userId,
      "phone_no": phoneNo,
      "location": location,
    },
  );
}

// @riverpod
// bool isAuth(IsAuthRef ref, {required bool isAuth}) {
//   return isAuth;
// }
