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
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        let containerFrame = containerView.frame
        var toViewStartFrame = transitionContext.initialFrame(for: toViewController!)
        let toViewEndFrame = transitionContext.finalFrame(for: toViewController!)
        toViewStartFrame.origin.x = originFrame.origin.x
        toViewStartFrame.origin.y = originFrame.origin.y
        
        containerView.addSubview(toView)
        toView.frame = toViewStartFrame
       UIView.animate(withDuration: 0.9, delay:0.0,
                       usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0,
                       animations: {
                        toView.frame = toViewEndFrame
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
        containerView.layoutIfNeeded()
        toView.layoutIfNeeded()
        
     /*   let top:NSLayoutConstraint = toView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: originFrame.minY)
        let left:NSLayoutConstraint = toView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: originFrame.minX)
        let bottom:NSLayoutConstraint = toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: originFrame.maxY - containerView.frame.height)
        
        let right = toView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: originFrame.maxY - originFrame.maxX - containerView.frame.width)*/
        
        
        
      /*  toView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(toView)
        let top:NSLayoutConstraint = toView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 150)
        let left:NSLayoutConstraint = toView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30)
        let bottom:NSLayoutConstraint = toView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 50)
        let right = toView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 40)
        top.isActive = true
        left.isActive = true
        bottom.isActive = true
        right.isActive = true
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8)
        animator.addAnimations {
            top.constant = 50;
            left.constant = 50;
            bottom.constant = 0;
            right.constant = 0;
            toView.layoutIfNeeded()
            containerView.layoutIfNeeded()
        }
        animator.addCompletion { position in
            switch position {
            case .end:
                transitionContext.completeTransition(true)
            default:
                transitionContext.completeTransition(true)
            }
        }
        animator.startAnimation()*/
        
    }
    
    
}
