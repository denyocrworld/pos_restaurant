import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Badge(
                label: Text(
                  "6",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(MdiIcons.chatQuestion),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Badge(
                label: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const DashboardBannerImage(),
              const SizedBox(
                height: 20.0,
              ),
              Builder(builder: (context) {
                List items = [
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/878/878052.png",
                    "label": "Product",
                    "on_tap": () => Get.to(const ProductListView()),
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/3595/3595455.png",
                    "label": "Table",
                    "on_tap": () => Get.to(const TableListView()),
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/2718/2718224.png",
                    "label": "POS",
                    "on_tap": () => Get.to(const PosTableView()),
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/8060/8060549.png",
                    "label": "Meat",
                    "on_tap": () {},
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/454/454570.png",
                    "label": "Soup",
                    "on_tap": () {},
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/2965/2965567.png",
                    "label": "Dessert",
                    "on_tap": () {},
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/2769/2769608.png",
                    "label": "Drink",
                    "on_tap": () {},
                  },
                  {
                    "icon":
                        "https://cdn-icons-png.flaticon.com/128/1037/1037855.png",
                    "label": "Others",
                    "on_tap": () {},
                  },
                ];

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0,
                    crossAxisCount: 4,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = items[index];
                    return InkWell(
                      onTap: () => item["on_tap"](),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            item["icon"],
                            width: 32.0,
                            height: 32.0,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            item["label"],
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
