//
//  interpolation.swift
//  Numerical_Analysis_Util
//
//  Created by Andrew's Laptop on 7/6/19.
//  Copyright © 2019 Andrew's Laptop. All rights reserved.
//

import Foundation
class interpolation {
    //var dataArray = [[Double]] ()
    var x: [Double] = []
    var y: [Double] = []
    func addData(i: Int, j: Int, data: Double) -> Void {
        if(i == 0){
            x.insert(data, at: j)
        }
        else {
            y.insert(data, at: j)
        }
    }
    func getXi() ->Double {
        return x[0]
    }
    func getXn() -> Double {
        return x[x.count-1]
    }
    
    func printData() ->Void {
        for e in x{
            print(e)
        }
        for e in y{
            print(e)
        }
    }
    
    func constructLagrange(n: Int) -> String {
        var count = 0
        let len = x.count
        var numerator = ""
        var denominator = ""
        var firstIteration = true
        while(count < len){
            if(count != n){
                    if(firstIteration == true){
                        numerator = numerator + "(X - " + String(x[count]) + ")"
                        denominator = denominator + "(" + String(x[n]) + " - " + String(x[count]) + ")"
                        firstIteration = false
                    }
                    else {
                        numerator = numerator + "*" + "(X - " + String(x[count]) + ")"
                        denominator = denominator + "*" + "(" + String(x[n]) + " - " + String(x[count]) + ")"
                    }
            }
            count = count + 1
        }
        let f = functionEval()
        return numerator + "/" + String(f.eval(s: denominator))
    }
    
    func contructPolynomial() -> String{
        var acc = ""
        var count = 0
        let len = x.count
        var firstIteration = true
        while(count < len) {
            if(firstIteration == true){
                acc = acc + String(y[count]) + "*" + "(" + constructLagrange(n: count) + ")"
                firstIteration = false
            }
            else {
                 acc = acc + "+" + String(y[count]) + "*" + "(" + constructLagrange(n: count) + ")"
            }
            count = count + 1
        }
        return acc
    }
}
