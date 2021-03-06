//
//  ScottFadeScaleAnimation.m
//  QQLive
//
//  Created by Scott_Mr on 2016/12/1.
//  Copyright © 2016年 Scott. All rights reserved.
//

#import "ScottScaleFadeAnimation.h"

@implementation ScottScaleFadeAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}


- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    ScottAlertViewController *alertController = (ScottAlertViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    alertController.backgroundView.alpha = 0.0;
    
    switch (alertController.preferredStyle) {
        case ScottAlertControllerStyleAlert:{
            alertController.alertView.alpha = 0.0;
            alertController.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        }
            break;
        case ScottAlertControllerStyleActionSheet:{
            alertController.alertView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.alertView.frame));
        }
            break;
        default:
            break;
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        alertController.backgroundView.alpha = 1.0;
        switch (alertController.preferredStyle) {
            case ScottAlertControllerStyleAlert:
                alertController.alertView.alpha = 1.0;
                alertController.alertView.transform = CGAffineTransformIdentity;
                break;
            case ScottAlertControllerStyleActionSheet:
                alertController.alertView.transform = CGAffineTransformIdentity;
                break;
            default:
                break;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)dismissAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    ScottAlertViewController *alertController = (ScottAlertViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        alertController.backgroundView.alpha = 0.0;
        switch (alertController.preferredStyle) {
            case ScottAlertControllerStyleAlert:
                alertController.alertView.alpha = 0.0;
                alertController.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                break;
            case ScottAlertControllerStyleActionSheet:
                alertController.alertView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.alertView.frame));
                break;
            default:
                break;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
