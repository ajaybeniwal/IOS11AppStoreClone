//
//  ModelTransitionAnimator.swift
//  IOS11AppStoreClone
//
//  Created by Ajay Singh on 16/5/18.
//  Copyright © 2018 Ajay Singh. All rights reserved.
//

import UIKit

class ModelTransitionAnimator:NSObject,UIViewControllerAnimatedTransitioning{
    let duration = 0.8
    var presenting = true
    var originFrame = CGRect.zero
    var dismissCompletion: (()->Void)?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        containerView.addSubview(toView)
        /*Setting to view frame */
        toView.frame = CGRect(x: 0, y: toView.frame.height, width: toView.frame.width, height: 0)
        //  toView.alpha = 0
        toView.layoutIfNeeded()
        UIView.animate(withDuration: duration, delay:0.0,
                       usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0,
                       animations: {
                        toView.frame = fromView.frame
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
        
        
    }
    
    
}
