//
//  ViewController.swift
//  ex02
//
//  Created by shimada shun on 2022/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    enum Status {
        case normal, plus, minus, mult, div
    }
    var status = Status.normal
    var isTouchedCalcuButton = false
    var isTouchedEqualButton = false
    var previous = "0"
    var tmp = ""

    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func oneButton(_ sender: Any) {
        print("one")
        input_number(number: "1")
    }
    @IBAction func twoButton(_ sender: Any) {
        print("two")
        input_number(number: "2")
    }

    @IBAction func threeButton(_ sender: Any) {
        print("three")
        input_number(number: "3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        print("four")
        input_number(number: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        print("five")
        input_number(number: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        print("six")
        input_number(number: "6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        print("seven")
        input_number(number: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        print("eight")
        input_number(number: "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        print("nine")
        input_number(number: "9")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        print("zero")
        input_number(number: "0")
    }
    
    @IBAction func acButton(_ sender: Any) {
        print("ac")
        result.text = "0"
        status = .normal
        previous = "0"
    }
    
    @IBAction func negButton(_ sender: Any) {
        print("neg")
        result.text = String(-(Int(result.text!)!))
    }
    
    @IBAction func plusButton(_ sender: Any) {
        print("plus")
        tapped_arithmetic_operator(opera: .plus)
    }
    
    @IBAction func multButton(_ sender: Any) {
        print("mult")
        tapped_arithmetic_operator(opera: .mult)
    }
    
    @IBAction func minusButton(_ sender: Any) {
        print("minus")
        tapped_arithmetic_operator(opera: .minus)
        
    }
    
    @IBAction func divButton(_ sender: Any) {
        print("div")
        tapped_arithmetic_operator(opera: .div)
        
    }
    
    @IBAction func equalButton(_ sender: Any) {
        print("equal")
        var resultNum: Int64 = 0
        var current = result.text!
        var isOverflow: Bool
        
        if (previous == "エラー" || current == "エラー") {
            return
        }
        
        /* swap
         5        - 2       = 3
         previous   current   result.text
                    tmp
         
         press "="
         
         3        - 2       = 1
         current    tmp
         previous   current
        */
        if (isTouchedEqualButton) {
            previous = current
            current = tmp
        } else {
            isTouchedEqualButton = true
            tmp = current
        }
        
        switch status {
        case .plus:
            (resultNum, isOverflow) = (Int64(previous)!).addingReportingOverflow(Int64(current)!)
        case .minus:
            (resultNum, isOverflow) = (Int64(previous)!).subtractingReportingOverflow(Int64(current)!)
        case .mult:
            (resultNum, isOverflow) = (Int64(previous)!).multipliedReportingOverflow(by: Int64(current)!)
        case .div:
            if (current == "0") {
                result.text = "エラー"
                return
            }
            (resultNum, isOverflow) = (Int64(previous)!).dividedReportingOverflow(by: (Int64(current)!))
        default:
            return
        }
        if isOverflow {
            resultNum = 0
        }
        
        if String(resultNum).count > 16 {
            result.text = "0"
        } else {
            result.text = String(resultNum)
        }
    }
    
    func input_number(number: String) {
        if (isTouchedCalcuButton || result.text == "エラー") {
            isTouchedCalcuButton = false
            result.text = number
            return
        }
        if (result.text == "0") {
            result.text = number
        } else {
            if result.text?.count ?? 0 < 16 {
                result.text! += number
            }
        }
    }
    
    func tapped_arithmetic_operator(opera: Status) {
        status = opera
        isTouchedCalcuButton = true
        previous = result.text!
        isTouchedEqualButton = false
    }
}
