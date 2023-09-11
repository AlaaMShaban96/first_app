class Models {
  Map<String, dynamic> fillable = {};
  Models();
  // The fromJson factory constructor
  factory Models.fromJson(Map<String, dynamic> json) {
    final instance = Models();
    json.forEach((key, value) {
      if (instance.fillable.containsKey(key)) {
        instance.fillable[key] = value;
      }
    });
    return instance;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    fillable.forEach((key, value) {
      json[key] = value;
    });
    return json;
  }
}