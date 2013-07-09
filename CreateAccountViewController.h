//
//  CreateAccountViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SignInViewController.h"
#import "QCViewController.h"

@interface CreateAccountViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *enterPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
