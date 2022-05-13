import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool isLoaded = false;

  Future<void> getRecommendedProductList()async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200) {
      print("recommended Got product");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products!);

      //update() is like setState()
      isLoaded = true;
      update();
    }else {
      print("Fahar");

    }


  }

}
