//
//  ViewControllerThree.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 7/6/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerThree: UIViewController {
    var solver = "unset"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var x: [UITextField]!
    
    
    @IBOutlet var y: [UITextField]!
    
    @IBAction func enterData(_ sender: Any) {
        let i = interpolation()
        var count = 0
        for e in x {
            i.addData(i: 0, j: count, data: Double(e.text!)!)
            count = count + 1
        }
        count = 0
        for e in y {
            i.addData(i: 1, j: count, data: Double(e.text!)!)
            count = count + 1
        }
        //i.printData()
        print(i.contructPolynomial())
        //print(i.constructLagrange(n: 1))
    }
    
}
