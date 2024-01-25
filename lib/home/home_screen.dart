import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<List<String>> taskStatus = [[]];
  TextEditingController habitTxtController = TextEditingController();

  var valueTypeToCount = 'true';
  late List<int> count = List<int>.generate(30, (index) => 0);

  List<String> habitList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Habit Tracker",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              habitList.isNotEmpty
                  ? ListView.builder(
                      itemCount: habitList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          padding: const EdgeInsets.all(18.0),
                          margin: const EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    habitList[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    "${count[index]}/${count.length}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: ListView.builder(
                                  itemCount: 30,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int habitIndex) {
                                    return Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons.check,
                                                                size: 30.0,
                                                                color: Colors
                                                                    .green,
                                                              ),
                                                              const SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Text(
                                                                "Success",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          setState(() {
                                                            taskStatus[index +
                                                                        1][
                                                                    habitIndex] =
                                                                "true";
                                                            count[
                                                                index] = taskStatus[
                                                                    index + 1]
                                                                .where((element) =>
                                                                    element ==
                                                                    valueTypeToCount)
                                                                .length;

                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                      ),
                                                      InkWell(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Icon(
                                                                Icons.close,
                                                                size: 30.0,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              const SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Text(
                                                                "Failure",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleLarge,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          setState(() {
                                                            taskStatus[index +
                                                                        1][
                                                                    habitIndex] =
                                                                "false";
                                                            count[
                                                                index] = taskStatus[
                                                                    index + 1]
                                                                .where((element) =>
                                                                    element ==
                                                                    valueTypeToCount)
                                                                .length;

                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.12,
                                            margin: const EdgeInsets.only(
                                                left: 14.0),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: taskStatus[index + 1]
                                                            [habitIndex] ==
                                                        "not specified"
                                                    ? Colors.yellow
                                                    : taskStatus[index + 1]
                                                                [habitIndex] ==
                                                            "true"
                                                        ? Colors.green.shade200
                                                        : Colors.red.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            child: Text(
                                              (habitIndex + 1).toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Center(
                        child: Text(
                          "Create a habit to follow",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            controller: habitTxtController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: "Enter Habit Name",
                            ),
                            validator: (value) {
                              if (value == '') {
                                return "please Enter the Value";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                habitList.add(habitTxtController.text);
                                taskStatus.add(
                                  List<String>.generate(
                                      31, (index) => "not specified"),
                                );
                              });
                              habitTxtController.clear();
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.send,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
