import 'package:hyper_ui/service/product_service/product_service.dart';
import 'package:hyper_ui/service/table_service/table_service.dart';

class DummyService {
  List<Map<String, dynamic>> productList = [
    {
      "id": 1,
      "photo":
          "https://i.ibb.co/pbTMS7W/photo-1595698251540-9af8a785c88d-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Nasi Goreng",
      "price": 25000.0,
      "category": "Makanan",
      "description":
          "Nasi goreng adalah makanan khas Indonesia yang terbuat dari nasi yang digoreng dengan bumbu-bumbu dan biasanya dicampur dengan daging ayam atau udang dan sayuran."
    },
    {
      "id": 2,
      "photo":
          "https://i.ibb.co/nwkk6T4/photo-1613360734521-adef8a377347-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Ayam Bakar",
      "price": 35000.0,
      "category": "Makanan",
      "description":
          "Ayam bakar adalah makanan khas Indonesia yang terbuat dari ayam yang dibakar dengan bumbu-bumbu khas Indonesia, biasanya disajikan dengan nasi dan lalapan."
    },
    {
      "id": 3,
      "photo":
          "https://i.ibb.co/RNvW5yV/photo-1620088676099-c709b5838922-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Sate Ayam",
      "price": 20000.0,
      "category": "Makanan",
      "description":
          "Sate ayam adalah makanan khas Indonesia yang terbuat dari daging ayam yang dipotong kecil-kecil dan ditusuk dengan tusuk sate, kemudian dibakar dan disajikan dengan bumbu kacang."
    },
    {
      "id": 4,
      "photo":
          "https://i.ibb.co/qBSjKC9/photo-1667559773409-6291f0e0c0aa-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Nasi Padang",
      "price": 30000.0,
      "category": "Makanan",
      "description":
          "Nasi padang adalah makanan khas Indonesia yang terdiri dari nasi putih yang disajikan dengan berbagai jenis lauk, seperti rendang, gulai, ayam pop, dan sayuran."
    },
    {
      "id": 5,
      "photo":
          "https://i.ibb.co/2hRWJy5/photo-1543976585-c3249bd2bc0c-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-HNl.jpg",
      "product_name": "Gado-gado",
      "price": 15000.0,
      "category": "Makanan",
      "description":
          "Gado-gado adalah makanan khas Indonesia yang terdiri dari sayuran segar yang dicampur dengan tahu, tempe, dan telur, kemudian disiram dengan saus kacang yang gurih."
    },
    {
      "id": 6,
      "photo":
          "https://i.ibb.co/gRwPRpX/photo-1621118209138-de12f6a48d5e-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Soto Ayam",
      "price": 20000.0,
      "category": "Makanan",
      "description":
          "Soto ayam adalah makanan khas Indonesia yang terbuat dari ayam yang dimasak dengan bumbu-bumbu khas Indonesia, disajikan dengan kuah bening dan pelengkap seperti mie, telur, dan kacang hijau."
    },
    {
      "id": 7,
      "photo":
          "https://i.ibb.co/pbTMS7W/photo-1595698251540-9af8a785c88d-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Nasi Uduk",
      "price": 10000.0,
      "category": "Makanan",
      "description":
          "Nasi uduk adalah makanan khas Indonesia yang terbuat dari nasi yang dimasak dengan santan dan rempah-rempah, disajikan dengan lauk seperti ayam goreng, telur dadar, dan sambal."
    },
    // {
    //   "id": 8,
    //   "photo":
    //       "https://i.ibb.co/BCVcmZc/photo-1526619971180-973e2a5045fb-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    //   "product_name": "Soto Betawi",
    //   "price": 25000.0,
    //   "category": "Makanan",
    //   "description":
    //       "Soto betawi adalah makanan khas Indonesia yang terbuat dari daging sapi yang dimasak dengan bumbu-bumbu khas Indonesia, disajikan dengan kuah santan dan pelengkap seperti kentang, tomat, dan emping."
    // },
    // {
    //   "id": 9,
    //   "photo": "unsplash: Pempek",
    //   "product_name": "Pempek",
    //   "price": 20000.0,
    //   "category": "Makanan",
    //   "description":
    //       "Pempek adalah makanan khas Palembang yang terbuat dari ikan yang digiling halus dan dicampur dengan tepung sagu, kemudian dibentuk dan dikukus atau digoreng, disajikan dengan kuah cuka dan potongan timun."
    // },
    // {
    //   "id": 10,
    //   "photo": "unsplash: Martabak",
    //   "product_name": "Martabak",
    //   "price": 30000.0,
    //   "category": "Makanan",
    //   "description":
    //       "Martabak adalah makanan khas Indonesia yang terbuat dari adonan tepung yang diisi dengan telur, daging cincang, dan sayuran, kemudian dibentuk seperti roti dan digoreng, disajikan dengan saus kacang dan kecap."
    // },
    // {
    //   "id": 11,
    //   "photo": "unsplash: Rendang",
    //   "product_name": "Rendang",
    //   "price": 40000.0,
    //   "category": "Makanan",
    //   "description":
    //       "Rendang adalah makanan khas Indonesia yang terbuat dari daging sapi yang dimasak dengan rempah-rempah khas Indonesia dan santan, sehingga menghasilkan rasa yang gurih dan pedas."
    // },
    // {
    //   "id": 12,
    //   "photo": "unsplash: Es Cendol",
    //   "product_name": "Es Cendol",
    //   "price": 10000.0,
    //   "category": "Minuman",
    //   "description":
    //       "Es cendol adalah minuman khas Indonesia yang terbuat dari tepung beras yang dicampur dengan air pandan, kemudian dipotong kecil-kecil dan disajikan dengan es serut, santan, dan gula merah."
    // }
  ];

  generate() async {
    for (var item in productList) {
      await ProductService().create(
        photo: item["photo"],
        productName: item["product_name"],
        price: item["price"],
        category: item["category"],
        description: item["description"],
      );
    }
  }

  generateTables() async {
    await TableService().deleteAll();
    for (var i = 1; i <= 20; i++) {
      await TableService().create(
        orderIndex: i,
        tableNumber: "$i",
        // orderId: null,
        // status: null,
      );
    }
  }
}
