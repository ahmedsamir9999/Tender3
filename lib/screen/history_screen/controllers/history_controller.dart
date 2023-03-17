import 'package:get/get.dart';
import 'package:tender3/services/services.dart';

import '../../../model/model.dart';

class HistoryController extends GetxController {
  final ser = Services();
  RxList time =[].obs ;

@override
  onInit()
  {
    super.onInit();
    getDataFromFirebase();
  }

  getDataFromFirebase() async
  {
    var firebaseData = await ser.cloudStore
        .collection('products')
        .doc('${ser.auth.currentUser?.uid}')
        .collection('listOfItems').get();

    firebaseData.docs.forEach((element) {
     time.add(ItemModel.fromJson(element.data())) ;
    });
  }

}


//time.add(element.data())
// ItemModel.fromJson(element.data()