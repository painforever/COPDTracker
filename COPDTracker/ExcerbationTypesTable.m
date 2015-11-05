//
//  ExcerbationTypesTable.m
//  COPDTracker
//
//  Created by Yu Song on 11/5/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "ExcerbationTypesTable.h"
@interface ExcerbationTypesTable()
{
    NSArray *types;
}
@end
@implementation ExcerbationTypesTable
@synthesize parent;
-(void)viewDidLoad{
    types = @[@"Change in volumn,color,tenacity of sputum", @"Chest pain", @"Chest tightness", @"Chronic cough", @"Chronic sputum production", @"Confusion", @"Decreased exercise tolerance", @"Dyspnea/shortness of breath at rest", @"Dyspnea/shortness of breath with activity", @"Failure of therapy to improve existing symptom", @"Fatigue", @"Fever", @"Increased coughing", @"Malaise", @"More dypsnea or shortness of breath", @"Sleepiness during day", @"Tachycardia", @"Tachypnea", @"Trouble sleeping", @"Wheezing"];
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return types.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *type = [types objectAtIndex:indexPath.row];
    cell.textLabel.text = type;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.parent.symptom.text = [types objectAtIndex: indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
