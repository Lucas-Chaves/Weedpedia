import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/utils.dart';
import '../cubit/cubit.dart';
import '../models/models.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Marijuana mari = Marijuana(
      id: 1,
      name: "Prensado",
      flavors: ["chocolate"],
      medical: ["Panca"],
      negative: ["Teto Preto"],
      positive: ["Acalma"],
      race: "Hybrida");

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text("Weeds"),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
          cubit: homeCubit,
          builder: (BuildContext context, HomeStates state) {
            if (state is HomeInitialState) {
              homeCubit.getAllStraint();
              return Container();
            }
            if (state is HomeLoadingState) {
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}

// Container(
//           padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//           child: ListTile(
//             title: Text('${mari.name}'),
//             subtitle: Text('${mari.race}'),
//             trailing: IconButton(
//               icon: Icon(Icons.arrow_forward_ios_sharp),
//               onPressed: () {},
//             ),
//           ),
//           alignment: Alignment.topCenter,
//         ),
