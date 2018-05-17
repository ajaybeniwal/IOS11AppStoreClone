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
        toView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(toView)
        let top:NSLayoutConstraint = toView.topAnchor.constraint(equalTo: containerView.topAnchor, constant:originFrame.minY)
        let left:NSLayoutConstraint = toView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: originFrame.minX)
        let bottom:NSLayoutConstraint = toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: originFrame.maxY - containerView.frame.height)
        let right = toView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: originFrame.maxX - containerView.frame.width)
        top.isActive = true
        left.isActive = true
        bottom.isActive = true
        right.isActive = true
        containerView.layoutIfNeeded()
        toView.layoutIfNeeded()
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8)
        animator.addAnimations {
            top.constant = 0;
            left.constant = 0;
            bottom.constant = 0;
            right.constant = 0;
            containerView.layoutIfNeeded()
            toView.layoutIfNeeded()
            
        }
        animator.addCompletion { position in
            switch position {
            case .end:
                transitionContext.completeTransition(true)
            default:
                transitionContext.completeTransition(true)
            }
        }
        animator.startAnimation()
        //transitionContext.completeTransition(true)
    }
    
    
}
