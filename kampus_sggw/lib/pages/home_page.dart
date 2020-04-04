import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/buildings_bloc.dart';
import 'package:kampus_sggw/bloc/searchbar_bloc.dart';
import 'package:kampus_sggw/widgets/campus_map.dart';
import 'package:kampus_sggw/widgets/droplist.dart';
import 'package:kampus_sggw/widgets/searchbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BuildingsBloc buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    final SearchbarBloc searchbarBloc = BlocProvider.of<SearchbarBloc>(context);
    buildingsBloc.add(BuildingsEvent.init);
    searchbarBloc.add(ShowHide.showhide);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: Colors.green[500],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: "btn1",
                mini: true,
                onPressed: () {},
                foregroundColor: Colors.green[500],
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.my_location,
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green[500],
              heroTag: "btn2",
              child: Icon(Icons.search),
              onPressed: () {
                searchbarBloc.add(ShowHide.showhide);
              },
            )
          ],
        ),
        body: Container(child: BlocBuilder<SearchbarBloc, bool>(builder: (context, state) {
          FocusNode myNode = FocusNode();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            FocusScope.of(context).requestFocus(myNode);
          });
          if (state)
            return Stack(
              children: [
                CampusMap(),
                GestureDetector(
                  onTap: () {
                    searchbarBloc.add(ShowHide.showhide);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropList(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: SearchBar(node: myNode),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/buildingsList');
                        searchbarBloc.add(ShowHide.showhide);
                      },
                      icon: Icon(Icons.list),
                    ),
                  ],
                ),
              ],
            );
          else
            return Stack(
              children: [
                CampusMap(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropList(),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/buildingsList');
                      },
                      icon: Icon(Icons.list),
                    ),
                  ],
                ),
              ],
            );
        })));
        
  }
}
