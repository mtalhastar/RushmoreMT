import 'package:flutter/material.dart';

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
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      'assets/images/mtrushmore.png',
                      width: double.maxFinite,
                    ),
                  ),
                ),
              const SizedBox(height: 40,),
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
                    color:const  Color.fromARGB(255, 250, 250, 250),
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
                    color: const  Color.fromARGB(255, 250, 250, 250),
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
                    color: const  Color.fromARGB(255, 250, 250, 250),
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
                  height:40 ,
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
