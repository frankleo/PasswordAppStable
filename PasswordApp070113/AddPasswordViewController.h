//
//  AddPasswordViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "Account.h"
#import "LockerName.h"

@protocol AddPasswordViewControllerDelegate <NSObject>

-(void)passwordAdded:(Account *)account;

@end


@interface AddPasswordViewController : UIViewController
<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *keyboardScrollView;

@property (weak) id <AddPasswordViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *passwordLastUpdated;

@property (strong, nonatomic) IBOutlet UITextField *addAccountTitle;
@property (strong, nonatomic) IBOutlet UITextField *addUserName;
@property (strong, nonatomic) IBOutlet UITextField *addPassword;
@property (strong, nonatomic) IBOutlet UITextField *addUrl;
@property (strong, nonatomic) IBOutlet UIButton *generatePassword;

@property (strong, nonatomic) NSPredicate *currentPredicate;

- (IBAction)generatePasswordButtonPressed:(id)sender;

- (NSString *)randomString:(NSInteger)length;


@end

