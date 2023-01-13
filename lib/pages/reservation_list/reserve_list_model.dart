import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample01/domain/reservation.dart';

class ReserveListModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _reserveStream = FirebaseFirestore.instance.collection('reservations').orderBy('checkInDate').snapshots();

  List<Reservation>? reservations;

  void fetchReservationList(){
      _reserveStream.listen((QuerySnapshot snapshot) {
          final List<Reservation> reservations = snapshot.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              final String id = document.id;
              final DateTime checkInDate = data['checkInDate'].toDate();
              final DateTime checkOutDate = data['checkOutDate'].toDate();
              final String numberOfGuests = data['numberOfGuests'];

              return Reservation(id, checkInDate, checkOutDate, numberOfGuests);
          }).toList();

          this.reservations = reservations;
          notifyListeners();
      });
  }

  Future deleteReservation(Reservation reservation){
    return FirebaseFirestore.instance.collection('reservations').doc(reservation.id).delete();
  }
}