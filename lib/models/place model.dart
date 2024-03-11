import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Placemodel with ChangeNotifier {
  final String PlaceId,
      PlaceTitle,
      PlaceAddress,
      Ticketforadult,
      TicketforStudent,
      openedat,
      closedat,
      PlaceCategory,
      PlaceDescription,
      PlaceImage;
      Timestamp? createdAt;
  Placemodel({
    required this.PlaceId,
    required this.PlaceAddress,
    required this.PlaceTitle,
    required this.Ticketforadult,
    required this.TicketforStudent,
    required this.closedat,
    required this.openedat,
    required this.PlaceCategory,
    required this.PlaceDescription,
    required this.PlaceImage,
    this.createdAt,
  });

  factory Placemodel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    // data.containsKey("")
    return Placemodel(
      PlaceId: data["PlaceId"], //doc.get(field),
      PlaceTitle: data['PlaceTitle'],
      closedat:data['closedat'] ,
      openedat:data['openedat'] ,
      PlaceAddress: data['PlaceAddress'],
      Ticketforadult: data['Ticketforadult'],
      TicketforStudent:data['TicketforStudent'],
      PlaceCategory: data['PlaceCategory'],
      PlaceDescription: data['PlaceDescription'],
      PlaceImage: data['PlaceImage'],
      createdAt: data['createdAt'],
    );
  }
}