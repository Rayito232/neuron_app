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
              children: [
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
                Obx(
                  () => Table(
                    defaultColumnWidth: FixedColumnWidth(
                        MediaQuery.of(context).size.width * 0.2),
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
                            "Expected ouput",
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
                              "[ ${neuronController.x1TextController.text}, ${neuronController.x2TextController.text} ]",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            neuronController.expectedOutput.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            neuronController.realOutput.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Table(
                    defaultColumnWidth: FixedColumnWidth(
                        MediaQuery.of(context).size.width * 0.2),
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
                              "[ ${neuronController.weight[0].toStringAsFixed(3)}, ${neuronController.weight[1].toStringAsFixed(3)} ]",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            neuronController.iterations.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            neuronController.errorPercentage.toStringAsFixed(3),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
