//
//  ViewController.swift
//  Flo-CoreGraphics
//
//  Created by modelf on 12/29/16.
//  Copyright © 2016 ChristopherMoore. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var label: UILabel!

    var isGraphShowing = true
    
    @IBAction func counterTap(gesture: UITapGestureRecognizer?) {
        if (isGraphShowing) {
            UIView.transition(from: graphView, to: counterView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            print("if firing")
        } else {
            UIView.transition(from: counterView, to: graphView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            print("else firing")
        }
        print(isGraphShowing)
        isGraphShowing = !isGraphShowing
    }
    
    @IBAction func buttonPush(button: Push_ButtonView) {
        if (button.isAddButton) {
            if counterView.counter < 8 {
                counterView.counter += 1
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        label.text = "\(counterView.counter)"
        if isGraphShowing {
            counterTap(gesture: nil)
        }
            
    }
    
    override func viewDidLoad() {
        label.text = String(counterView.counter)
    }
    
    
    
}
