import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blocs/repository/user_repository.dart';
import 'package:flutter_blocs/ui/custom_widget/customConfig.dart';

part 'userreg_event.dart';
part 'userreg_state.dart';

class UserregBloc extends Bloc<UserregEvent, UserregState> {
  UserRepository userRepository;
  UserregBloc({this.userRepository});

  @override
  UserregState get initialState => UserregInitial();

  @override
  Stream<UserregState> mapEventToState(
    UserregEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      yield UserRegLoading();
      try {
        if (event.userName != null && event.userName.length > 2) {
          if (event.email.contains("@") &&
              event.email.contains(".") &&
              event.email != null) {
            if (event.password != null && event.password.length > 5) {
              var user = await userRepository.signUpUserWithEmailPass(
                  event.email, event.password);
              if (user != null) {
                UserUpdateInfo updateInfo = UserUpdateInfo();
                updateInfo.displayName = event.userName;
                await user.updateProfile(updateInfo);
                await user.reload();
                var userSend = await userRepository.getCurrentUser();
                print('USERNAME IS: ${userSend.displayName}');
                yield UserRegSuccessful(userSend, userRepository);
              } else {
                yield UserRegFailure(
                    message: "Đăng nhập thất bại. Vui lòng kiểm tra lại!");
              }
            } else {
              yield UserRegFailure(message: "Mật khẩu phải lớn hơn 5 ký tự");
            }
          } else {
            yield UserRegFailure(message: "Email không hợp lệ!");
          }
        } else {
          yield UserRegFailure(
              message: "Tên người dùng phải có ít nhất 2 kí tự");
        }
      } catch (e) {
        yield UserRegFailure(message: e.toString());
      }
    }
    yield UserregInitial();
  }
}
