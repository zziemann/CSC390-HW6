//
//  SettingsViewController.swift
//  Breakout
//
//  Created by Zach Ziemann on 12/13/16.
//  Copyright © 2016 Zach Ziemann. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    
    @IBAction func BouncyMode(sender: UISwitch)
    {
        if sender.on  == true
        {
            UserSettings.DefaultSettings.ballBounce = 0.9
        }
        else
        {
            UserSettings.DefaultSettings.ballBounce = 0.8
        }
    }
    @IBAction func BallColor(sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
        case 0:
            UserSettings.DefaultSettings.ballColor = UIColor.cyanColor()
        case 1:
            UserSettings.DefaultSettings.ballColor = UIColor.brownColor()
        case 2:
            UserSettings.DefaultSettings.ballColor = UIColor.purpleColor()
        default:
            UserSettings.DefaultSettings.ballColor = UIColor.purpleColor()
        }
        
    }
    
    @IBAction func BrickNumber(sender: UISlider)
    {
        UserSettings.DefaultSettings.brickHeight *= CGFloat(sender.value)
    }
    
    @IBAction func BrickSize(sender: UISegmentedControl)
    {
        switch sender.selectedSegmentIndex
        {
        case 0:
            UserSettings.DefaultSettings.brickHeight = 3
        case 1:
            UserSettings.DefaultSettings.brickHeight  = 2
        case 2:
            UserSettings.DefaultSettings.brickHeight  = 1.5
        default:
            UserSettings.DefaultSettings.brickHeight  = 2
        }
    }
    
    
    
    
}
