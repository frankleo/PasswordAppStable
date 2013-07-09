//
//  HomeCollectionViewController.m
//  PasswordApp070113
//
//  Created by Andrew Bennie on 7/2/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import "HomeCollectionViewController.h"
#import "AddLockerViewController.h"
#import "LockerName.h"
#import "Account.h"
#import "LockerCollectionViewCell.h"
#import "PasswordFeedViewController.h"

@interface HomeCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    int lockerCount;
    NSString *newCategoryName;
}

//@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSMutableArray *results;

@end

@implementation HomeCollectionViewController

# pragma mark Lifecyle

- (void) viewDidLoad
{
    
    [super viewDidLoad];
    
    lockerCount = [LockerName MR_countOfEntities];
   
     [self.homeCollectionView registerClass:[LockerCollectionViewCell class] forCellWithReuseIdentifier:@"LockerCollectionViewCell"];

    self.homeCollectionView.dataSource = self;
    self.homeCollectionView.delegate = self;
    
    
    // Add Title
    self.title = @"My Lockers";
    
    
    // Create, allocate and initialize an Add Locker button
    UIBarButtonItem *addLocker = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addLockerPressed)];
    
    
    
    // set the add to right bar button on the navigation bar
    self.navigationItem.rightBarButtonItem = addLocker;
    
    
    [self.homeCollectionView setBackgroundColor:[UIColor blueColor]];
    
    if (lockerCount == 0)
    {
        [self showAddLockerAlertView];
        
    }
    else
    {
        self.lockers = [LockerName MR_findAll];
    }

}

//- (void) addLocker:(id) sender


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    self = [super initWithNibName:@"HomeCollectionViewController" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
 
 //       UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
   //     [flowLayout setItemSize:CGSizeMake(200, 140)];
     //   [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
       
        
        //----
        //UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
        
        
        //self.hoollectionView = collectionView;
        
        //[self.view addSubview:self.collectionView];
    
   

    //reload collection view in case a locker was changed
    [self.homeCollectionView reloadData];
    
    }
    return self;
}



    // Do any additional setup after loading the view, typically from a nib.
    

-(void) viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    //reload collection view in case a locker was changed
    [self.homeCollectionView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return lockerCount; //[self.lockers count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Transition to PasswordFeedViewController
    LockerName *selectedLockerName = self.lockers[indexPath.row];
    
    if (selectedLockerName.accounts.count == 0)
    {
        NSLog(@"No items in Locker %@", selectedLockerName.locker);
        AddPasswordViewController *addPasswordVC = [[AddPasswordViewController alloc] initWithNibName:nil bundle:nil];
        
        //addPasswordViewController.lockerName = selectedLockerName.locker
        
        [self.navigationController pushViewController: addPasswordVC animated:YES];
        
    }
    else
    {
        PasswordFeedViewController *passwordFeedVC = [[PasswordFeedViewController alloc] initWithNibName:nil bundle:nil];
        
        //passwordFeedViewController.lockerContents = selectedLockerName;
        
        [self.navigationController pushViewController: passwordFeedVC animated:YES];
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(160, 165);
    //return CGSizeMake(image.size.width, image.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //return UIEdgeInsetsMake(50, 20, 50, 20);
    return UIEdgeInsetsMake(0, 0, 0, 0);   // top, left, right, bottom
}


-(void)addLockerPressed
{
    //Add Locker
    NSLog(@"Add Locker button was pressed!");
    [self showAddLockerAlertView];
    
}

-(void)showAddLockerAlertView
{
    UIAlertView * addLockerNameAlert = [[UIAlertView alloc] initWithTitle:@"New Locker" message:@"Enter category name for Locker" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    addLockerNameAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [addLockerNameAlert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        // OK button tapped
        lockerCount++;
        // save to model
     
        newCategoryName = [alertView textFieldAtIndex:0].text;
        [self addLocker:newCategoryName];
        [self.homeCollectionView reloadData];
    }
}


- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if( [inputText length] >= 1 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)addLocker:(NSString *)lockerName
{
    LockerName *myNewLocker = [LockerName MR_createEntity];
    
    myNewLocker.locker = lockerName;

    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreAndWait];
    
    self.lockers = [LockerName MR_findAll]; // refresh?
    
}

@end
