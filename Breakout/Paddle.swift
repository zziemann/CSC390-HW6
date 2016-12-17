//
//  Paddle.swift
//  Breakout
//
//  Created by Zach Ziemann on 12/13/16.
//  Copyright © 2016 Zach Ziemann. All rights reserved.
//

import UIKit

class Paddle: UIView
{
    //set info
    init(myView: UIView)
    {
        super.init(frame: CGRectZero)
        
        backgroundColor = UIColor.greenColor()
        
        frame = CGRect(origin: CGPointZero, size: CGSize(width: 80,height: 18))
        frame.origin.x = myView.bounds.maxX/2
        frame.origin.y = myView.bounds.maxY/1.01
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    func paddleLocation(velocity: CGFloat)
    {
        self.center = CGPoint(x: (velocity/30) + self.center.x , y: self.center.y)
    }
   
    
}
