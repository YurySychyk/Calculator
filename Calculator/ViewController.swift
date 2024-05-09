//
//  ViewController.swift
//  Calculator
//
//  Created by Yury Sychyk on 07.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //текущее число
    var currentNumber: String = "" {
        // обновляет текущее число на экране
        didSet {
            screenText.text = currentNumber
        }
        willSet {
            
        }
    }
    //первое число в операции
    var firstNumber: String = ""
    //второе число в операции
    var secondNumber: String = ""
    //тип текущей математической операции
    var currentOperation: CurrentOperation = .noAction
    // резултат математической операции
    var result : Double = 0
    
    //тип математической операции
    enum CurrentOperation {
        case noAction
        case addition
        case substruction
        case multiplication
        case division
        
    }
    // вывод цепочки операций
    @IBOutlet weak var operations: UILabel!
    
    // нажатие кнопки "деление"
    @IBAction func buttonDivision(_ sender: UIButton) {
        //задание типа текущей операции "деление"
        currentOperation = .division
        // запись текущего числа в "первое значение"
        if Double(currentNumber) == result {
            firstNumber = currentNumber
            //очистка строки текущих операций
            operations.text! = ""
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "/"
            currentNumber = ""
        } else {
            firstNumber = currentNumber
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "/"
            currentNumber = ""
        }
    }
    
    //нажатие кнопки "умножение"
    @IBAction func buttonMultiplication(_ sender: UIButton) {
        //задание типа текущей операции "умножение"
        currentOperation = .multiplication
        // запись текущего числа в "первое значение"
        if Double(currentNumber) == result {
            firstNumber = currentNumber
            //очистка строки текущих операций
            operations.text! = ""
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "*"
            currentNumber = ""
        } else {
            firstNumber = currentNumber
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "*"
            currentNumber = ""
        }
    }
    
    //нажатие кнопки "вычитание"
    @IBAction func buttonSubstraction(_ sender: UIButton) {
        // задание типа текущей операции "вычитание"
        currentOperation = .substruction
        // запись текущего числа в "первое значение"
        if Double(currentNumber) == result {
            firstNumber = currentNumber
            //очистка строки текущих операций
            operations.text! = ""
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "-"
            currentNumber = ""
        } else {
            firstNumber = currentNumber
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "-"
            currentNumber = ""
        }
    }
    
    //нажатие кнопки "сложение"
    @IBAction func buttonAddition(_ sender: UIButton) {
        // задание типа операции "сложение"
        currentOperation = .addition
        //запись текущего числа в "первое значение"
        if Double(currentNumber) == result {
            firstNumber = currentNumber
            //очистка строки текущих операций
            operations.text! = ""
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "+"
            currentNumber = ""
        } else {
            firstNumber = currentNumber
            //запись в цепочку операций
            operations.text! += currentNumber
            operations.text! += "+"
            currentNumber = ""
        }
    }
    
    //вывод текущего значения на экран
    @IBOutlet weak var screenText: UILabel!
    
    //нажатие кнопки добавляет цифру в текущее значение
    @IBAction func button0(_ sender: UIButton) {currentNumber += "0"}
    @IBAction func button1(_ sender: UIButton) {currentNumber += "1"}
    @IBAction func button2(_ sender: UIButton) {currentNumber += "2"}
    @IBAction func button3(_ sender: UIButton) {currentNumber += "3"}
    @IBAction func button4(_ sender: UIButton) {currentNumber += "4"}
    @IBAction func button5(_ sender: UIButton) {currentNumber += "5"}
    @IBAction func button6(_ sender: UIButton) {currentNumber += "6"}
    @IBAction func button7(_ sender: UIButton) {currentNumber += "7"}
    @IBAction func button8(_ sender: UIButton) {currentNumber += "8"}
    @IBAction func button9(_ sender: UIButton) {currentNumber += "9"}
    @IBAction func buttonComma(_ sender: UIButton) {
        if currentNumber.contains(".") {
            currentNumber.removeLast()
        } else {
            currentNumber += "."
        }
    }
    @IBAction func buttonMinus(_ sender: UIButton) {
        if currentNumber.contains("-") {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber.insert("-", at: currentNumber.startIndex)
        }
    }
    
    // нажатие кнопки "очистка всех значений"
    @IBAction func allClear(_ sender: UIButton) {
        // очистка текущего значения
        currentNumber = ""
        // задание типа математической операции "нет события"
        currentOperation = .noAction
        // очистка значения "первое число"
        firstNumber = ""
        //очистка поля цепочки текущих операций
        operations.text! = ""
    }
    
    //нажатие кнопки текущего значения
    @IBAction func buttonClear(_ sender: UIButton) {
        currentNumber = ""
    }
    
    // нажатие кнопки "равно"
    @IBAction func calculation(_ sender: UIButton) {
        // присвоение текущего числа во "второе значение"
        secondNumber = currentNumber
        // выбор математической операции от состояния типа математической операции
        switch currentOperation {
        case .addition :
            // добавление "второго значения" в поле текущих операций
            operations.text! += secondNumber
            // вычисление суммы первого и второго значения
            result = Double(firstNumber)!  + Double(secondNumber)!
            //очистка поля текущее значение
            currentNumber = "\(result)"
            // вывод результата в поле текущих операций
            operations.text! += " = \(result); "
        case .substruction :
            // добавление "второго значения" в поле текущих операций
            operations.text! += secondNumber
            // вычисление разности первого и второго значения
            result = Double(firstNumber)! - Double(secondNumber)!
            //очистка поля текущее значение
            currentNumber = "\(result)"
            // вывод результата в поле текущих операций
            operations.text! += " = \(result); "
        case .multiplication :
            // добавление "второго значения" в поле текущих операций
            operations.text! += secondNumber
            // вычисление произведения первого и второго значения
            result = Double(firstNumber)! * Double(secondNumber)!
            //очистка поля текущее значение
            currentNumber = "\(result)"
            // вывод результата в поле текущих операций
            operations.text! += " = \(result); "
        case .division :
            // добавление "второго значения" в поле текущих операций
            operations.text! += secondNumber
            // вычисление деления первого и второго значения
            result = Double(firstNumber)! / Double(secondNumber)!
            //очистка поля текущее значение
            currentNumber = "\(result)"
            // вывод результата в поле текущих операций
            operations.text! += " = \(result); "
        case .noAction:
            break
        }
       
    }
    
    
}
    
    


