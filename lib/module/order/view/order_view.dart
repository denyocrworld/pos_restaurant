import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  Widget build(context, OrderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            QCategoryPicker(
              items: const [
                {
                  "label": "Pending",
                  "value": "Pending",
                },
                {
                  "label": "Paid",
                  "value": "Paid",
                },
              ],
              value: "Pending",
              onChanged: (index, label, value, item) {
                controller.updateStatus(value);
              },
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("orders")
                    .where("owner_id",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .where("status", isEqualTo: controller.status)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    padding: EdgeInsets.zero,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      Timestamp createdAt = item["created_at"];
                      DateTime date = createdAt.toDate();
                      String month = DateFormat("MMM").format(date);

                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        date.day.toString().padLeft(2, "0"),
                                        style: const TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        month,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Table: ${item["table_number"]}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(
                                          "Item(s): ${item["items"].length}",
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(
                                          "Payment: ${item["payment_method"]}",
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(
                                          "Status: ${item["status"]}",
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    "${item["total"]}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () =>
                                        controller.updateStatusToPaid(
                                      orderId: item["id"],
                                      tableNumber: item["table_number"],
                                    ),
                                    child: const Text("Set Status to Paid"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<OrderView> createState() => OrderController();
}
