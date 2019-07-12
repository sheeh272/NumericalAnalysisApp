//
//  ViewController.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 6/6/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var solver = "unset"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.delegate = self
        a.delegate = self
        b.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textView: UITextField!
    
    var activeTextField = UITextField()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    @IBAction func buttons(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        //for entering search range only want numeric values
        if(activeTextField != textView){
            switch button.tag {
            case 0...9:
                activeTextField.text! = activeTextField.text! + String(button.tag)
            case 14:
                activeTextField.text! = ""
            //This case is for toggling between negative and positive
            case 16:
                var stringArray = Array(activeTextField.text!)
                if(stringArray.count == 0){
                    activeTextField.text! = "-"
                }
                else if(stringArray[0] == "-"){
                    stringArray.removeFirst()
                    activeTextField.text! = String(stringArray)
                }
                else{
                    stringArray.insert("-", at: 0)
                    activeTextField.text! = String(stringArray)
                }
            default:
                return
            }
            return
        }
        switch button.tag {
            case 0...9:
                textView.text! = textView.text! + String(button.tag)
                //activeTextField.text! = activeTextField.text! + String(button.tag)
            case 10:
                textView.text! = textView.text! + "X"
            case 11:
                textView.text! = textView.text! + " ** "
            case 12:
                textView.text! = textView.text! + "log("
            case 13:
                textView.text! = textView.text! + ")"
            case 14:
                textView.text! = ""
            case 15:
                textView.text! = textView.text! + " + "
            case 16:
                textView.text! = textView.text! + " - "
            case 17:
                textView.text! = textView.text! + " / "
            case 18:
                textView.text! = textView.text! + " * "
            default:
                return
        }
    }
    
    @IBAction func Eval(_ sender: Any) {
        if(solver == "nonLinearEq"){
            let nlsolver = nonLinSolver()
            Result.text! = String(nlsolver.NewtonBisectionHybrid(a: Double(a.text!)!, b: Double(b.text!)!, equation: textView.text!))
        }
        else if(solver == "OptimizationMin"){
             let optimizer = optimization()
             Result.text! = String(optimizer.goldenSectionSearch(a: Double(a.text!)!, b: Double(b.text!)!, equation: textView.text!,m: 0))
        }
        else if(solver == "OptimizationMax"){
             let optimizer = optimization()
             Result.text! = String(optimizer.goldenSectionSearch(a: Double(a.text!)!, b: Double(b.text!)!, equation: textView.text!,m: 1))
        }
        else {
            print("error")
        }
    }
    
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var Result: UITextView!
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

