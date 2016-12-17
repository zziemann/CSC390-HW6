//
//  BreakoutViewController.swift
//  Breakout
//
//  Created by Zach Ziemann on 12/13/16.
//  Copyright © 2016 Zach Ziemann. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        addPaddle()
        updatePaddleBoundary()
        addGameViewBoundary()
        gameView.makeBricks(UserSettings.DefaultSettings.numBricks)

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var gameView: BreakoutView! {
        didSet {
            gameView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addPush(_:))))
            gameView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(movePaddle(_:))))
        }
    }
    
    //creating our paddle so we can access it
    var paddle: Paddle?
    
    func addPaddle()
    {
        paddle = Paddle(myView: gameView)
        gameView.addSubview(paddle!)
        
    }
    
    
    //creating our ball so we can access it
    var ball: BallView?
    
    func addBall()
    {
        ball = BallView(myView: gameView)
        gameView.addSubview(ball!)
        gameView.breakoutBehavior.addItem(ball!)
        
    }
    
    //the paddle moves so we update the boundary around it as it moves
    private func updatePaddleBoundary()
    {
        gameView.breakoutBehavior.addBarrier(UIBezierPath(rect: paddle!.frame), named: "PaddleBoundry")
    }
    
    func movePaddle(recognizer: UIPanGestureRecognizer)
    {
        if recognizer.state == .Changed {
            //print(recognizer.velocityInView(gameView).x)
            //print(recognizer.translationInView(gameView).x)
            updatePaddleBoundary()
            paddle?.paddleLocation(recognizer.velocityInView(gameView).x)            
        }
    }
    
    //getting boundaries around the top, right, left but not bottom cause it's not supposed to bounce
    private func addGameViewBoundary() {
        let gameViewPathLeft = UIBezierPath()
        gameViewPathLeft.moveToPoint(CGPoint(x: gameView.bounds.origin.x, y: gameView.bounds.size.height))
        gameViewPathLeft.addLineToPoint(CGPoint(x: gameView.bounds.origin.x, y: gameView.bounds.origin.y))
        
        let gameViewPathTop = UIBezierPath()
        gameViewPathTop.moveToPoint(CGPoint(x: gameView.bounds.origin.x, y: gameView.bounds.origin.y))
        gameViewPathTop.addLineToPoint(CGPoint(x: gameView.bounds.size.width, y: gameView.bounds.origin.y))
        
        let gameViewPathRight = UIBezierPath()
        gameViewPathRight.moveToPoint(CGPoint(x: gameView.bounds.size.width, y: gameView.bounds.origin.y))
        gameViewPathRight.addLineToPoint(CGPoint(x: gameView.bounds.size.width, y: gameView.bounds.size.height))
        
        gameView.breakoutBehavior.addBarrier(gameViewPathLeft, named: "LeftBoundry")
        gameView.breakoutBehavior.addBarrier(gameViewPathTop, named: "TopBoundry")
        gameView.breakoutBehavior.addBarrier(gameViewPathRight, named: "RightBoundry")
    }
    
    //gesture recognizer
    func addPush(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .Ended {
            gameView.breakoutBehavior.pushBall(ball!)
        }
    }
    
    
    //controlling and checking animation
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        gameView.animating = true
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        gameView.animating = false 
    }

}
