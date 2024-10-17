import 'package:flutter/material.dart';

class BoardGridTile extends StatelessWidget {
  const BoardGridTile({super.key});

  Future _deleteBoard() async {}
  Future _showBoardInfo() async {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _showBoardInfo,
      leading: null, // Should be a thumbnail for the board
      title: null, // Board name
      trailing: IconButton(
          tooltip: 'Delete',
          onPressed: _deleteBoard,
          icon: const Icon(Icons.delete_outline)),
    );
  }
}
