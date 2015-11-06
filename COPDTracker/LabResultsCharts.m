//
//  LabResultsCharts.m
//  COPDTracker
//
//  Created by Yu Song on 11/6/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "LabResultsCharts.h"
@interface LabResultsCharts()
{
    FSLineChart *chartNeedToDraw;
    NSArray *labTypes;
    UIPickerView *pickerView;
}
@end

@implementation LabResultsCharts
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControl];
    
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:10];
    
    for(int i=0;i<101;i++) {
        chartData[i] = [NSNumber numberWithFloat:(float)i / 30.0f + (float)(rand() % 100) / 200.0f];
    }
    
    FSLabelForIndexGetter items = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    FSLabelForValueGetter values = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };

    [self.canvas addSubview:[self draw:chartData withVerticalGridStep:5 withhorizontalGridStep:9 withLabelForIndex:^NSString *(NSUInteger index) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)index];
    } withlabelForValue:^NSString *(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    } withContainerView:self.canvas]];
}

-(FSLineChart *)draw: (NSMutableArray *)data withVerticalGridStep: (NSInteger)verticalGridStep withhorizontalGridStep: (NSInteger)horizontalGridStep withLabelForIndex: (FSLabelForIndexGetter)labelForIndex withlabelForValue: (FSLabelForValueGetter)labelForValue withContainerView: (UIView *)containerView{
    chartNeedToDraw = [[FSLineChart alloc] initWithFrame:CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height)];
    chartNeedToDraw.verticalGridStep = verticalGridStep;
    chartNeedToDraw.horizontalGridStep = horizontalGridStep;
    chartNeedToDraw.labelForIndex = labelForIndex;
    chartNeedToDraw.labelForValue = labelForValue;
    [chartNeedToDraw setChartData: data];
    return chartNeedToDraw;
}

#pragma mark - Creating the charts

-(FSLineChart*)chart1 {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:10];
    
    for(int i=0;i<10;i++) {
        int r = (rand() + rand()) % 1000;
        chartData[i] = [NSNumber numberWithInt:r + 200];
    }
    
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 60, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    lineChart.verticalGridStep = 5;
    lineChart.horizontalGridStep = 9;
    
    lineChart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    [lineChart setChartData:chartData];
    return lineChart;
}

-(FSLineChart*)chart2 {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:101];
    for(int i=0;i<101;i++) {
        chartData[i] = [NSNumber numberWithFloat:(float)i / 30.0f + (float)(rand() % 100) / 200.0f];
    }
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 260, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    lineChart.verticalGridStep = 4;
    lineChart.horizontalGridStep = 2;
    lineChart.color = [UIColor fsOrange];
    lineChart.fillColor = nil;
    
    lineChart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu%%",(unsigned long)item];
    };
    
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f €", value];
    };
    
    [lineChart setChartData:chartData];
    return lineChart;
}

-(FSLineChart*)chart3 {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:7];
    for(int i=0;i<7;i++) {
        chartData[i] = [NSNumber numberWithFloat: (float)i / 30.0f + (float)(rand() % 100) / 500.0f];
    }
    
    NSArray* months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July"];
    
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 500, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    lineChart.verticalGridStep = 6;
    lineChart.horizontalGridStep = 3; // 151,187,205,0.2
    lineChart.color = [UIColor colorWithRed:151.0f/255.0f green:187.0f/255.0f blue:205.0f/255.0f alpha:1.0f];
    lineChart.fillColor = [lineChart.color colorWithAlphaComponent:0.3];
    
    lineChart.labelForIndex = ^(NSUInteger item) {
        return months[item];
    };
    
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.02f €", value];
    };
    
    [lineChart setChartData:chartData];
    return lineChart;
}

-(void)setUpControl{
    labTypes = @[@"Alpha 1 antitrypsin", @"Arterial blood gas test", @"Blood culture", @"Brain natriuretic", @"CBC", @"Cardiac enzyme measurement", @"Chest CT", @"Chest X-ray", @"Electrocardiography", @"Exhaled nitric oxide", @"Metabolic panel", @"Pulse oximetry", @"Sputum culture"];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [self buildCustomPickerView: pickerView withArray:nil withUITextField:self.lab_type withDoneButton:doneBtn];
}

#pragma Picker view
#pragma custom picker views
-(void)pickerDoneClicked{
    NSLog(@"Done Clicked");
    [self.lab_type resignFirstResponder];
    pickerView.hidden=YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [labTypes count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [labTypes objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.lab_type.text = [labTypes objectAtIndex:row];
}


- (IBAction)sliderValueChanged:(id)sender {
    self.recent_month.text = [NSString stringWithFormat:@"Recent %d month", (int)self.slider.value];
}

- (IBAction)drawAction:(id)sender {
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:10];
    
    for(int i=0;i<101;i++) {
        chartData[i] = [NSNumber numberWithFloat:(float)i / 30.0f + (float)(rand() % 100) / 200.0f];
    }
    
    FSLabelForIndexGetter items = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    FSLabelForValueGetter values = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    [self.canvas addSubview:[self draw:chartData withVerticalGridStep:5 withhorizontalGridStep:9 withLabelForIndex:^NSString *(NSUInteger index) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)index];
    } withlabelForValue:^NSString *(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    } withContainerView:self.canvas]];
}
@end
