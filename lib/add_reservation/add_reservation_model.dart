import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddReservationModel extends ChangeNotifier {
  DateTime checkInDate = ;
  DateTime checkOutDate = ;
  String? numberOfGuests;


  Future addReservation() async {
    // Firestoreに追加
    await FirebaseFirestore.instance.collection('reservation').add({
      'checkIn': checkInDate,
      'checkOut': checkOutDate,
      'numberOfGuests': numberOfGuests,
    });
  }
}