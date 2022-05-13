import 'package:food_delivery/Utilities/app_constants.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response>getRecommendedProductList() async{

    return await apiClient.get(AppConstants.RECOMMENDED_PRODUCT_URI);

  }



}