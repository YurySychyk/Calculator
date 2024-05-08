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
    var currentNumber: String = "" {
        didSet {
            screenText.text = currentNumber
        }
    }
    enum CurrentOperation {
        case noAction
        case addition
        case substruction
        case multiplication
        case division
    }
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    var firstNumber: String = "" {
        didSet {
            firstNumberLabel.text = firstNumber
        }
    }
    var secondNumber: String = ""
    
    var currentOperation :CurrentOperation = .noAction
    
    @IBOutlet weak var currentoperationLabel: UILabel!
    
    
    
    @IBAction func buttonDivision(_ sender: UIButton) {
        currentOperation = .division
        currentoperationLabel.text = " / "
        firstNumber = currentNumber
        currentNumber = ""
    }
    
    @IBAction func buttonMultiplication(_ sender: UIButton) {
        currentOperation = .multiplication
        currentoperationLabel.text = " * "
        firstNumber = currentNumber
        currentNumber = ""
    }
    
    @IBAction func buttonSubstraction(_ sender: UIButton) {
        currentOperation = .substruction
        currentoperationLabel.text = " - "
        firstNumber = currentNumber
        currentNumber = ""
    }
    
    @IBAction func buttonAddition(_ sender: UIButton) {
        currentOperation = .addition
        currentoperationLabel.text = " + "
        firstNumber = currentNumber
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
    @IBAction func buttonComma(_ sender: UIButton) {currentNumber += ","}
    
    
    @IBAction func allClear(_ sender: UIButton) {
        currentNumber = ""
    }
    var result : Double = 0
    
    @IBAction func calculation(_ sender: UIButton) {
        secondNumber = currentNumber
        switch currentOperation {
        case .addition :
            result = (Double(firstNumber) ?? 0) + (Double(secondNumber) ?? 0)
            currentNumber = String(result)
        case .substruction :
            result = (Double(firstNumber) ?? 0) - (Double(secondNumber) ?? 0)
            currentNumber = String(result)
        case .multiplication :
            result = (Double(firstNumber) ?? 0) * (Double(secondNumber) ?? 0)
            currentNumber = String(result)
        case .division :
            result = (Double(firstNumber) ?? 0) / (Double(secondNumber) ?? 0)
            currentNumber = String(result)
        case .noAction:
            break
        }
    }
    
    
}
    
    


