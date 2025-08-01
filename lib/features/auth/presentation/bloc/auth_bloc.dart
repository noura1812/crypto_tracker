import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/core/helpers/snack_bar_helper.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:crypto_tracker/features/auth/domain/usecases/login_use_case.dart';
import 'package:crypto_tracker/features/auth/domain/usecases/logout_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final CheckAuthUseCase _authUseCase;
  AuthBloc(this._loginUseCase, this._logoutUseCase, this._authUseCase)
    : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_logout);
    on<CheckAuth>(_onCheckAuth);
  }

  _onCheckAuth(AuthEvent event, Emitter<AuthState> emit) async {
    var response = await _authUseCase();
    if (response) {
      emit(LoginSuccess());
    }
  }

  _logout(LogoutEvent event, Emitter<AuthState> emit) async {
    var response = await _logoutUseCase();
    switch (response) {
      case Data():
        emit(LogoutSuccess());
        SnackBarHelper.showSuccessSnackBar(message: 'Loged out successfully');
        break;
      default:
    }
  }

  _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    final result = await _loginUseCase((event.email, event.password));
    switch (result) {
      case Data<void>():
        emit(LoginSuccess());
        SnackBarHelper.showSuccessSnackBar(message: 'Loged in successfully');

        break;
      case Error():
        emit(LoginError());
        break;
      default:
    }
  }
}
