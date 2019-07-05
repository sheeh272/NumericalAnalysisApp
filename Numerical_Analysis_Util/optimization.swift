//
//  optimization.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 7/3/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation
class optimization {
    //based on algorithm from scientific-computing by michael-t-heath pg 271
    func goldenSectionSearch(a:Double, b:Double, equation:String) -> Double {
        let f = functionEval()
        let r = (sqrt(5) - 1)/2
        var x1 = a + (1 - r)*(b - a)
        var f1 = f.evalX(s: equation, x: String(x1))
        var x2 = a + r*(b - a)
        var f2 = f.evalX(s: equation, x: String(x2))
        //to make a and b mutable
        var a = a ; var b = b;
        while((b - a) > 0.0001){
            if (f1 > f2){
                //print(a,f1,"a")
                a = x1
                x1 = x2
                f1 = f2
                x2 = a + r*(b - a)
                f2 = f.evalX(s: equation, x: String(x2))
            }
            else {
                //print(b,f2,"b")
                b = x2
                x2 = x1
                f2 = f1
                x1 = a + (1 - r)*(b - a)
                f1 = f.evalX(s: equation, x: String(x1))
            }
        }
        return (a+b)/2
    }
}
