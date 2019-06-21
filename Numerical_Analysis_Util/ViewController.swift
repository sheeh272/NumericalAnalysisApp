//
//  ViewController.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 6/6/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textView: UITextField!
    
    
    @IBAction func buttons(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
            case 1...9:
                textView.text! = textView.text! + String(button.tag)
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
        let f = functionEval()
        print(f.eval(s: textView.text!))
    }
    
}

