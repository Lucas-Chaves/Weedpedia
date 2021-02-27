import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maripedia/views/view.dart';

import '../utils/utils.dart';
import '../cubit/cubit.dart';

class WeedsPage extends StatefulWidget {
  @override
  _WeedsPageState createState() => _WeedsPageState();
}

class _WeedsPageState extends State<WeedsPage> {
  @override
  Widget build(BuildContext context) {
    WeedsCubit weedsCubit = BlocProvider.of<WeedsCubit>(context);

    return BlocBuilder<WeedsCubit, WeedsStates>(
        cubit: weedsCubit,
        builder: (BuildContext context, WeedsStates state) {
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
                  weedsCubit.getAllStraintRefresh(),
                );
              },
              child: Builder(
                builder: (context) {
                  if (state is WeedsPullRefreshState) {
                    return ListView();
                  }
                  if (state is WeedsInitialState) {
                    weedsCubit.getAllStraint();
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black87),
                      ),
                    );
                  } else if (state is WeedsLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black87),
                      ),
                    );
                  } else if (state is WeedsStraintInitialState) {
                    return ListView.builder(
                      itemCount: state.strains.length,
                      itemBuilder: (context, index) {
                        return ButtonWeed(marijuana: state.strains[index]);
                      },
                    );
                  } else if (state is WeedsGenericErrorState) {
                    return ListView(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Text("Load weed error, try again later !"),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          );
        });
  }
}

// class _WeedsPageState extends State<WeedsPage> {
//   @override
//   Widget build(BuildContext context) {
//     WeedsCubit WeedsCubit = BlocProvider.of<WeedsCubit>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appBarColor,
//         centerTitle: true,
//         title: Text("Weeds"),
//       ),
//       body: BlocBuilder<WeedsCubit, WeedsStates>(
//           cubit: WeedsCubit,
//           builder: (BuildContext context, WeedsStates state) {
//             if (state is WeedsInitialState) {
//               WeedsCubit.getAllStraint();
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
//                 ),
//               );
//             } else if (state is WeedsLoadingState) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
//                 ),
//               );
//             } else if (state is WeedsStraintInitialState) {
//               return ListView.builder(
//                 itemCount: state.strains.length,
//                 itemBuilder: (context, index) {
//                   return ButtonWeed(marijuana: state.strains[index]);
//                 },
//               );
//             } else if (state is WeedsGenericErrorState) {
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
