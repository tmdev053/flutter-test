import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationFormModel extends ChangeNotifier {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  String? numberOfGuests;

  void checkReservation() {
    // バリデーションチェック
    if(checkInDate == null){
      throw 'チェックインの日程が入力されていません';
    }
    if(checkOutDate == null){
      throw 'チェックアウトの日程が入力されていません';
    }
    if(numberOfGuests == null || numberOfGuests!.isEmpty){
      throw '利用人数が入力されていません';
    }
  }

}