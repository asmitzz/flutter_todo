import 'package:flutter/material.dart';

class HomeTemplate extends StatefulWidget {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  _HomeTemplateState createState() => _HomeTemplateState();
}

class _HomeTemplateState extends State<HomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 238, 238, 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today's",
                  style: TextStyle(
                      color: Color.fromRGBO(37, 59, 107, 1.0),
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "list ",
                      style: TextStyle(
                          color: Color.fromRGBO(37, 59, 107, 1.0),
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        width: 25.0,
                        height: 3.0,
                        color: const Color.fromRGBO(37, 59, 107, 1.0))
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        side: const BorderSide(
                            color: Colors.greenAccent, width: 1.5),
                        value: false,
                        onChanged: (value) {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0))),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Read Type Guidelines",
                    style: TextStyle(
                      color: Color.fromRGBO(37, 59, 107, 1.0),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        side: const BorderSide(
                            color: Colors.greenAccent, width: 1.5),
                        value: false,
                        onChanged: (value) {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0))),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Complete responsive design",
                    style: TextStyle(
                      color: Color.fromRGBO(37, 59, 107, 1.0),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        checkColor: const Color.fromRGBO(37, 59, 107, 1.0),
                        activeColor: Colors.greenAccent,
                        side: const BorderSide(
                            color: Colors.greenAccent, width: 1.5),
                        value: true,
                        onChanged: (value) {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0))),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Bring Groceries",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
