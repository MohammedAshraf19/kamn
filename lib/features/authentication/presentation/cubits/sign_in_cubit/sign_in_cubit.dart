import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/features/authentication/presentation/cubits/sign_in_cubit/sign_in_view_model.dart';
import '../../../../../core/common/entities/user_model.dart';
import '../../../../../core/helpers/secure_storage_helper.dart';
import '../../../data/repositories/auth_repository.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInViewModel signInViewModel;
  final AuthRepository _authRepository;
  SignInCubit(
      {required AuthRepository authRepository,
      required SignInViewModel signInViewModel})
      : _authRepository = authRepository,
        signInViewModel = signInViewModel,
        super(SignInState(state: SignInStatus.initial));
  //init getPlaygrounds_from_firebase branch

  Future<void> signIn({required String email, required String password}) async {
    final result =
        await _authRepository.signIn(email: email, password: password);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignInStatus.success,
              uid: r,
            )));
  }

  Future<void> getUser({required String uid}) async {
    final result = await _authRepository.getUser(uid: uid);
    result.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failureGetData,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(
              state: SignInStatus.successGetData,
              userModel: r,
            )));
  }

  // Save user data securely

  Future<void> signOut() async {
    final res = await _authRepository.signOut();
    res.fold(
        (l) => emit(state.copyWith(
              state: SignInStatus.failure,
              erorrMessage: l.erorr,
            )),
        (r) => emit(state.copyWith(state: SignInStatus.successSignOut)));
  }

  // Sign out and clear secure storage

  changeVisiblePassword() {
    emit(state.copyWith(
        state: SignInStatus.visible, isVisible: !state.isVisible));
  }

  @override
  Future<void> close() {
    signInViewModel.dispose();
    return super.close();
  }
}