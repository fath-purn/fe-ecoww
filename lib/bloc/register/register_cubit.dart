import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final _repo = AuthRepo();
  Future<void> register(
      {required String email,
      required String password,
      required String nama}) async {
    emit(RegisterLoading());
    try {
      await _repo.register(email: email, password: password, nama: nama);
      emit(RegisterSuccess('Berhasil!'));
    } catch (e) {
      print({e, 'asdf'});
      emit(RegisterFailure(e.toString()));
    }
  }
}
