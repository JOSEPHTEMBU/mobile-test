import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth;

  AuthenticationBloc(this._firebaseAuth) : super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      emit(Authenticated(user: user));
    } else {
      emit(Unauthenticated());
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(Authenticated(user: _firebaseAuth.currentUser!));
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    await _firebaseAuth.signOut();
    emit(Unauthenticated());
  }
}
