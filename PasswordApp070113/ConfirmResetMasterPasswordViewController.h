//
//  ConfirmResetMasterPasswordViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/9/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "HomeCollectionViewController.h"

@interface ConfirmResetMasterPasswordViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *enterPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@end

