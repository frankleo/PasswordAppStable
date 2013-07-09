//
//  LockerName.h
//  PasswordApp070113
//
//  Created by Heba Elsayed on 7/7/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Account;

@interface LockerName : NSManagedObject

@property (nonatomic, retain) NSString * locker;
@property (nonatomic, retain) NSSet *accounts;
@end

@interface LockerName (CoreDataGeneratedAccessors)

- (void)addAccountsObject:(Account *)value;
- (void)removeAccountsObject:(Account *)value;
- (void)addAccounts:(NSSet *)values;
- (void)removeAccounts:(NSSet *)values;

@end
