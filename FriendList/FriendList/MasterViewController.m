//
//  MasterViewController.m
//  FriendList
//
//  Created by Macbook Pro on 5/4/13.
//  Copyright (c) 2013 Ryan Hodson. All rights reserved.
//

#import "MasterViewController.h"
#import "Person.h"
#import "DetailViewController.h"



#import "AddNewPersonController.h"




@interface MasterViewController () {
    
    
    NSMutableArray *_objects;
    
    
    HomeModel *_homeModel;
    
    
    NSMutableArray *_feedItems;
    
    
    Person *_selectedLocation;
    
    
    
}



@end




@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Set this view controller object as the delegate and data source for the table view
 //   self.listTableView.delegate = self;
   // self.listTableView.dataSource = self;
    
    
    
    
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSMutableArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _homeModel = [[HomeModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _homeModel.delegate = self;
    
    // Call the download items method of the home model object
    [_homeModel downloadItems];
    
    
    
    
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    
}







- (IBAction)cancel:(id)sender {
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}












- (IBAction)save:(UIStoryboardSegue *)segue {
    
    
    
    if ([[segue identifier] isEqualToString:@"SaveNew"]) {
        
        
        
        AddNewPersonController *AddNewPersonController = [segue sourceViewController];
        
        
        NSString *firstname = AddNewPersonController.firstNameField.text;
        NSString *lastname = AddNewPersonController.lastNameField.text;
        NSString *organization = AddNewPersonController.organizationField.text;
        NSString *phonenumber = AddNewPersonController.phoneNumberField.text;
        
        
        

        
        
        NSMutableString *postString = [NSMutableString stringWithString:kPOSTUrlTwo];
        
        
        [postString appendString:[NSString stringWithFormat:@"?%@=%@", kFirstname, firstname]];
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kLastname, lastname]];
        
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kOrganization, organization]];
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kPhonenumber, phonenumber]];
        
        
        
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        [request setHTTPMethod:@"POST"];
        
        
        
        postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        
        
    
        
        
        //
        if (!_feedItems) {
            _feedItems = [[NSMutableArray alloc] init];
        }
        
        
        
        Person *friend = [[Person alloc] init];
        // friend.firstName = @"<First Name>";
        //  friend.lastName = @"<Last Name>";
        // friend.organization = @"<Organization>";
        //  friend.phoneNumber = @"<Phone Number>";
        
        friend.firstName = firstname;
        friend.lastName= lastname;
        friend.organization= organization;
        friend.phoneNumber = phonenumber;
        
        
        //  [_objects insertObject:friend atIndex:0];
        
        [_feedItems    insertObject:friend atIndex:0];
        
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
        
        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        [self.tableView reloadData];
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
















- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UITableView *view = (UITableView *)self.view;
    [view reloadData];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)itemsDownloaded:(NSMutableArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.tableView    reloadData];
}









- (void)insertNewObject:(id)sender {
    
    
  //  if (!_objects) {
  //      _objects = [[NSMutableArray alloc] init];
   // }
    
    if (!_feedItems) {
        _feedItems = [[NSMutableArray alloc] init];
    }
    
    
    
    Person *friend = [[Person alloc] init];
    friend.firstName = @"<First Name>";
    friend.lastName = @"<Last Name>";
    friend.organization = @"<Organization>";
    friend.phoneNumber = @"<Phone Number>";
    
  //  [_objects insertObject:friend atIndex:0];
    
    [_feedItems insertObject:friend atIndex:0];
    
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}




#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    
  //  return _objects.count;
    
    // Return the number of feed items (initially 0)
    return _feedItems.count;
    
    
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"Cell"
                             forIndexPath:indexPath];
   
    
  //  Person *friend = _objects[indexPath.row]; cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
  //                                                                   friend.firstName, friend.lastName];
    
    
    Person *friend = _feedItems[indexPath.row]; cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                                                                    friend.firstName, friend.lastName];
                                                                     
                                                                     
    
    
    return cell;
    
    
    
    
}







- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}






- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        
        
        Person *info = [_feedItems objectAtIndex:indexPath.row ] ;
        
        
        NSString *name  = info.firstName;
        
        
        
        NSMutableString *postString = [NSMutableString stringWithString:kGETUrlTwo];
        
        
        [postString appendString:[NSString stringWithFormat:@"?%@=%@", kName, name]];
        
        
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        [request setHTTPMethod:@"POST"];
        
        
        
        postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        
        
       
        [_feedItems removeObjectAtIndex:indexPath.row];
        
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
    
    
}


















- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
     //   NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; Person *friend = _objects[indexPath.row];
        
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow]; Person *friend = _feedItems[indexPath.row];
        
        
        
        
        [[segue destinationViewController] setDetailItem:friend];
    } }

@end
