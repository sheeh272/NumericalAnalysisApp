//
//  nonLinSolver.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 6/22/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation

class nonLinSolver {
    //elementry root finding method from numerical analysis.
    //Very robust but also slow
     func bisection(a:Double, b:Double, equation:String) -> Double {
        let f = functionEval()
        if(f.evalX(s: equation, x:String(a)) * f.evalX(s: equation, x:String(b)) > 0 ){
            return -1
        }
        else {
            return bisectionHelper(a: a, b: b, equation: equation)
        }
    }
    
    func bisectionHelper(a:Double, b:Double, equation:String) -> Double {
        let tol = 0.001
        let f = functionEval()
        let c = (a + b)/2
        print(c)
        
        if(abs(f.evalX(s: equation, x:String(c))) < tol){
            return c
        }
        else if(f.evalX(s: equation, x:String(a)) * f.evalX(s: equation, x:String(c)) < 0 ){
            return bisectionHelper(a: a, b: c, equation: equation)
        }
        else {
            return bisectionHelper(a: c, b: b, equation: equation)
        }
    }
}
