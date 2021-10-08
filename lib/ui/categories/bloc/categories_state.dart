import 'package:eat_ziffy_task/ui/categories/data/model/categories_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoriesState extends Equatable {}

class LoadingState extends CategoriesState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadedState extends CategoriesState {
  List<CategoriesModel> data;

  LoadedState({this.data});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ErrorState extends CategoriesState {
  String errorMessage;
  ErrorState({this.errorMessage});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
