class CategoryModel {
  final int id;
  final String name;
  final List<Map<String, dynamic>> subitem; // Change the type to dynamic

  CategoryModel({
    required this.id,
    required this.name,
    required this.subitem,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      subitem: List<Map<String, dynamic>>.from(json['subitem']),
    );
  }
}
