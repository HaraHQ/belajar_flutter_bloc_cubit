import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCart {
  dynamic id;
  dynamic name;

  ProductCart({this.id, this.name});
}

class MyBloc extends Cubit<List<ProductCart>> {
  MyBloc() : super([]);

  void addItem(ProductCart item) => emit([...state, item]);
}
