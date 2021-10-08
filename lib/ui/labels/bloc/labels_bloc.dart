import 'package:eat_ziffy_task/ui/categories/data/api/categories_api.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_state.dart';
import 'package:eat_ziffy_task/ui/labels/bloc/labels_event.dart';
import 'package:eat_ziffy_task/ui/labels/data/api/label_api.dart';
import 'package:eat_ziffy_task/ui/labels/data/model/label_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LabelBloc extends Bloc<LabelEvent, LabelState> {
  LabelApi respiratory;
  LabelBloc({this.respiratory}) : super(null);

  @override
  Stream<LabelState> mapEventToState(LabelEvent event) async* {
    if (event is FetchLabelData) {
      yield LoadingLabelState();
      try {
        List<LabelModel> dataLoaded =
            await respiratory.getLabelApiData(event.categoryId);
        yield LoadedLabelState(data: dataLoaded);
      } catch (e) {
        yield ErrorLabelState(errorMessage: e.toString());
      }
    }
  }
}
