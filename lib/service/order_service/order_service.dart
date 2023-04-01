import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      "owner_id": FirebaseAuth.instance.currentUser!.uid,
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
        .where("owner_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    var tableDocId = snapshot.docs.first.id;

    await FirebaseFirestore.instance
        .collection("tables")
        .doc(tableDocId)
        .update({
      "status": "Used",
    });
  }

  setOrderToPaid({
    required String orderId,
    required String tableNumber,
  }) async {
    await FirebaseFirestore.instance.collection("orders").doc(orderId).update({
      "status": "Paid",
    });

    var snapshot = await FirebaseFirestore.instance
        .collection("tables")
        .where("table_number", isEqualTo: tableNumber)
        .where("owner_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    var tableDocId = snapshot.docs.first.id;
    await FirebaseFirestore.instance
        .collection("tables")
        .doc(tableDocId)
        .update({
      "status": "Available",
    });
  }
}
