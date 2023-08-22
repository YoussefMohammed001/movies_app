import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main_screen/manager/main_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainCubit cubit = MainCubit();
String imgUrl = "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "EN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "AR",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )),
                  ],
                ),
              ],
            ),
            drawer: Drawer(
              backgroundColor: Colors.black,
              child: Container(

                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(imgUrl),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Youssef Mohamed",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const IntrinsicHeight(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 4,
                            ),
                          ),
                          Text(
                            "profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const IntrinsicHeight(
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 4,
                            ),
                          ),
                          Text(
                            "settings",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                                width: 4,
                              ),
                            ),
                            Text(
                              "Log out",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //floating action button position to center
            bottomNavigationBar: bottomNavBar(),
            body: cubit.screens[cubit.index],
          );
        },
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
      onTap: (value) {
        cubit.index = value;
        setState(() {});
      },
      currentIndex: cubit.index,
      items: const [
        BottomNavigationBarItem(
            label: "Movies", icon: Icon(Icons.movie_creation_outlined)),
        BottomNavigationBarItem(label: "TV", icon: Icon(Icons.tv_rounded)),
      ],
    );
  }
}
