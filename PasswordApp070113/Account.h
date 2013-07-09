//
//  Account.h
//  PasswordApp070113
//
//  Created by Heba Elsayed on 7/7/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LockerName;

@interface Account : NSManagedObject

@property (nonatomic, retain) NSString * account;
@property (nonatomic) NSTimeInterval datePasswordCreated;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) LockerName *lockerName;

@end
