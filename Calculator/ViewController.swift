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

    @IBOutlet weak var currentNumber: UILabel!
    
   
    @IBAction func button0(_ sender: UIButton) {
        currentNumber.text = "0"
    }
    
    @IBAction func button1(_ sender: UIButton) {
        currentNumber.text = "1"
    }
    
    @IBAction func button3(_ sender: UIButton) {
        currentNumber.text = "3"
    }
    
}


