//
//  AddLockerViewController.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QCViewController.h"
#import "HomeCollectionViewController.h"

@interface AddLockerViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *lockerTextField;

////This property tracks if a predicate is available.
//@property (strong, nonatomic) NSPredicate *currentPredicate;


//Create an array to store locker names
@property (strong, nonatomic) NSArray *lockers;




@end
