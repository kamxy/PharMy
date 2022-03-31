List<T> toModelList<T>(T Function(dynamic) fromJson, dynamic arr) {
  return arr != null ? arr.map<T>((el) => fromJson(el)).toList() : [];
}

bool toBoolConverter(dynamic val) {
  if (val.runtimeType == int) {
    return val == 1 ? true : false;
  }

  return val != null ? val : false;
}
