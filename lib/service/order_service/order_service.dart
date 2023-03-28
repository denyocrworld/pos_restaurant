import 'package:cloud_firestore/cloud_firestore.dart';

/*
orders
  created_at
  table_number
  items
    ...[]
  total
  payment_method
  status
*/
class OrderService {
  create({
    required String tableNumber,
    required List items,
    required double total,
    required String paymentMethod,
    required String status,
  }) async {
    await FirebaseFirestore.instance.collection("orders").add({
      "created_at": Timestamp.now(),
      "table_number": tableNumber,
      "items": items,
      "total": total,
      "payment_method": paymentMethod,
      "status": status,
    });

    var snapshot = await FirebaseFirestore.instance
        .collection("tables")
        .where("table_number", isEqualTo: tableNumber)
        .get();
    var tableDocId = snapshot.docs.first.id;

    await FirebaseFirestore.instance
        .collection("tables")
        .doc(tableDocId)
        .update({
      "status": "Used",
    });
  }
}
