import 'package:eat_ziffy_task/ui/labels/data/model/label_model.dart';
import 'package:equatable/equatable.dart';

abstract class LabelState extends Equatable {}

class LoadingLabelState extends LabelState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadedLabelState extends LabelState {
  List<LabelModel> data;

  LoadedLabelState({this.data});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ErrorLabelState extends LabelState {
  String errorMessage;
  ErrorLabelState({this.errorMessage});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
