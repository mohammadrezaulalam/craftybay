class Urls {
  //static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSliders = '$_baseUrl/ListProductSlider';
  static String getCategories = '$_baseUrl/CategoryList';
  static String getProductsByRemark(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static String getProductsByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static const String getCartList = '$_baseUrl/CartList';
  static String removeFromCart(int id) => '$_baseUrl/DeleteCartList/$id';
  static const String createInvoice = '$_baseUrl/InvoiceCreate';
  static const String createProfile = '$_baseUrl/CreateProfile';
  static const String readProfile = '$_baseUrl/ReadProfile';
  static const String productWishList = '$_baseUrl/ProductWishList';
  static String createWishList(int id) => '$_baseUrl/CreateWishList/$id';
  static String removeWishList(int id) => '$_baseUrl/RemoveWishList/$id';
  static String productReviewList(int id) => '$_baseUrl/ListReviewByProduct/$id';
  static const String createProductReview = '$_baseUrl/CreateProductReview';
  static const String logOut = '$_baseUrl/logout';


}