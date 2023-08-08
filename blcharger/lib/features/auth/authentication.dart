// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:blcharger/core/widgets/widgets.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          //center the button
          padding: const EdgeInsets.only(left: 1, bottom: 8),
          child: ElevatedButton(
            onPressed: () {
              !loggedIn ? context.push('/sign-in') : signOut();
            },
            child: !loggedIn ? const Text('Entrar') : const Text('Sair'),
          ),
        ),
        // Visibility(
        //   visible: loggedIn,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 1, bottom: 8),
        //     child: ElevatedButton(
        //         onPressed: () {
        //           context.push('/profile');
        //         },
        //         child: const Text('Profile')),
        //   ),
        // ),
      ],
    );
  }
}
