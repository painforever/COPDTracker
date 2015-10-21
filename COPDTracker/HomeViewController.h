//
//  HomeViewController.h
//  COPDTracker
//
//  Created by Yu Song on 10/21/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *lab_result;
@property (weak, nonatomic) IBOutlet UIView *medical_history;
@property (weak, nonatomic) IBOutlet UIView *side_effects;
@property (weak, nonatomic) IBOutlet UIView *charts;
@end
