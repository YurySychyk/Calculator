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
    }
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
    
    // вывод типа текущей математической операции на экран
    @IBOutlet weak var currentoperationLabel: UILabel!
    
    //первое число в операции
    var firstNumber: String = ""
    //второе число в операции
    var secondNumber: String = ""
    // тип текущей математической операции
    var currentOperation :CurrentOperation = .noAction
    
    
    // нажатие кнопки "деление"
    @IBAction func buttonDivision(_ sender: UIButton) {
        //задание типа текущей операции "деление"
        currentOperation = .division
        //вывод типа текущей операции в лэйблу "текущая математическая операция"
        currentoperationLabel.text = " / "
        // запись текущего числа в "первое значение"
        firstNumber = currentNumber
       //запись в цепочку операций
        operations.text! += currentNumber
        operations.text! += "/"
        // очистка значени текущего числа
        currentNumber = ""
    }
    
    //нажатие кнопки "умножение"
    @IBAction func buttonMultiplication(_ sender: UIButton) {
        currentOperation = .multiplication
        currentoperationLabel.text = " * "
        firstNumber = currentNumber
      
        operations.text! += currentNumber
        operations.text! += "*"
        currentNumber = ""
    }
    
    //нажатие кнопки "вычитание"
    @IBAction func buttonSubstraction(_ sender: UIButton) {
        currentOperation = .substruction
        currentoperationLabel.text = " - "
        firstNumber = currentNumber
     
        operations.text! += currentNumber
        operations.text! += " - "
        currentNumber = ""
    }
    
    //нажатие кнопки "сложение"
    @IBAction func buttonAddition(_ sender: UIButton) {
        currentOperation = .addition
        currentoperationLabel.text = " + "
        firstNumber = currentNumber
       
        operations.text! += currentNumber
        operations.text! += " + "
        currentNumber = ""
    }
    
    
    
    
    
    @IBOutlet weak var screenText: UILabel!
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
    @IBAction func buttonComma(_ sender: UIButton) {currentNumber += "."}
    
    
    @IBAction func allClear(_ sender: UIButton) {
        currentNumber = ""
        currentOperation = .noAction
        firstNumber = ""
        currentoperationLabel.text = " "
        operations.text! = ""
    }
    var result : Double = 0
    
    @IBAction func calculation(_ sender: UIButton) {
        secondNumber = currentNumber
        switch currentOperation {
        case .addition :
            operations.text! += currentNumber
            result = Double(firstNumber)!  + Double(secondNumber)!
            currentNumber = String(result)
            operations.text! += " = \(result)"
        case .substruction :
            operations.text! += currentNumber
            result = Double(firstNumber)! - Double(secondNumber)!
            currentNumber = String(result)
            operations.text! += " = \(result)"
        case .multiplication :
            operations.text! += currentNumber
            result = Double(firstNumber)! * Double(secondNumber)!
            currentNumber = String(result)
            operations.text! += " = \(result)"
        case .division :
            operations.text! += currentNumber
            result = Double(firstNumber)! / Double(secondNumber)!
            currentNumber = String(result)
            operations.text! += " = \(result)"
        case .noAction:
            break
        }
        
    }
    
    
}
    
    


