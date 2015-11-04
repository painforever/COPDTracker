//
//  AdverseEventCell.h
//  COPDTracker
//
//  Created by Yu Song on 11/4/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdverseEventCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *report_date;
@property (weak, nonatomic) IBOutlet UILabel *related_drug;
@property (weak, nonatomic) IBOutlet UILabel *side_effects;

@end
