//
//  SignInViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "HomeCollectionViewController.h"

@interface SignInViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *signInPasswordTextField;
@end