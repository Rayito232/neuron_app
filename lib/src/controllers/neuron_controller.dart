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
  RxList inputs = [].obs;

  RxDouble expectedOutput = 0.0.obs;
  RxDouble realOutput = 0.0.obs;
  RxDouble learningPercentage = 0.6.obs;
  RxDouble errorPercentage = (-0.4).obs;
  RxInt iterations = 0.obs;

  @override
  void onInit() {
    weight.value = [0.0, 0.0, 0.0, 0.0];
    inputs.value = [0.0, 0.0, 0.0, 0.0];
    super.onInit();
  }

  calculate(BuildContext context) {
    FocusScope.of(context).unfocus();
    weight.value = [
      double.parse(w1TextController.text),
      double.parse(w2TextController.text),
      double.parse(w3TextController.text),
      double.parse(w4TextController.text)
    ];
    inputs.value = [
      double.parse(x1TextController.text),
      double.parse(x2TextController.text),
      double.parse(x3TextController.text),
      double.parse(x4TextController.text)
    ];
    getExpectedOutput();
    getOutput();
  }

  void getExpectedOutput() {
    var firstInput = double.parse(x1TextController.text);
    var secondInput = double.parse(x2TextController.text).isNegative &&
        double.parse(x3TextController.text).isNegative &&
        double.parse(x4TextController.text).isNegative;

    if (firstInput.isNegative) {
      expectedOutput.value = -1;
    } else if (!firstInput.isNegative && secondInput) {
      expectedOutput.value = -1;
    } else {
      expectedOutput.value = 1;
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
    double error = errorPercentage.value;
    var x1 = (weight[0] * double.parse(x1TextController.text));
    var x2 = (weight[1] * double.parse(x2TextController.text));
    var x3 = (weight[2] * double.parse(x3TextController.text));
    var x4 = (weight[3] * double.parse(x4TextController.text));
    output = tanh(x1 + x2 + x3 + x4 - error);
    if (output < 1) {
      output = -1;
    } else {
      output = 1;
    }
    realOutput.value = output;
    verifyOutput();
  }

  verifyOutput() {
    if (realOutput != expectedOutput) {
      training();
      getOutput();
    } else {
      // clearWeights();
    }
  }

  clearInputs(){
    weight.value = [0.0, 0.0, 0.0, 0.0];
    inputs.value = [0.0, 0.0, 0.0, 0.0];
    expectedOutput.value = 0;
    realOutput.value = 0;
    iterations.value = 0;
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

  void training() {
    double firstWeight = (weight[0] +
        2 *
            learningPercentage.value *
            expectedOutput.value *
            double.parse(x1TextController.text));

    double secondWeight = (weight[1] +
        2 *
            learningPercentage.value *
            expectedOutput.value *
            double.parse(x2TextController.text));

    double thirdWeight = (weight[2] +
        2 *
            learningPercentage.value *
            expectedOutput.value *
            double.parse(x3TextController.text));

    double fourthWeight = (weight[3] +
        2 *
            learningPercentage.value *
            expectedOutput.value *
            double.parse(x4TextController.text));
    double error =
        (errorPercentage.value + 2 * learningPercentage.value * (-1));

    weight.value = [firstWeight, secondWeight, thirdWeight, fourthWeight];
    errorPercentage.value = error;
    iterations.value++;
  }
}
