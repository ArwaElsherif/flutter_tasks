import 'package:flutter/material.dart';

class Day5 extends StatelessWidget {
  const Day5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 165, 198),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        ),
        title: const Center(
          child: Text(
            "shopping",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 240, 99, 146),
        elevation: 15,
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Image(
                image: AssetImage("assets/WhatsApp Image2 .jpeg"),
                height: 400,
                width: 400,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(60),
              child: SizedBox(
                height: 15,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                "SINE IN",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black26,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  cursorColor: Colors.black,
                  showCursor: true,
                  decoration: InputDecoration(
                    label: const Text("username"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  showCursor: true,
                  decoration: InputDecoration(
                    label: const Text("password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
