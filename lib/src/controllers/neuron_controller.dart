import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NeuronController extends GetxController {
  final TextEditingController w1TextController = TextEditingController();
  final TextEditingController w2TextController = TextEditingController();
  final TextEditingController w3TextController = TextEditingController();
  final TextEditingController w4TextController = TextEditingController();
  final TextEditingController x1TextController = TextEditingController();
  final TextEditingController x2TextController = TextEditingController();
  final TextEditingController x3TextController = TextEditingController();
  final TextEditingController x4TextController = TextEditingController();

  RxList weight = [].obs;
  RxList newWeight = [].obs;
  RxList inputs = [].obs;
  RxList inputsArray = [].obs;

  RxDouble expectedOutput = 0.0.obs;
  RxList expectedOutputList = [].obs;
  RxDouble realOutput = 0.0.obs;
  RxList realOutputList = [].obs;
  RxList finalList = [].obs;
  RxDouble learningPercentage = 0.6.obs;
  RxDouble errorPercentage = (-0.4).obs;
  RxList errorPercentageList = [
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
    -0.4,
  ].obs;
  RxList iterations = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ].obs;

  @override
  void onInit() {
    getInputs();
    getRandomWeights();
    calculate();
    super.onInit();
  }

  getInputs() {
    inputsArray.value = [
      [-1, -1, -1, -1],
      [-1, -1, -1, 1],
      [-1, -1, 1, -1],
      [-1, -1, 1, 1],
      [-1, 1, -1, -1],
      [-1, 1, -1, -1],
      [-1, 1, 1, -1],
      [-1, 1, 1, 1],
      [1, -1, -1, -1],
      [1, -1, -1, 1],
      [1, -1, 1, -1],
      [1, -1, 1, 1],
      [1, 1, -1, -1],
      [1, 1, -1, 1],
      [1, 1, 1, -1],
      [1, 1, 1, 1],
    ];
  }

  void getRandomWeights() {
    List<double> randomWeights = [];
    for (var i = 0; i < 4; i++) {
      randomWeights.add(Random().nextDouble() * 2 - 1);
    }
    print("w1 = ${randomWeights[0]}");
    print("w2 = ${randomWeights[1]}");
    print("w3 = ${randomWeights[2]}");
    print("w4 = ${randomWeights[3]}");
    weight.value = randomWeights;
    for (var i = 0; i < 16; i++) {
      newWeight.add(weight);
    }
    print(newWeight);
  }

  calculate() {
    getExpectedOutput();
    getOutput();
  }

  void getExpectedOutput() {
    for (var element in inputsArray) {
      var firstInput = element[0];
      var secondInput = element[1].isNegative &&
          element[2].isNegative &&
          element[3].isNegative;
      if (firstInput.isNegative) {
        expectedOutputList.add(-1);
      } else if (!firstInput.isNegative && secondInput) {
        expectedOutputList.add(-1);
      } else {
        expectedOutputList.add(1);
      }
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
    double output = -1;
    List errorList = errorPercentageList;
    for (var element in inputsArray) {
      var x1 = (weight[0] * element[0]);
      var x2 = (weight[1] * element[1]);
      var x3 = (weight[2] * element[2]);
      var x4 = (weight[3] * element[3]);
      output = tanh(x1 + x2 + x3 + x4 - errorList[0]);
      if (output < 0) {
        realOutputList.add(-1);
      } else {
        realOutputList.add(1);
      }
      var index = inputsArray.indexOf(element);
      verifyOutput(output, element, index);
    }
  }

  verifyOutput(double output, var element, index) {
    while (finalList.length != expectedOutputList.length) {
      for (int i = 0; i < realOutputList.length; i++) {
        if (realOutputList[i] != expectedOutputList[i]) {
          training(output, element, index);
          getOutput();
        } else {
          finalList.add(realOutputList[i]);
        }
      }
    }
  }

  clearInputs() {
    //weight.value = [0.0, 0.0, 0.0, 0.0];
    getRandomWeights();
    inputs.value = [0.0, 0.0, 0.0, 0.0];
    expectedOutput.value = 0;
    realOutput.value = 0;
    // iterations.value = 0;
    errorPercentage.value = (-0.4);
    x1TextController.clear();
    x2TextController.clear();
    x3TextController.clear();
    x4TextController.clear();
    w1TextController.clear();
    w2TextController.clear();
    w3TextController.clear();
    w4TextController.clear();
  }

  void training(double output, var element, int index) {
    double firstWeight = (newWeight[index][0] +
        2 * learningPercentage.value * output * element[0]);

    double secondWeight = (newWeight[index][1] +
        2 * learningPercentage.value * output * element[1]);

    double thirdWeight = (newWeight[index][2] +
        2 * learningPercentage.value * output * element[2]);

    double fourthWeight = (newWeight[index][3] +
        2 * learningPercentage.value * output * element[3]);

    double error = (errorPercentageList[index] +
        2 * learningPercentage.value * output * (-1));

    newWeight[index] = [
      firstWeight,
      secondWeight,
      thirdWeight,
      fourthWeight
    ];
    errorPercentageList[index] = error;
    iterations[index] += 1;
  }
}
