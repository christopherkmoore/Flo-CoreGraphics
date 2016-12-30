//
//  Push-ButtonView.swift
//  Flo-CoreGraphics
//
//  Created by modelf on 12/29/16.
//  Copyright © 2016 ChristopherMoore. All rights reserved.
//

import UIKit

@IBDesignable class Push_ButtonView: UIButton {

    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        var plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeight
        
        plusPath.move(to: CGPoint(x: bounds.width/2 - plusWidth/2, y: bounds.height/2))
        
        plusPath.addLine(to: CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2))
        
        if (isAddButton) {
            plusPath.move(to: CGPoint(x:bounds.height/2, y: bounds.height/2 - plusWidth/2))
            plusPath.addLine(to: CGPoint(x: bounds.width/2, y: bounds.height/2 + plusWidth/2))
        }
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }

}
