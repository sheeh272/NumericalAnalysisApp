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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NonlinEqSolver(_ sender: Any) {
         performSegue(withIdentifier: "HomeScreenSegue", sender: self)
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
