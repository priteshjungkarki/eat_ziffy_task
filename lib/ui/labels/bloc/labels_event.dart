import 'package:equatable/equatable.dart';

abstract class LabelEvent extends Equatable {}

class FetchLabelData extends LabelEvent {
  int categoryId;
  FetchLabelData({this.categoryId});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
