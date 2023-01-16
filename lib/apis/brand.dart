import 'package:tablet/utils/http.dart';

class BrandApi {
  static Future getBrands() async {
    return await Http.dio.get('api/cp/user/brands').then((value) => value.data);
  }

  static Future getLocations(String brandId) async {
    final params = {"status": "active", "brand_id": brandId};
    return await Http.dio
        .get('api/cp/locations', queryParameters: params)
        .then((value) => value.data);
  }
}
