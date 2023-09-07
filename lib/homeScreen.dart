import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Stack(children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Image.asset(
                        'assets/images/mtrushmore.png',
                        width: double.maxFinite,
                      
                      ),
                    ),
                    Positioned(
                        left: context.isPortrait? MediaQuery.of(context).size.width/13.4: MediaQuery.of(context).size.width / 13,
                        top: context.isPortrait? MediaQuery.of(context).size.height / 50: MediaQuery.of(context).size.height /8.5,
                        child: FittedBox(
                          child: Container(
                            height:  context.isPortrait? MediaQuery.of(context).size.height / 10: MediaQuery.of(context).size.height / 2.6,
                            width: MediaQuery.of(context).size.width/5.7,
                            decoration: const BoxDecoration(
                                 borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ronaldoimage.png'),
                                    fit: BoxFit.cover),
                            )
                          ),
                        )),
                    Positioned(
                       left: context.isPortrait
                          ?  MediaQuery.of(context).size.width / 3.3: MediaQuery.of(context).size.width / 3.32,
                      top: context.isPortrait
                          ?  MediaQuery.of(context).size.height / 14 : MediaQuery.of(context).size.width / 6,
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(0.2)
                            ..rotateZ(-0.2),
                          child: Container(
                            height:  context.isPortrait
                          ?  MediaQuery.of(context).size.height / 12: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width /8,
                            decoration:const BoxDecoration(
                                 borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ronaldoimage.png'),
                                    fit: BoxFit.cover),
                            ),
                          
                          )),
                    ),
                    Positioned(
                       left: MediaQuery.of(context).size.width / 2.06,
                      top: context.isPortrait
                          ?  MediaQuery.of(context).size.height / 8.4: MediaQuery.of(context).size.height / 1.9,
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(0.7),
                          child: Container(
                            height:context.isPortrait? MediaQuery.of(context).size.height / 10.9: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 5.8,
                            decoration: const BoxDecoration(
                                 borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ronaldoimage.png'),
                                    fit: BoxFit.cover),
                            ),
                          )),
                    ),
                     Positioned(
                      right: MediaQuery.of(context).size.width /16 ,
                      top:context.isPortrait
                          ?  MediaQuery.of(context).size.height / 8.5:  MediaQuery.of(context).size.height / 2,
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(0.7),
                          child: Opacity(
                            opacity: 0.9,
                            child: Container(
                              height:context.isPortrait
                            ?  MediaQuery.of(context).size.height / 11: MediaQuery.of(context).size.height / 2.4,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration:  const BoxDecoration(
                                
                                   borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/ronaldoimage.png'),
                                      fit: BoxFit.cover),
                              ),
                            ),
                          )),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Type Celebrity Names',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 49,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(88, 0, 0, 0),
                      ),
                      hintText: 'Enter first celebrity name',
                      hintStyle: TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 49,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(88, 0, 0, 0),
                      ),
                      hintText: 'Enter second celebrity name',
                      hintStyle: TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 49,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(88, 0, 0, 0),
                      ),
                      hintText: 'Enter third celebrity name',
                      hintStyle: TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 49,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 250, 250, 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(88, 0, 0, 0),
                      ),
                      hintText: 'Enter fourth celebrity name',
                      hintStyle: TextStyle(color: Color.fromARGB(82, 0, 0, 0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 57,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
