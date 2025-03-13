enum ServicePath {
  register('users'),
  login('auth/login'),
  products('products'),
  categories('products/category-list'),
  productsCategory('products/category/'),
  searchProduct('products/search?q='),
  singleProduct('products/'),
  productOnResponse('products'),
  cartsByUser('carts/user/'),
  cartOnResponse('carts'),
  addToCart('carts/add'),
  user('auth/me');

  final String subUrl;
  const ServicePath(this.subUrl);
}
