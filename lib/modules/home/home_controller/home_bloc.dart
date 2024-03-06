import 'package:bloc/bloc.dart';
import 'package:taylor_app/utils/base_state.dart';
import 'home_event.dart';
import 'home_repository.dart';

class HomeBloc extends Bloc<HomeEvent,BaseState>{
  final HomeRepository _repository = const HomeRepository();
  HomeBloc({required BaseState initialState}) : super(initialState){
    on <GetHomePageDetails>(_onGetHomePageDetails);
  }

  Future<void> _onGetHomePageDetails(GetHomePageDetails event ,Emitter<BaseState>emit) async {
    emit (Loading());
    try {
      final response = await _repository.getHomePageDetails(event.num) ;
      if(response.results!=null && response.results!.length>0){
        emit (DataLoaded(event: "GetHomePageDetails",data: response));
      }else{
        emit (DataLoaded(event: "GetHomePageDetails",data: null));
      }

    } catch (error) {
      emit (BaseError(error.toString()));

    }
  }
}