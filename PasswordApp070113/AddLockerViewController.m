//
//  AddLockerViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import "AddLockerViewController.h"
#import "HomeCollectionViewController.h"

@interface AddLockerViewController ()

@end

@implementation AddLockerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lockerTextField.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
    
    
    // Create, allocate and initialize a Save button
    UIBarButtonItem *saveLockerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveLockerButtonPressed)];
    
    
    // set the add to right bar button on the navigation bar
    self.navigationItem.rightBarButtonItem = saveLockerButton;
    
    
    // Create, allocate and initialize a Cancel button
    UIBarButtonItem *cancelLockerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelLockerButtonPressed)];
    
    // set the cancel to left bar button on the navigation bar
    self.navigationItem.leftBarButtonItem = cancelLockerButton;
    
    //Add Title
    self.title = @"Add Lockers";

}

-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
/*
    
    //Create alloc and initialize a collection view controller
    HomeCollectionViewController * locker = [[HomeCollectionViewController alloc] initWithNibName:nil bundle:nil];
    
    //push this viewcontroller on the main navigation controller
    [self.navigationController pushViewController:locker animated:YES];

 */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.lockerTextField resignFirstResponder];
    return YES;
}


-(void)saveButtonPressed
{
    
}

-(void)cancelButtonPressed
{
    
}

@end
