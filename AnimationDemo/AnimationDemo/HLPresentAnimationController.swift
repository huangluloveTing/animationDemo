//
//  HLPresentAnimationController.swift
//  AnimationDemo
//
//  Created by 黄露 on 2017/1/22.
//  Copyright © 2017年 黄露. All rights reserved.
//

import UIKit

class HLPresentAnimationController: NSObject  {
    
    public var initialFrame:CGRect!

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let fromeView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        let snapView = toView?.snapshotView(afterScreenUpdates: true)
        
        snapView?.frame = initialFrame
        snapView?.layer.cornerRadius = 10
        
        container.addSubview(snapView!)
        container.addSubview(toView!)
        toView?.isHidden = true
        
//        UIView.animate(withDuration: 0.3) { 
//            <#code#>
//        }
    }
    
}
