//
//  CounterView.swift
//  Flo-CoreGraphics
//
//  Created by modelf on 12/29/16.
//  Copyright © 2016 ChristopherMoore. All rights reserved.
//

import UIKit


class CounterView: UIView {

    let NoOfGlasses = 8
    let π: CGFloat = CGFloat(M_PI)
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= NoOfGlasses {
                setNeedsDisplay()
            }
            if counter == 0  {
                outlineColor = counterColor
            } else {
                outlineColor = UIColor.blue
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        let center: CGPoint = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let arcWidth: CGFloat = 76
        
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        var path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //outline
        
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        var outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.saveGState()
        outlineColor.setFill()
        
        let markerWidth: CGFloat = 5.0
        let markerSize: CGFloat = 10.0
        
        //marker rectangle positioned at top left
        var markerPath = UIBezierPath(rect: CGRect(x: -markerWidth/2, y: 0, width: markerWidth, height: markerSize))
        
        context?.translateBy(x: rect.width/2, y: rect.height/2)
        
        //gunna have to draw a few times
        for i in 1...NoOfGlasses {
            context?.saveGState()
            
            //calculate rotation angle
            var angle = arcLengthPerGlass * CGFloat(i) + startAngle - π/2
            
            //rotate and translate
            context?.rotate(by: angle)
            context?.translateBy(x: 0, y: rect.height/2 - markerSize)
            markerPath.fill()
            
            context?.restoreGState()
        }
        context?.restoreGState()
        
        

        
    }
    
}
