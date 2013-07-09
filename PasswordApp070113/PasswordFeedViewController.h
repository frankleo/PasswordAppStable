//
//  PasswordFeedViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPasswordViewController.h"
#import "Account.h"
#import "LockerName.h"

@interface PasswordFeedViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,AddPasswordViewControllerDelegate>



@property (strong, nonatomic) IBOutlet UITableView *passwordFeedTableView;

//our passwords array will be an ordered set/list of the passwords we add to our password list.
@property (strong, nonatomic) NSMutableArray *passwords;

@property (strong, nonatomic) IBOutlet UITableView *passwordFeed;

@property (strong, nonatomic) LockerName * lockerName;

@end