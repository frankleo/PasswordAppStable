//
//  ResetMasterPasswordViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//



#import "ResetMasterPasswordViewController.h"

@interface ResetMasterPasswordViewController ()

@end

@implementation ResetMasterPasswordViewController



-(void) resetMasterPassword
{
    ResetMasterPasswordViewController  *resetMasterVC = [[ResetMasterPasswordViewController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:resetMasterVC animated:YES];
}

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
    self.signInPasswordTextField.delegate = self;
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    // !!!!!!!! DEFINED FOR TESTING !!! MUST REMOVE WHEN MERGING !!!
    [standardUserDefaults setObject:@"qwerty" forKey:@"password"    ];
    
}

#pragma UITextField Delegate Method

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.signInPasswordTextField resignFirstResponder];
    
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *savedPassword = [standardUserDefaults objectForKey:@"password"];
    if ([savedPassword isEqualToString:self.signInPasswordTextField.text])
    {
        ConfirmResetMasterPasswordViewController *confirmResetMasterPasswordVC = [[ConfirmResetMasterPasswordViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:confirmResetMasterPasswordVC animated:YES];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Opps!" message:@"Password Not Recognized" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
        [alertView show];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end

