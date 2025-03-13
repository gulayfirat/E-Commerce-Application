import '../../model/cartModel/cartProductModel/cart_product_model.dart';
import '../../model/cartModel/cart_model.dart';

class DummyCartList {
  final List<CartModel> dummyCarts = [
    CartModel(
        id: 19,
        total: 55,
        discountedTotal: 55,
        userId: 5,
        totalProducts: 2,
        totalQuantity: 14,
        products: [
          CartProductModel(
              id: 144,
              title: "Cricket Helmet",
              price: 44.99,
              quantity: 1,
              total: 179.96,
              discountPercentage: 11.47,
              discountedTotal: 159.32,
              thumbnail:
                  "https://cdn.dummyjson.com/products/images/sports-accessories/Cricket%20Helmet/thumbnail.png"),
          CartProductModel(
              id: 145,
              title: "Essence Mascara Lash Princess",
              price: 9.99,
              quantity: 1,
              total: 179.96,
              discountPercentage: 7.17,
              discountedTotal: 159.32,
              thumbnail:
                  "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png")
        ])
  ];
}
