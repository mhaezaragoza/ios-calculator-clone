//
//  ViewController.swift
//  iOSCalculator_clone
//
//  Created by rhomhazar on 1/8/22.
//

import UIKit

enum Operator{
    case divide
    case multiply
    case subtract
    case add
}

class ViewController: UIViewController {
    
    @IBOutlet weak var screenLabel: UILabel!
    
    var newInput = true
    var isPositive = true
    var hasPoint = false
    var selectedOperator: Operator?
    var operand1: Float32 = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
    }
    
    @IBAction func clearScreen(_ sender: UIButton) {
        screenLabel.text = "0"
        isPositive = true
        hasPoint = false
        selectedOperator = nil
        newInput = true
    }
    
    @IBAction func toggleSign(_ sender: UIButton) {
        if screenLabel.text != "0"{
            if isPositive {
                screenLabel.text = "-" + screenLabel.text!
            }else{
                screenLabel.text = screenLabel.text!.replacingOccurrences(of: "-", with: "")
            }
            
            isPositive = !isPositive
        }
    }
    
    @IBAction func toPercent(_ sender: UIButton) {
        let screenInput = Float32(screenLabel.text!)
        screenLabel.text = "\(screenInput!/100)"
    }
    
    @IBAction func numInput(_ sender: UIButton) {
        if newInput {
            screenLabel.text = sender.titleLabel!.text!
            newInput = false
            return
        }
        
        if screenLabel.text!.count < 16 {
            screenLabel.text = screenLabel.text! + sender.titleLabel!.text!
        }
    }
    
    @IBAction func pointInput(_ sender: UIButton) {
        if !hasPoint {
            screenLabel.text = screenLabel.text! + "."
            hasPoint = true
        }
    }
    
    @IBAction func selectOperator(_ sender: UIButton) {
        
        if selectedOperator != nil {
            calculate()
        }
        
        
        switch sender.titleLabel!.text {
            case "/":
                selectedOperator = .divide
            case "x":
                selectedOperator = .multiply
            case "-":
                selectedOperator = .subtract
            case "+":
                selectedOperator = .add

            default:
                selectedOperator = nil
        }
        
        operand1 = Float32(screenLabel.text!) ?? 0.0
        newInput = true
        
    }
    
    func calculate() {
        
        let operand2 = Float32(screenLabel.text!) ?? 0.0
        
        switch selectedOperator {
            case .divide:
                screenLabel.text = "\(operand1 / operand2)"
            case .multiply:
                screenLabel.text = "\(operand1 * operand2)"
            case .subtract:
                screenLabel.text = "\(operand1 - operand2)"
            case .add:
                screenLabel.text = "\(operand1 + operand2)"
            default:
                return
        }
    }
    
    


}

