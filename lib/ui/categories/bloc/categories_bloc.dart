import 'package:eat_ziffy_task/ui/categories/bloc/categories_event.dart';
import 'package:eat_ziffy_task/ui/categories/bloc/categories_state.dart';
import 'package:eat_ziffy_task/ui/categories/data/api/categories_api.dart';
import 'package:eat_ziffy_task/ui/categories/data/model/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesApi respiratory;
  CategoriesBloc({this.respiratory}) : super(null);

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is FetchCategoriesData) {
      yield LoadingState();
      try {
        List<CategoriesModel> dataLoaded =
            await respiratory.getCategoriesApiData();
        yield LoadedState(data: dataLoaded);
      } catch (e) {
        yield ErrorState(errorMessage: e.toString());
      }
    }
  }
}
