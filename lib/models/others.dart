class Others {
  String? productName;
  String? price;
  String? imageUrl;

  Others(
    this.productName,
    this.price,
    this.imageUrl,
  );
  static List<Others> generatesOthers() {
    return [
      Others(
        'pubg',
        '\$70.1',
        'assets/images/super.jpeg',
      ),
      Others(
        'gucci',
        '\$90.1',
        'assets/images/acc1.jpeg',
      ),
      Others(
        'gucci',
        '\$90.1',
        'assets/images/acc2.jpeg',
      ),
    ];
  }
}
