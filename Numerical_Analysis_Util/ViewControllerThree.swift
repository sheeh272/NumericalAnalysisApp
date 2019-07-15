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
        initializeGraph()
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
        graphFunction(i: i)
    }
    
    @IBOutlet weak var ImageView: UIImageView!
    
    func graphFunction(i: interpolation){
         //initializeGraph()
         let f = functionEval()
         let xi = i.getXi()
         let xn = i.getXn()
         let fx = i.contructPolynomial()
         let renderer = UIGraphicsImageRenderer(size: CGSize(width: ImageView.bounds.width, height: ImageView.bounds.height))
         let xOffset = ImageView.bounds.width / 2
         let yOffset = ImageView.bounds.height / 2
         let img = renderer.image { ctx in
            //redraw graph axis
            ctx.cgContext.move(to: CGPoint(x: 0, y: ImageView.bounds.height/2))
            ctx.cgContext.addLine(to: CGPoint(x: ImageView.bounds.width, y: ImageView.bounds.height/2))
            ctx.cgContext.setStrokeColor(UIColor.gray.cgColor)
            ctx.cgContext.strokePath()
            ctx.cgContext.move(to: CGPoint(x: ImageView.bounds.width/2, y: 0))
            ctx.cgContext.addLine(to: CGPoint(x: ImageView.bounds.width/2, y: ImageView.bounds.height))
            ctx.cgContext.strokePath()
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            //graph interpolant
            var x = xi
            let y = f.evalX(s: fx, x: String(x))
            let pt = CGPoint(x: x+Double(xOffset), y: -1*y+Double(yOffset))
            ctx.cgContext.move(to: pt)
            x = x + 0.1
            while(x < xn){
                let y = f.evalX(s: fx, x: String(x))
                let pt = CGPoint(x: x+Double(xOffset), y: -1*y+Double(yOffset))
                ctx.cgContext.addLine(to: pt)
                x = x + 0.1
            }
            ctx.cgContext.strokePath()
    }
        ImageView.image = img
    }
    
    func initializeGraph(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: ImageView.bounds.width, height: ImageView.bounds.height))
        let img = renderer.image { ctx in
        ctx.cgContext.move(to: CGPoint(x: 0, y: ImageView.bounds.height/2))
        ctx.cgContext.addLine(to: CGPoint(x: ImageView.bounds.width, y: ImageView.bounds.height/2))
        ctx.cgContext.setStrokeColor(UIColor.gray.cgColor)
        ctx.cgContext.strokePath()
        ctx.cgContext.move(to: CGPoint(x: ImageView.bounds.width/2, y: 0))
        ctx.cgContext.addLine(to: CGPoint(x: ImageView.bounds.width/2, y: ImageView.bounds.height))
        ctx.cgContext.strokePath()
        }
        ImageView.image = img
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
