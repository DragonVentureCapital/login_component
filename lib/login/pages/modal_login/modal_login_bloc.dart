import 'package:login_component/shared/base_classes/custom_bloc_base.dart';
import 'package:login_component/shared/enums/request-state.dart';

class ModalLoginBloc extends CustomBlocBase {

  loginSetSuccess(){
    stateController.add(RequestState.SUCCESS);
  }
}
