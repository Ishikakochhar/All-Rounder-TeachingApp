import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';

class FaceIDPopup extends StatefulWidget {
  @override
  FaceIDPopupState createState() => FaceIDPopupState();
}

class _FaceIDPopupState extends State<FaceIDPopup> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;
  String _authorized = 'Not Authorized';

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your face to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authorized';
      });
    } on Exception catch (e) {
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - $e';
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }
}
