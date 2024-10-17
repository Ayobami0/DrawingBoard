import 'package:board/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

class JoinBoardDialog extends StatefulWidget {
  const JoinBoardDialog({
    super.key,
    required this.platform,
  });

  final kPlatformTypes platform;

  @override
  State<JoinBoardDialog> createState() => _JoinBoardDialogState();
}

class _JoinBoardDialogState extends State<JoinBoardDialog> {
  bool _isLoading = false;
  bool _isValidating = false;
  bool _isValidated = false;
  bool _isError = false;
  String _pinErrorText = '';

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  Future _validateBoardCredentials(String _) async {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _pinErrorText = 'Incorrect pin';
        _isError = true;
      });
      return;
    }

    setState(() {
      _isValidating = true;
    });
    await Future.delayed(
      const Duration(seconds: 3),
    ); // TODO: TO BE REMOVED
    setState(() {
      _isValidating = false;
      _isValidated = true;
    });
  }

  Future _joinBoard() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3)); // TODO: TO BE REMOVED
    setState(() {
      _isLoading = false;
    });
  }

  void _getClipboardText() async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardText = clipboardData?.text;
    if (clipboardText != null) {
      _idController.setText(clipboardText);
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dPinTheme = PinTheme(
      height: widget.platform == kPlatformTypes.mobile ? 35 : 50,
      width: widget.platform == kPlatformTypes.mobile ? 35 : 50,
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return AlertDialog(
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actionsAlignment: widget.platform == kPlatformTypes.mobile
          ? MainAxisAlignment.center
          : null,
      title: const Text('Join a board'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              cursorErrorColor: Colors.redAccent,
              validator: (id) {
                if (id == null || id.isEmpty) {
                  return 'Board ID is required';
                }
                return null;
              },
              controller: _idController,
              decoration: InputDecoration(
                errorStyle: const TextStyle(color: Colors.red, fontSize: 15),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                suffixIcon: IconButton(
                    onPressed: _isValidating ? null : _getClipboardText,
                    icon: _isValidating
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          )
                        : const FaIcon(Icons.content_paste_outlined)),
                hintText: 'Room ID',
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Pinput(
              errorBuilder: (err, pin) => Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(
                    err!,
                    style: const TextStyle(color: Colors.red, fontSize: 15),
                  )),
              errorTextStyle: const TextStyle(color: Colors.red, fontSize: 15),
              errorText: _pinErrorText,
              forceErrorState: _isError,
              controller: _pinController,
              errorPinTheme: dPinTheme.copyDecorationWith(
                border: Border.all(color: Colors.redAccent),
                color: Colors.red[100],
              ),
              defaultPinTheme: dPinTheme,
              length: 5,
              onChanged: (_) {
                if (_isError) {
                  setState(() {
                    _isError = false;
                  });
                }
              },
              onCompleted: _validateBoardCredentials,
            )
          ],
        ),
      ),
      actions: [
        OutlinedButton(
            onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        FilledButton(
          onPressed: !_isValidated ? null : _joinBoard,
          child: _isLoading
              ? const SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : const Text('Join'),
        ),
      ],
    );
  }
}
