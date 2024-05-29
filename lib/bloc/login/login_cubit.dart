import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/auth_repo.dart';
part 'login_state.dart';

class RegisterLoginCubit extends Cubit<RegisterLoginState> {
  RegisterLoginCubit() : super(RegisterLoginInitial());
  final _repo = AuthRepo();

  void login({required String email, required String password}) async {
    emit(RegisterLoginLoading());
    try {
      await _repo.login(email: email, password: password);
      emit(RegisterLoginSuccess('Login berhasil!'));
    } catch (e) {
      print(e);
      emit(RegisterLoginFailure(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String nama,
  }) async {
    emit(RegisterLoginLoading());
    try {
      await _repo.register(email: email, password: password, nama: nama);
      emit(RegisterLoginSuccess('Registrasi berhasil!'));
    } catch (e) {
      print(e);
      emit(RegisterLoginFailure(e.toString()));
    }
  }
}
