//
//  ViewController.swift
//  AnimationDemo
//
//  Created by 黄露 on 2017/1/14.
//  Copyright © 2017年 黄露. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,CAAnimationDelegate{
    
    @IBOutlet weak var sunView: UIView!
    
    var currentVC : UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customVC : CustomViewController = CustomViewController.init()
        self.addChildViewController(customVC)
        
        let cusVC  = CuViewController.init()
        cusVC.view.backgroundColor = UIColor.green
        self.addChildViewController(cusVC)
//        self.view.addSubview(cusVC.view)
        self.currentVC = cusVC
        
        let but = UIButton.init(type: UIButtonType.custom)
        but.addTarget(self, action: #selector(tapBtnAction), for: UIControlEvents.touchUpInside)
        but.backgroundColor = UIColor.red
        but.frame = CGRect.init(x: 0, y: 70, width: 50, height: 30)
        //        but.center = self.view.center;
        self.view.addSubview(but)
        
        let swipGesture1 = UISwipeGestureRecognizer.init(target: self, action: #selector(gestureAction(sender:)))
        
        self.sunView.backgroundColor = UIColor.red
        swipGesture1.direction = .left
        self.view.addGestureRecognizer(swipGesture1)
        
        let swipGesture2 = UISwipeGestureRecognizer.init(target: self, action: #selector(gestureAction(sender:)))
        swipGesture2.direction = .right
        self.view.addGestureRecognizer(swipGesture2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func gestureAction(sender:UISwipeGestureRecognizer) -> Void {
     
        if sender.direction == .right {
            
            let transiton : CATransition = CATransition.init()
            transiton.type = kCATransitionPush;
            transiton.duration = 0.3
            transiton.subtype = kCATransitionFromLeft
            transiton.delegate = self
            self.sunView.backgroundColor = UIColor.init(red: CGFloat(arc4random() % 255) / CGFloat(255) , green:  CGFloat(arc4random() % 255) / CGFloat(255) , blue:  CGFloat(arc4random() % 255) / CGFloat(255), alpha: 1)
            self.view.layer.add(transiton, forKey: "animLeft")
        }
        
        if sender.direction == .left {
            
            let transiton : CATransition = CATransition.init()
            transiton.type = kCATransitionPush;
            transiton.duration = 0.3
            transiton.subtype = kCATransitionFromRight
            transiton.delegate = self
            self.sunView.backgroundColor = UIColor.init(red: CGFloat(arc4random() % 255) / CGFloat(255) , green:  CGFloat(arc4random() % 255) / CGFloat(255) , blue:  CGFloat(arc4random() % 255) / CGFloat(255), alpha: 1)
            self.view.layer.add(transiton, forKey: "animRight")
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("animation stop key : ")
        
    }
    
    func tapBtnAction()  {
        self.sunView.layer.transform = CATransform3DIdentity
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {

            self.sunView.layer.transform = self.transform1()
            
        }, completion: {(finished) in

            UIView.animate(withDuration: 0.3, animations: { 
 
                self.sunView.layer.transform = self.transform2()
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, animations: { 
                    self.sunView.layer.transform = self.transform1()
                }, completion: { (finished) in
                    UIView.animate(withDuration: 0.5, animations: { 
                        self.sunView.layer.transform = CATransform3DIdentity
                    })
                })
                
            })
        })
        
    }
    @IBOutlet weak var rightBtnAction: UIBarButtonItem!
    
    /**
     - 仿淘宝选择规格动画
    */
    
    //第一次形变
    func transform1() -> CATransform3D {
        var trans = CATransform3DIdentity
        
        //m34 就是实现视图的透视效果的（俗称近大远小）
        trans.m34 = -1.0 / 900
        //缩小效果
        trans = CATransform3DScale(trans, 0.95, 0.95, 1)
        //x 轴旋转
        trans = CATransform3DRotate(trans, CGFloat(M_PI / 180.0 * 15), 1, 0, 0)
        return trans
    }
    
    //第二次形变
    func transform2() -> CATransform3D {
        var trans = CATransform3DIdentity
        //用上面用到的m34 来设置透视效果
        trans.m34 = self.transform1().m34
        //向上平移一点
        trans = CATransform3DTranslate(trans, 0, -30, 0)
        //最终再次缩小到0.75倍
        trans = CATransform3DScale(trans, 0.8, 0.8, 1)
        return trans
    }
}

