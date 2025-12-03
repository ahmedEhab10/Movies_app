import 'package:flutter/material.dart';

import 'package:movies_app/features/main/profile/widgets/information_container.dart';

class ProfilScreenBody extends StatelessWidget {
  const ProfilScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [information_container()]);
  }
}
