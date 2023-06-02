import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: Colors.black,
      height: size.height,
    );
  }
}
