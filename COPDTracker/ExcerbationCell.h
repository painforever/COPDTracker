//
//  ExcerbationCell.h
//  COPDTracker
//
//  Created by Yu Song on 11/5/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExcerbationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *symptom;
@property (weak, nonatomic) IBOutlet UILabel *indensity;
@property (weak, nonatomic) IBOutlet UILabel *start_date;
@property (weak, nonatomic) IBOutlet UILabel *end_date;

@end
