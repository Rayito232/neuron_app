import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuron/src/controllers/neuron_controller.dart';

class NeuronPage extends StatelessWidget {
  const NeuronPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final NeuronController neuronController = Get.put(NeuronController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Neuron'),
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                /*
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Text(
                      'Inputs',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.x1TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "x1",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.x2TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "x2",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.x3TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "x3",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.x4TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "x4",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Center(
                    child: Text(
                      'Weights',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.w1TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "w1",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.w2TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "w2",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.w3TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "w3",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: neuronController.w4TextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(
                            "w4",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SizedBox(
                    height: 55,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => neuronController.calculate(context),
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                */
                TableDataWidget(index: 0),
                TableDataWidget(index: 1),
                TableDataWidget(index: 2),
                TableDataWidget(index: 3),
                TableDataWidget(index: 4),
                TableDataWidget(index: 5),
                TableDataWidget(index: 6),
                TableDataWidget(index: 7),
                TableDataWidget(index: 8),
                TableDataWidget(index: 9),
                TableDataWidget(index: 10),
                TableDataWidget(index: 11),
                TableDataWidget(index: 12),
                TableDataWidget(index: 13),
                TableDataWidget(index: 14),
                TableDataWidget(index: 15),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => neuronController.clearInputs(),
          child: const Icon(Icons.delete),
        ));
  }
}

class TableDataWidget extends StatelessWidget {
  final int index;
  const TableDataWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NeuronController neuronController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Obx(
            () => Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 1, color: Colors.indigo),
                outside: const BorderSide(width: 1, color: Colors.indigo),
              ),
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Colors.indigo),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Inputs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Expected output",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Real output",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "[${neuronController.inputsArray[index][0]}, ${neuronController.inputsArray[index][1]}, ${neuronController.inputsArray[index][2]}, ${neuronController.inputsArray[index][3]}]",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      neuronController.expectedOutputList[index].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      neuronController.realOutputList[index].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.symmetric(
                inside: const BorderSide(width: 1, color: Colors.indigo),
                outside: const BorderSide(width: 1, color: Colors.indigo),
              ),
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Colors.indigo),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "New weights",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Iterations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Error",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "[${neuronController.newWeight[index][0].toStringAsFixed(3)}, ${neuronController.newWeight[index][1].toStringAsFixed(3)}, ${neuronController.newWeight[index][2].toStringAsFixed(3)}, ${neuronController.newWeight[index][3].toStringAsFixed(3)}]",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      neuronController.iterations[index].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      neuronController.errorPercentageList[index].toStringAsFixed(3),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
