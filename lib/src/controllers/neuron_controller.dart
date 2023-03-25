import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dart_numerics/dart_numerics.dart' as math;


class NeuronController extends GetxController {
  final TextEditingController w1TextController = TextEditingController();
  final TextEditingController w2TextController = TextEditingController();
  final TextEditingController x1TextController = TextEditingController();
  final TextEditingController x2TextController = TextEditingController();

  RxList weight = [].obs;
  RxList inputs = [].obs;

  RxDouble expectedOutput = 0.0.obs;
  RxDouble realOutput = 0.0.obs;
  double learningPercentage = 0.6;
  RxDouble errorPercentage = (-0.4).obs;
  RxInt iterations = 0.obs;

  @override
  void onInit() {
    getRandomWeights();
    super.onInit();
  }

  void getRandomWeights() {
    List<double> randomWeights = [];
    for (var i = 0; i < 2; i++) {
      randomWeights.add(Random().nextDouble() * 2 - 1);
    }
    print("w1 = ${randomWeights[0]}");
    print("w2 = ${randomWeights[1]}");
    w1TextController.text = randomWeights[0].toString();
    w2TextController.text = randomWeights[1].toString();
    weight.value = randomWeights;
    print(weight);
  }

  calculate(BuildContext context) {
    FocusScope.of(context).unfocus();
    inputs.value = [
      double.parse(x1TextController.text),
      double.parse(x2TextController.text),
    ];
    weight.value = [
      double.parse(w1TextController.text),
      double.parse(w2TextController.text),
    ];
    getExpectedOutput();
    getOutput();
  }

  void getExpectedOutput() {
    var firstInput = double.parse(x1TextController.text);
    var secondInput = double.parse(x1TextController.text);
    if (firstInput == 1 && secondInput == 1) {
      expectedOutput.value = 1;
    } else {
      expectedOutput.value = -1;
    }
  }

  double tanh(double x) {
    return sinh(x) / cosh(x);
  }

  double sinh(double x) {
    return (exp(x) - exp(-x)) / 2;
  }

  double cosh(double x) {
    return (exp(x) + exp(-x)) / 2;
  }

  void getOutput() {
    double output = 0;
    double output2 = 0;
    double error = errorPercentage.value;
    var x1 = (weight[0] * double.parse(x1TextController.text));
    var x2 = (weight[1] * double.parse(x2TextController.text));
    output = tanh((x1 + x2) - error);
    if (output < 1) {
      output = -1;
    } else {
      output = 1;
    }
    realOutput.value = output;
    verifyOutput();
  }

  verifyOutput() {
    if(iterations.value == 99){
      print(realOutput);
      print(expectedOutput);
    }
    if (realOutput != expectedOutput) {
      training();
      getOutput();
    }
  }

  clearInputs() {
    inputs.value = [0.0, 0.0];
    getRandomWeights();
    expectedOutput.value = 0;
    realOutput.value = 0;
    iterations.value = 0;
    errorPercentage.value = (-0.4);
    x1TextController.clear();
    x2TextController.clear();
  }

  void training() {
    double firstWeight = (weight[0] +
        2 *
            learningPercentage *
            expectedOutput.value *
            double.parse(x1TextController.text));

    double secondWeight = (weight[1] +
        2 *
            learningPercentage *
            expectedOutput.value *
            double.parse(x2TextController.text));

    double error = (errorPercentage.value +
        2 * learningPercentage * expectedOutput.value * (-1));

    weight.value = [firstWeight, secondWeight];
    errorPercentage.value = error;
    iterations.value++;
    print(iterations);
  }
}
