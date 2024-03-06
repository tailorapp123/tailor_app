
import 'package:bloc/bloc.dart';
import 'package:taylor_app/modules/auth/auth_controller/auth_event.dart';
import 'package:taylor_app/modules/auth/auth_controller/auth_respository.dart';
import 'package:taylor_app/utils/base_state.dart';

import '../../home/home_controller/home_event.dart';


class AuthBloc extends Bloc<AuthEvent,BaseState>{
  final AuthRepository _repository = const AuthRepository();
  AuthBloc({required BaseState initialState}) : super(initialState){
    // on <GetHomePageDetails>(_onGetHomePageDetails);
  }

  // Future<void> _onGetHomePageDetails(GetHomePageDetails event ,Emitter<BaseState>emit) async {
  //   emit (Loading());
  //   try {
  //     final response = await _repository.getHomePageDetails(event.num) ;
  //     if(response.results!=null && response.results!.length>0){
  //       emit (DataLoaded(event: "GetHomePageDetails",data: response));
  //     }else{
  //       emit (DataLoaded(event: "GetHomePageDetails",data: null));
  //     }
  //
  //   } catch (error) {
  //     emit (BaseError(error.toString()));
  //
  //   }
  // }
}