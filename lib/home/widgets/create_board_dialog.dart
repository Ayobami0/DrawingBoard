import 'package:board/constants.dart';
import 'package:board/home/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateBoardDialog extends StatefulWidget {
  const CreateBoardDialog({
    super.key,
    required this.platform,
  });

  final kPlatformTypes platform;

  @override
  State<CreateBoardDialog> createState() => _CreateBoardDialogState();
}

class _CreateBoardDialogState extends State<CreateBoardDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _isValidInput = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future _createBoard() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3)); // TODO: TO BE REMOVED
    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
      showSnackBar(context, 'Board created', backgroundColor: Colors.greenAccent, icon: Icons.check_circle_outline_outlined);
    }
  }

  String? _validator(String? s) {
    if (s == null || s.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create a board'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: _controller,
              validator: _validator,
              onChanged: (v) {
                if (v.isNotEmpty) {
                  setState(() {
                    _isValidInput = true;
                  });
                  return;
                }
                setState(() {
                  _isValidInput = false;
                });
              },
              maxLength: 20,
              decoration: const InputDecoration(
                hintText: 'Board name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Attachments'),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(Icons.attachment_outlined))
              ],
            ),
            Container(
              width: widget.platform == kPlatformTypes.mobile
                  ? double.infinity
                  : 400,
              height: widget.platform == kPlatformTypes.mobile ? 110 : 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor.withOpacity(0.3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    Icons.attach_file_outlined,
                    size: widget.platform == kPlatformTypes.mobile ? 30 : 40,
                  ),
                  const Text('Attach a file to this board')
                ],
              ),
            ),
          ],
        ),
      ),
      actionsOverflowButtonSpacing: 10,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actionsAlignment: widget.platform == kPlatformTypes.mobile
          ? MainAxisAlignment.center
          : null,
      actions: [
        OutlinedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: !_isValidInput || _isLoading ? null : _createBoard,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              const Text('Create'),
            ],
          ),
        )
      ],
    );
  }
}
