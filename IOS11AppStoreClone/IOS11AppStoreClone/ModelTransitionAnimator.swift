//
//  ModelTransitionAnimator.swift
//  IOS11AppStoreClone
//
//  Created by Ajay Singh on 16/5/18.
//  Copyright © 2018 Ajay Singh. All rights reserved.
//

import UIKit

class ModelTransitionAnimator:NSObject,UIViewControllerAnimatedTransitioning{
    private var edgeLayoutConstraints: NSEdgeLayoutConstraints?
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
        let modalView: UIView = presenting ? toView : fromView
        containerView.addSubview(toView)
        containerView.layer.cornerRadius=0
        let underLineTableView:UITableView = modalView.subviews[0] as! UITableView
        underLineTableView.layer.cornerRadius = 0;
        
        containerView.bringSubview(toFront: modalView)
        if(!presenting){
            edgeLayoutConstraints?.constants(to: 0)
            let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8)
            animator.addAnimations {
                underLineTableView.layer.cornerRadius = 10;
                underLineTableView.layer.masksToBounds = true
               // modalView.layer.cornerRadius = 10
               // modalView.layer.masksToBounds = true
                self.edgeLayoutConstraints?.match(to: self.originFrame,
                                             container: containerView)
                
                containerView.layoutIfNeeded()
                modalView.layoutIfNeeded()
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
        }
        else{
            modalView.translatesAutoresizingMaskIntoConstraints = false
            edgeLayoutConstraints = NSEdgeLayoutConstraints(view: modalView,
                                                            container: containerView,
                                                            frame: originFrame)
            edgeLayoutConstraints?.toggleConstraints(true)
            containerView.layoutIfNeeded()
            modalView.layoutIfNeeded()
            let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8)
            animator.addAnimations {
                self.edgeLayoutConstraints?.constants(to: 0)
                containerView.layoutIfNeeded()
                modalView.layoutIfNeeded()
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
        }
    }
    
    
}
