import 'dart:math';

import 'package:board/constants.dart';
import 'package:board/home/widgets/create_board_dialog.dart';
import 'package:board/home/widgets/join_board_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _fabAnimation;
  late final Animation<Offset> _miniFABAnimation;
  late final Animation<double> _modalBarrierAnimation;

  bool _isFABActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cBody(),
      floatingActionButton: _cAnimatedFAB(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 120,
        ),
        reverseDuration: const Duration(milliseconds: 100));
    _fabAnimation =
        Tween<double>(begin: 2, end: 4).animate(_animationController);
    _miniFABAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -10))
            .animate(_animationController);
    _modalBarrierAnimation =
        Tween(begin: 0.0, end: .45).animate(_animationController);
  }

  FittedBox _cAnimatedFAB() {
    return FittedBox(
      child: Column(
        children: [
          if (_isFABActive)
            AnimatedBuilder(
                animation: _miniFABAnimation,
                builder: (ctx, cld) => Transform.translate(
                      offset: _miniFABAnimation.value,
                      child: Column(
                        children: [
                          FloatingActionButton.small(
                              tooltip: 'Create a new board',
                              onPressed: _showCreateBoardDialog,
                              child: const FaIcon(Icons.cast_connected_outlined)),
                          const SizedBox(
                            height: 8,
                          ),
                          FloatingActionButton.small(
                              onPressed: _showJoinBoardDialog,
                              tooltip: 'Join a board',
                              child: const FaIcon(
                                  Icons.connect_without_contact_outlined)),
                        ],
                      ),
                    )),
          FloatingActionButton(
            onPressed: () async {
              if (_isFABActive) {
                await _animationController.reverse();
                setState(() {
                  _isFABActive = false;
                });
                return;
              }
              _animationController.forward();
              setState(() {
                _isFABActive = true;
              });
            },
            child: AnimatedBuilder(
              animation: _fabAnimation,
              builder: (ctx, cld) => Transform.rotate(
                  angle: -pi / _fabAnimation.value,
                  child: const FaIcon(Icons.add)),
            ),
          ),
        ],
      ),
    );
  }

  SafeArea _cBody() {
    final size = MediaQuery.sizeOf(context);
    final platform = kScreenSizes.getPlatform(size.width);

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Boards',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Expanded(
                  child: switch (platform) {
                    kPlatformTypes.tablet ||
                    kPlatformTypes.desktop =>
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5),
                        itemCount: 0,
                        itemBuilder: (ctx, idx) => null,
                      ),
                    kPlatformTypes.mobile => ListView.builder(
                        itemBuilder: (ctx, idx) => null,
                        itemCount: 0,
                      ),
                  },
                ),
              ],
            ),
          ),
          if (_isFABActive)
            AnimatedBuilder(
              animation: _modalBarrierAnimation,
              builder: (ctx, cld) => GestureDetector(
                onTap: () async {
                  await _animationController.reverse();
                  setState(() {
                    _isFABActive = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(_modalBarrierAnimation.value),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future _showCreateBoardDialog() async {
    // Revert animation
    await _animationController.reverse();
    setState(() {
      _isFABActive = false;
    });

    if (mounted) {
      final size = MediaQuery.sizeOf(context);
      final platform = kScreenSizes.getPlatform(size.width);

      _showDialog('create', platform);
    }
  }

  Future _showJoinBoardDialog() async {
    await _animationController.reverse();
    setState(() {
      _isFABActive = false;
    });

    if (mounted) {
      final size = MediaQuery.sizeOf(context);
      final platform = kScreenSizes.getPlatform(size.width);

      _showDialog('join', platform);
    }
  }

  Future<Object?> _showDialog(String bLabel, kPlatformTypes platform) {
    return showGeneralDialog(
      barrierLabel: bLabel,
      transitionDuration: const Duration(milliseconds: 250),
      context: context,
      barrierDismissible: true,
      pageBuilder: (ctx, a1, a2) => Container(),
      transitionBuilder: (ctx, a1, a2, child) => ScaleTransition(
        scale: Tween<double>(begin: 0.2, end: 1.0).animate(a1),
        child: switch (bLabel) {
          'create' => CreateBoardDialog(platform: platform),
          'join' => JoinBoardDialog(platform: platform),
          _ => null
        },
      ),
    );
  }
}
