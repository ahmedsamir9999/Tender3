import 'dart:core';

class ItemModel {
  String? imageUrl;
  String? address;
  String? apartmentNumber;
  String? areaNumber;
  String? date;
  String? landMark;
  String? lat;
  String? lng;
  String? pieces;
  String? states;
  String? time;
  String? userToken;

  ItemModel({
    required this.address,
    required this.apartmentNumber,
    required this.areaNumber,
    required this.date,
    required this.imageUrl,
    required this.landMark,
    required this.lat,
    required this.lng,
    required this.pieces,
    required this.states,
    required this.time,
    required this.userToken,
  });

  toJson() {
    Map<String, dynamic> data = {};

    data['imageUrl'] = imageUrl;
    data['address'] = address;
    data['apartmentNumber'] = apartmentNumber;
    data['areaNumber'] = areaNumber;
    data['date'] = date;
    data['landMark'] = landMark;
    data['lat'] = lat;
    data['lng'] = lng;
    data['pieces'] = pieces;
    data['states'] = states;
    data['time'] = time;
    data['userToken'] = userToken;

    return data;
  }

  ItemModel.fromJson(Map json) {
    imageUrl = json['imageUrl'];
    address = json['address'];
    apartmentNumber = json['apartmentNumber'];
    areaNumber = json['areaNumber'];
    date = json['date'];
    landMark = json['landMark'];
    lat = json['lat'];
    lng = json['lng'];
    pieces = json['pieces'];
    states = json['states'];
    time = json['time'];
    userToken = json['userToken'];
  }
}
