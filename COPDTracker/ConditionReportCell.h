//
//  ConditionReportCell.h
//  COPDTracker
//
//  Created by Yu Song on 10/28/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConditionReportCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *smoked;
@property (weak, nonatomic) IBOutlet UILabel *secondhand_smoke;
@property (weak, nonatomic) IBOutlet UILabel *stay_in_pollution;

@property (weak, nonatomic) IBOutlet UILabel *exertional_breathless;
@property (weak, nonatomic) IBOutlet UILabel *chronic_cough;
@property (weak, nonatomic) IBOutlet UILabel *regular_sputum;
@property (weak, nonatomic) IBOutlet UILabel *frequent_winter_bronchitis;
@property (weak, nonatomic) IBOutlet UILabel *wheeze;
@property (weak, nonatomic) IBOutlet UILabel *date_reported;
@end
