//
//  QCViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//



#import "QCViewController.h"

@interface QCViewController ()

@end

@implementation QCViewController

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
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"password"] != nil)
    {
        SignInViewController *signInViewController = [[SignInViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:signInViewController animated:YES];
    }
    else
    {
        CreateAccountViewController *createAccountVC = [[CreateAccountViewController alloc]initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:createAccountVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
