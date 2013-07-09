//
//  SignInViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//



#import "SignInViewController.h"
#import "HomeCollectionViewController.h"

@interface SignInViewController ()
{
    int numberOfInvalidLoginAttempts;
}

@end

@implementation SignInViewController

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
    
    //RUN ANIMATION HERE!!
    self.signInPasswordTextField.delegate = self;
    self.navigationItem.hidesBackButton = YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    NSString *savedPassword = [standardUserDefaults objectForKey:@"password"];
    NSString *selfDestruct = [standardUserDefaults objectForKey:@"isSelfDestructEnabled"];
    selfDestruct = @"YES";
    
    if ([savedPassword isEqualToString:self.signInPasswordTextField.text])
    {
        HomeCollectionViewController *homeViewVC = [[HomeCollectionViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:homeViewVC animated:YES];
        NSLog(@"Password Matches");
    }
    else
    {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Password Not Recognized" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
        [alertView show];
        if ([selfDestruct isEqualToString:@"YES"])
        {
            [self handleInvalidLoginAttempt];
        }
    }
    [self.signInPasswordTextField resignFirstResponder];
    return YES;
    
}

-(void)handleInvalidLoginAttempt
{
    NSLog(@"handleInvalidLoginAttempt Ran");
    numberOfInvalidLoginAttempts++;
    if (numberOfInvalidLoginAttempts == 3)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"You will lose all your information after the next failed attempt" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles: nil];
        [alertView show];
    }
    else if (numberOfInvalidLoginAttempts == 8)
    {
        //run self destruct code
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
