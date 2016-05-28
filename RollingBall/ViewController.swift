//
//  ViewController.swift
//  RollingBall
//
//  Created by VietHung on 5/28/16.
//  Copyright © 2016 VietHung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadius = CGFloat()
    var flag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        let time = NSTimer.scheduledTimerWithTimeInterval(0.015, target: self, selector: Selector("rollBall"), userInfo: nil, repeats: true)
    }

    func addBall(){
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadius = 32.0
        ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }

    func rollBall(){
        print(ball.center.x)
        let deltaAngle: CGFloat = 0.1
        if(flag == 0){
            radians = radians + deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y)
        }
        if(ball.center.x >= self.view.bounds.size.width - 32){
            flag = 1
        }
        if(flag == 1){
            radians = radians - deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x, ball.center.y + ballRadius * deltaAngle)
        }
        if(ball.center.y >= self.view.bounds.size.height - 32){
            flag = 2
        }
        if(flag == 2){
            radians = radians - deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x - ballRadius * deltaAngle, ball.center.y)
        }
        if(ball.center.x <= 32 && ball.center.y >= self.view.bounds.size.width - 32){
            flag = 3
        }
        if(flag == 3){
            radians = radians - deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x, ball.center.y - ballRadius * deltaAngle)
        }
        if(ball.center.x <= 32 && ball.center.y <= 32){
            flag = 4
        }
        if(flag == 4){
            radians = radians - deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle, ball.center.y)
        }
    }
}

