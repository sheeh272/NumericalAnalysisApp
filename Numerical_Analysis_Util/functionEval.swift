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
}
