import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maripedia/views/view.dart';

import '../utils/utils.dart';
import '../cubit/cubit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeStates>(
        cubit: homeCubit,
        builder: (BuildContext context, HomeStates state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appBarColor,
              centerTitle: true,
              title: Text("Weeds"),
            ),
            body: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              color: Colors.black,
              onRefresh: () {
                return Future.value(
                  homeCubit.getAllStraintRefresh(),
                );
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Builder(
                  builder: (context) {
                    if (state is HomePullRefreshState) {
                      return Container();
                    }
                    if (state is HomeInitialState) {
                      homeCubit.getAllStraint();
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black87),
                        ),
                      );
                    } else if (state is HomeLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black87),
                        ),
                      );
                    } else if (state is HomeStraintInitialState) {
                      return ListView.builder(
                        itemCount: state.strains.length,
                        itemBuilder: (context, index) {
                          return ButtonWeed(marijuana: state.strains[index]);
                        },
                      );
                    } else if (state is HomeGenericErrorState) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: Text("Load weed error, try again later !"),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          );
        });
  }
}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         centerTitle: true,
//         title: Text("Weeds"),
//       ),
//       body: BlocBuilder<HomeCubit, HomeStates>(
//           cubit: homeCubit,
//           builder: (BuildContext context, HomeStates state) {
//             if (state is HomeInitialState) {
//               homeCubit.getAllStraint();
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
//                 ),
//               );
//             } else if (state is HomeLoadingState) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
//                 ),
//               );
//             } else if (state is HomeStraintInitialState) {
//               return ListView.builder(
//                 itemCount: state.strains.length,
//                 itemBuilder: (context, index) {
//                   return ButtonWeed(marijuana: state.strains[index]);
//                 },
//               );
//             } else if (state is HomeGenericErrorState) {
//               return Container(
//                 child: Center(
//                   child: Text("Load weed error, try again later !"),
//                 ),
//               );
//             }
//           }),
//     );
//   }
// }
