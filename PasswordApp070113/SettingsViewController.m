//
//  SettingsViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
{
    NSArray *autoLogoutIntervals;
    NSDictionary *autoLogoutIntervalsInSeconds;
    NSIndexPath *selectedIndexPath;
}

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (autoLogoutIntervals == nil)
    {
        //autoLogoutIntervals = [NSArray arrayWithObjects:@"5 Seconds", @"15 Seconds", @"30 Seconds", @"1 Minute", @"2 Minutes", nil];
        autoLogoutIntervals = @[@"5 Seconds", @"15 Seconds", @"30 Seconds", @"1 Minute", @"2 Minutes"];
    }
    
    if (autoLogoutIntervalsInSeconds == nil)
    {
        
        /*   autoLogoutIntervalsInSeconds = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:
         [NSNumber numberWithInt:5],
         [NSNumber numberWithInt:15],
         [NSNumber numberWithInt:30],
         [NSNumber numberWithInt:60],
         [NSNumber numberWithInt:120], nil] forKeys:autoLogoutIntervals];*/
        
        autoLogoutIntervalsInSeconds = [[NSDictionary alloc] initWithObjects:@[
                                        [NSNumber numberWithInt:5],
                                        [NSNumber numberWithInt:15],
                                        [NSNumber numberWithInt:30],
                                        [NSNumber numberWithInt:60],
                                        [NSNumber numberWithInt:120]] forKeys:autoLogoutIntervals];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *autoLogoutIntervalAsString = [defaults objectForKey:@"autoLogoutIntervalAsString"];
    
    if ( autoLogoutIntervalAsString == nil)
    {
        selectedIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    }
    else {
        for (int i = 0; i < autoLogoutIntervals.count; i++) {
            NSString *interval = autoLogoutIntervals[i];
            if ([interval isEqualToString: autoLogoutIntervalAsString])
            {
                selectedIndexPath = [NSIndexPath indexPathForRow:i  inSection:0];
            }
        }
        
    }
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell...
    cell.textLabel.text = autoLogoutIntervals[indexPath.row];
    
    if ([indexPath isEqual:selectedIndexPath])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [cell.textLabel setTextColor:[UIColor blueColor]];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell.textLabel setTextColor:[UIColor  blackColor]];
        
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigtionController pushViewController:detailViewController animated:YES];
     */
    
    
    selectedIndexPath = indexPath;
    
    [tableView reloadData];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* intervalAsString = autoLogoutIntervals[indexPath.row];
    NSNumber* intervalInSeconds = autoLogoutIntervalsInSeconds[intervalAsString];
    [defaults setObject:intervalAsString forKey:@"autoLogoutIntervalAsString"];
    [defaults setObject:intervalInSeconds forKey:@"autoLogoutInervalInSeconds"];
}


@end
