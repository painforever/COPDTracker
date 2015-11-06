//
//  LabResultsCharts.h
//  COPDTracker
//
//  Created by Yu Song on 11/6/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+SharedUIMethods.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"
@interface LabResultsCharts : UITableViewController<ChartViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lab_type;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *recent_month;
@property (strong, nonatomic) IBOutlet UIView *canvas;
- (IBAction)sliderValueChanged:(id)sender;

- (IBAction)drawAction:(id)sender;
@end
