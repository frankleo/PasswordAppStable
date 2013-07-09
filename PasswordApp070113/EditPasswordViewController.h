//
//  EditPasswordViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Account.h"

@protocol AddPasswordViewControllerDelegate <NSObject>

-(void)passwordAdded:(Account *)account;

@end

@interface

EditPasswordViewController : UIViewController
<UITextFieldDelegate>

@property (weak) id <AddPasswordViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIScrollView *keyboardScrollView;

@property (strong, nonatomic) IBOutlet UITextField *editAccount;

@property (strong, nonatomic) IBOutlet UITextField *editUsername;

@property (strong, nonatomic) IBOutlet UITextField *editPassword;

@property (strong, nonatomic) IBOutlet UITextField *editUrl;

@property (strong, nonatomic) IBOutlet UIButton *generatePassword;

@property (strong, nonatomic) IBOutlet UILabel *passwordLastUpdated;


@end