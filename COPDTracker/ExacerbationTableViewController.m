//
//  ExacerbationTableViewController.m
//  COPDTracker
//
//  Created by Yu Song on 10/29/15.
//  Copyright © 2015 EFA. All rights reserved.
//

#import "ExacerbationTableViewController.h"

@interface ExacerbationTableViewController ()
{
    NSMutableArray *table_date;
}
@end

@implementation ExacerbationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AFNetwork getAFManager] GET:[SERVER_URL stringByAppendingString:@"excerbations"] parameters:@{@"patient_id" : [userDefaults valueForKey:@"patient_id"]} success:^(AFHTTPRequestOperation * operation, id responseObject) {
        table_date = (NSMutableArray *)responseObject;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return table_date.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExcerbationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dic = [table_date objectAtIndex:indexPath.row];
    cell.symptom.text = [NSString stringWithFormat:@"Symptom: %@", dic[@"symptom"]];
    cell.start_date.text = [NSString stringWithFormat:@"start date: %@", dic[@"start_date"]];
    cell.end_date.text = [NSString stringWithFormat:@"end date: %@", dic[@"end_date"]];
    cell.indensity.text = [NSString stringWithFormat:@"instendity: %@", dic[@"intensity"]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addExacerbationButtonAction:(id)sender {
    self.neoExacerbationForm = [self.storyboard instantiateViewControllerWithIdentifier:@"NewExacerbationTableViewController"];
    [self.navigationController pushViewController:self.neoExacerbationForm animated:YES];
}
@end
