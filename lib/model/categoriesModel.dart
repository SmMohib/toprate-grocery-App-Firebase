class CategoryModel {
  CategoryModel(
      {this.name,
      this.img,
      this.price,
      this.imagelist,
      this.offerpercen,
      this.offerprice});
  String? name, img, price, offerprice, offerpercen;
  List<String>? imagelist;
}

List<CategoryModel> categorylist = [
  CategoryModel(
    name: 'Vagitable',
    img: 'images/cat/fruits.png',
    price: '50',
    offerpercen: '20',
  ),CategoryModel(
    name: 'Vagitable',
    img: 'images/cat/grains.png',
    price: '40',
    offerpercen: '30',
  ),CategoryModel(
    name: 'Vagitable',
    img: 'images/cat/nuts.png',
    price: '20',
    offerpercen: '30',
  ),CategoryModel(
    name: 'Vagitable',
    img: 'images/cat/spices.png',
    price: '60',
    offerpercen: '25',
  ),CategoryModel(
    name: 'Vagitable',
    img: 'images/cat/veg.png',
    price: '50',
    offerpercen: '30',
  ),
];
