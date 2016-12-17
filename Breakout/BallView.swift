//
//  BallView.swift
//  Breakout
//
//  Created by Zach Ziemann on 12/13/16.
//  Copyright © 2016 Zach Ziemann. All rights reserved.
//

import UIKit

class BallView: UIView {

    //setup of ball settings
    init(myView: UIView)
    {
        super.init(frame: CGRectZero)
        
        backgroundColor = UserSettings.DefaultSettings.ballColor
        
        frame = CGRect(origin: CGPointZero, size: CGSize(width: 18,height: 18))
        frame.origin.x = myView.bounds.midX
        frame.origin.y = myView.bounds.midY
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
