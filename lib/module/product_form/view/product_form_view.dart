import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProductFormView extends StatefulWidget {
  final Map? item;
  const ProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QImagePicker(
                        label: "Photo",
                        hint: "Your photo",
                        validator: Validator.required,
                        value: controller.photo,
                        onChanged: (value) {
                          controller.photo = value;
                        },
                      ),
                      QTextField(
                        label: "Product name",
                        validator: Validator.required,
                        value: controller.productName,
                        onChanged: (value) {
                          controller.productName = value;
                        },
                      ),
                      QNumberField(
                        label: "Price",
                        validator: Validator.required,
                        value: controller.price?.toString(),
                        onChanged: (value) {
                          controller.price = double.tryParse(value) ?? 0;
                        },
                      ),
                      QDropdownField(
                        label: "Category",
                        validator: Validator.required,
                        items: const [
                          {
                            "label": "Drink",
                            "value": "Drink",
                          },
                          {
                            "label": "Main Course",
                            "value": "Main Course",
                          },
                          {
                            "label": "Salad",
                            "value": "Salad",
                          },
                          {
                            "label": "Snack",
                            "value": "Snack",
                          }
                        ],
                        value: controller.category,
                        onChanged: (value, label) {
                          controller.category = value;
                        },
                      ),
                      QMemoField(
                        label: "Description",
                        validator: Validator.required,
                        value: controller.description,
                        onChanged: (value) {
                          controller.description = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: () => controller.doSave(),
          child: const Text("Save"),
        ),
      ),
    );
  }

  @override
  State<ProductFormView> createState() => ProductFormController();
}
