//
//  PasswordItemViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface PasswordItemViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *acountItem;

@property (strong, nonatomic) IBOutlet UITextField *usernameItem;

@property (strong, nonatomic) IBOutlet UITextField *passwordItem;

@property (strong, nonatomic) IBOutlet UITextField *urlItem;

@property (strong, nonatomic) IBOutlet UILabel *passwordLastUpdated;

//- (IBAction)launchBrowserLink:(id)sender;

@end
