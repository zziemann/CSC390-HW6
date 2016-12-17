//
//  BreakoutBehavior.swift
//  Breakout
//
//  Created by Zach Ziemann on 12/13/16.
//  Copyright © 2016 Zach Ziemann. All rights reserved.
//

import UIKit

class BreakoutBehavior: UIDynamicBehavior
{
    //initial setups
    private let gravity = UIGravityBehavior()
    
    private let collider: UICollisionBehavior = {
        let collider2 = UICollisionBehavior()
        //collider2.translatesReferenceBoundsIntoBoundary = true
        return collider2
    }()
    
    private let itemBehavior: UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = true
        dib.elasticity = UserSettings.DefaultSettings.ballBounce
        //dib.friction =
        return dib
    }()
    
    //easy way to add barriers to views
    func addBarrier(path: UIBezierPath, named name: String)
    {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    //get the ball moving according to assignment
    func pushBall(ball: BallView)
    {
        print("pushing the ball")
        let clickPush = UIPushBehavior(items: [ball], mode: UIPushBehaviorMode.Instantaneous)
        clickPush.magnitude = 0.15
        clickPush.angle = CGFloat.randomRadian()
        addChildBehavior(clickPush)
    }
    
    func pushBallFromPaddle(ball: BallView)
    {
        let paddlePush = UIPushBehavior(items: [ball], mode: UIPushBehaviorMode.Instantaneous)
        
        let lower =  CGFloat(((90-15) * M_PI)/180)
        let upper = CGFloat(((90+15) * M_PI)/180)
        
        paddlePush.magnitude = UserSettings.DefaultSettings.ballBounce
        
        paddlePush.angle = CGFloat.randomRadian(lower, upper)
        
        addChildBehavior(paddlePush)
    }
    
    //need to start this up and add behaviors
    override init()
    {
        super.init()
        //addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(itemBehavior)
        
    }
    
    func addItem(item: UIDynamicItem)
    {
        //gravity.addItem(item)
        collider.addItem(item)
        itemBehavior.addItem(item)
    }
    
    func removeItem(item: UIDynamicItem)
    {
        //gravity.removeItem(item)
        collider.removeItem(item)
        itemBehavior.removeItem(item)
    }
}

//useful extensions
private extension CGFloat {
    static func randomRadian(lower: CGFloat = 0, _ upper: CGFloat = CGFloat(2 * M_PI)) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
    
    static func degreeToRadian(degree: Double) -> CGFloat {
        return CGFloat((degree * M_PI)/180)
    }
}
