//
//  SecondViewController.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 6/29/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    var solver = "unset"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NonLinearEq(_ sender: Any) {
        solver = "nonLinearEq"
         performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    @IBAction func Optimization(_ sender: Any) {
        solver = "Optimization"
        performSegue(withIdentifier: "HomeScreenSegue", sender: self)
    }
    
    @IBAction func Interpolation(_ sender: Any) {
        performSegue(withIdentifier: "Interpolation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC : ViewController = segue.destination as? ViewController {
            destVC.solver = solver
        }
        //let destVC = segue.destination
        //destVC.solver = solver
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
