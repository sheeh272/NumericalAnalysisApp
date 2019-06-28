//
//  functionEval.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 6/20/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation

class functionEval {
    func eval(s:String)-> Double{
        let expression = NSExpression(format: s)
        let result = expression.expressionValue(with: nil, context: nil) as! NSNumber
        return Double(truncating: result)
        //Test
    }
    func evalX(s:String, x:String)-> Double{
        var newString = ""
        for character in s {
            if character == "X"{
                newString += x
            }
            else {
                newString += String(character)
            }
        }
        return eval(s: newString)
    }
    func getDeriv(s:String, x:String)-> Double {
        let h = 0.001
        let n = evalX(s: s, x: String(Double(x)! + h)) - evalX(s: s, x: String(Double(x)! - h))
        let d = 2 * h
        return n/d
    }
}
