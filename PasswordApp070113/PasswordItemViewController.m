//
//  PasswordItemViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import "PasswordItemViewController.h"
#import "EditPasswordViewController.h"
#import "AddPasswordViewController.h"

@interface PasswordItemViewController ()

@end

@implementation PasswordItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *date1 = @"17-03-2000";
    NSString *date2 = @"20-03-2005";
    //    NSString *string = [NSString stringWithFormat:@"%d", theinteger];
    //self.addPassword.text = [NSString]
    int dateDiff = [self dateDiffrenceFromDate: date1 second: date2];
    
    self.passwordLastUpdated.text = [NSString stringWithFormat:@"%d since last update", dateDiff];
    //    UIBarButtonItem *editPasswordItem = [[UIBarButtonItem alloc] initwithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector (editPasswordItemPressed)];
    [self editBarButtonItem];
}


- (void)editBarButtonItem
{
    UIBarButtonItem *editBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editBarButtonItemPressed)];
    self.navigationItem.rightBarButtonItem = editBarButtonItem;
}

- (void) editBarButtonItemPressed {
    EditPasswordViewController *editPasswordVC = [[EditPasswordViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController: editPasswordVC animated: YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)dateDiffrenceFromDate:(NSString *)date1 second:(NSString *)date2 {
    // Manage Date Formation same for both dates
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [formatter dateFromString:date1];
    NSDate *endDate = [formatter dateFromString:date2];
    
    
    unsigned flags = NSDayCalendarUnit;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    int dayDiff = [difference day];
    
    return dayDiff;
}



- (IBAction)launchBrowserLink:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.iphonedevelopertips.com"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
