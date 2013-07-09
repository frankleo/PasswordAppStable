//
//  PasswordFeedViewController.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import "PasswordFeedViewController.h"


@interface PasswordFeedViewController ()

@end

@implementation PasswordFeedViewController


/* helper method that keeps our barButtonItems creation seperate from our viewDidLoad (this is only done to keep viewDidLoad a little cleaner */

-(void)setupBarButtonItems {
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addPasswordBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addBarButtonItemPressed:)];
    self.navigationItem.rightBarButtonItem = addPasswordBarButtonItem;
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
    
    //call helper method
    [self setupBarButtonItems];
    
    //set the datasource and delegate properties of UITableView
    self.passwordFeedTableView.delegate = self;
    self.passwordFeedTableView.dataSource = self;
    
    //converts an NSSet to an Array
    if (!self.passwords){
        NSArray *passwordsArray = [self.lockerName.accounts allObjects];
        //converts an array to an NSMutableArray
        self.passwords = [(NSArray*) passwordsArray mutableCopy];
                          
                          }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//numberOfRowsInsections, change the return value to declare how many rows are in our section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.passwords.count;
}

//setup the tableView's cells.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //since our passwords array contains a list of QCAccount Objects we can index into our array and set the value equal to a local variable we will call account.
    Account *account =[self.passwords objectAtIndex:indexPath.row];
    
    cell.textLabel.text = account.password;
    
    return cell;
}

//setups our edit button to go into edit mode.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.passwordFeedTableView setEditing:editing animated:YES];
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //remove cell here
    }
}

#pragma mark - IBActions

-(void)addBarButtonItemPressed:(id)sender
{
    AddPasswordViewController *addPasswordViewController = [[AddPasswordViewController alloc] initWithNibName:nil bundle:nil];
    addPasswordViewController.delegate = self;
    [self.navigationController pushViewController:addPasswordViewController animated:YES];
}

#pragma mark - QCAddPasswordViewControllerDelegate
//implement the protocol method we defined in QCAddPasswordViewController
-(void)passwordAdded:(Account *)account
{
    [self.passwords addObject:account];
    [self.passwordFeedTableView reloadData];
    
}

@end
