//
//  BreakoutView.swift
//  Breakout
//
//  Created by Zach Ziemann on 12/13/16.
//  Copyright © 2016 Zach Ziemann. All rights reserved.
//

import UIKit

class BreakoutView: UIView, UIDynamicAnimatorDelegate
{
    //Random functions
    func randomNum(max: Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
    
    var randomColor: UIColor {
        switch arc4random()%5 {
        case 0: return UIColor.greenColor()
        case 1: return UIColor.blueColor()
        case 2: return UIColor.orangeColor()
        case 3: return UIColor.redColor()
        case 4: return UIColor.purpleColor()
        default: return UIColor.blackColor()
        }
    }
    
    //Brick functionality
    private let bricksPerRow = 10
    private let bricksPerColumn = 12
    
    private var brickSize: CGSize {
        let size = bounds.size.width / CGFloat(bricksPerRow)
        return CGSize(width: size, height: size / UserSettings.DefaultSettings.brickHeight)
    }
    
    func makeBricks(numBricks: Int)
    {
        var bricksLeft = numBricks
        
        print("Width: \(bounds.width)")
        print("Height: \(bounds.height)")
        
        while bricksLeft >= 0 {
            var frame = CGRect(origin: CGPoint.zero, size: brickSize)
            frame.origin.x = randomNum(bricksPerRow) * brickSize.width
            frame.origin.y = randomNum(bricksPerColumn) * brickSize.height
            
        
            let drop = UIView(frame: frame)
            drop.backgroundColor = randomColor
            breakoutBehavior.addBarrier( UIBezierPath(rect: frame), named: "BrickBoundary \(bricksLeft)")
        
            addSubview(drop)
            
            bricksLeft = bricksLeft - 1
        }
        
    }
    
    //BALL-ANIMATIONS STUFF
    
    let breakoutBehavior = BreakoutBehavior()
    
    private lazy var animator: UIDynamicAnimator =
    {
        let animator2 = UIDynamicAnimator(referenceView: self)
        animator2.delegate = self
        return animator2
    }()
    
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        //what we do when all animation stopped
    }
    
    var animating: Bool = false
        {
        didSet
        {
            if animating
            {
                animator.addBehavior(breakoutBehavior)
            }
            else
            {
                animator.removeBehavior(breakoutBehavior)
            }
        }
    }
}

//Useful Extension
extension UIView {
        func hitTest(p: CGPoint) -> UIView? {
            return hitTest(p, withEvent: nil)
        }
    }
















