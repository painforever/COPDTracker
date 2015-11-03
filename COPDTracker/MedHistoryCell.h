//
//  MedHistoryCell.h
//  COPDTracker
//
//  Created by Yu Song on 10/29/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedHistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *drug_name;
@property (weak, nonatomic) IBOutlet UILabel *route_name;
@property (weak, nonatomic) IBOutlet UILabel *dosage;
@property (weak, nonatomic) IBOutlet UILabel *start_date;
@property (weak, nonatomic) IBOutlet UILabel *end_date;

@end
