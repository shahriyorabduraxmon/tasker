import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_state/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitial());

  adminEmit(state){
    emit(state);
  }
}