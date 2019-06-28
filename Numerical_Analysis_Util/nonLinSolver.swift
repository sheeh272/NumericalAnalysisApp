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
     func bisection(a:Double, b:Double, equation:String, n: Int) -> Double {
        let f = functionEval()
        if(f.evalX(s: equation, x:String(a)) * f.evalX(s: equation, x:String(b)) > 0 ){
            return -1
        }
        else {
            return bisectionHelper(a: a, b: b, equation: equation, n: n)
        }
    }
    //n to specify how many iterations to use.  To avoid specifying use a negative number
    func bisectionHelper(a:Double, b:Double, equation:String, n: Int) -> Double {
        let tol = 0.001
        let f = functionEval()
        let c = (a + b)/2
    
        if(abs(f.evalX(s: equation, x:String(c))) < tol || n == 0){
            return c
        }
        else if(f.evalX(s: equation, x:String(a)) * f.evalX(s: equation, x:String(c)) < 0){
            return bisectionHelper(a: a, b: c, equation: equation, n: n-1)
        }
        else {
            return bisectionHelper(a: c, b: b, equation: equation, n: n-1)
        }
    }
    
    func Newtons(equation:String, x0:Double)->Double {
        let tol = 0.001
        let f = functionEval()
        var xkPlusOne = x0 - f.evalX(s: equation, x: String(x0))/f.getDeriv(s: equation, x: String(x0))
        var xk = x0
        while(abs(xk-xkPlusOne)>tol){
            xk = xkPlusOne
            xkPlusOne = xk - f.evalX(s: equation, x: String(xk))/f.getDeriv(s: equation, x: String(xk))
        }
        return xkPlusOne
    }
    
    func NewtonBisectionHybrid(a:Double, b:Double, equation:String)->Double {
        let x0 = bisection(a: a, b: b, equation: equation, n: 5)
        return Newtons(equation: equation, x0: x0)
    }
    
}





