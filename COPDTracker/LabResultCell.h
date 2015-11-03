//
//  LabResultCell.h
//  COPDTracker
//
//  Created by Yu Song on 10/29/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabResultCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *test_type;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UILabel *test_date;
@property (weak, nonatomic) IBOutlet UILabel *unit;

@end
