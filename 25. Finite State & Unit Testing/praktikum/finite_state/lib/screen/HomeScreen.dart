import 'package:finite_state/screen/ViewModel.dart';
import 'package:finite_state/screen/ViewState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ViewModel>(context, listen: false).getAllData();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ViewModel>(context, listen: false).getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<ViewModel>(builder: (context, provider, _) {
          if (provider.state == ViewModelState.loading) {
            return CircularProgressIndicator();
          }
          if (provider.state == ViewModelState.iddle) {
            if (!provider.data!.isEmpty) {
              if (provider.data!.length < 1) {
                return Center(
                  child: Text("Data tidak ada"),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.data!.length,
                      itemBuilder: ((context, index) => Card(
                            color: Colors.lightGreen[200],
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Text(
                                        provider.data![index].name
                                                .toString()[0] ??
                                            '',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(provider.data![index].name
                                                    .toString() ??
                                                ''),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              );
            }
          }
          return Center(
            child: Text("Error"),
          );
        }),
      ],
    );
  }
}
