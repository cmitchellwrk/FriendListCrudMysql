//
//  DetailViewController.m
//  FriendList
//
//  Created by Macbook Pro on 5/4/13.
//  Copyright (c) 2013 Ryan Hodson. All rights reserved.
//

#import "DetailViewController.h"
#import "Person.h"
#import "EditViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController



@synthesize detailItem = _detailItem;
@synthesize nameLabel = _nameLabel;
@synthesize organizationLabel = _organizationLabel;
@synthesize phoneNumberLabel = _phoneNumberLabel;





#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}




- (IBAction)save:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"saveInput"]) {
        EditViewController *editController = [segue sourceViewController];
        [self.detailItem setFirstName:editController.firstNameField.text];
        [self.detailItem setLastName:editController.lastNameField.text];
        [self.detailItem setPhoneNumber:editController.phoneNumberField.text];
        [self.detailItem setOrganization:editController.organizationField.text];
        
       [self configureView];
    
        
        NSString *firstname = editController.firstNameField.text;
        NSString *lastname = editController.lastNameField.text;
        NSString *organization = editController.organizationField.text;
        NSString *phonenumber = editController.phoneNumberField.text;
        
    
        NSString *eye = [self.detailItem iD];
        
        
               
        NSMutableString *postString = [NSMutableString stringWithString:kPOSTUrlUpdate];
        
        
        [postString appendString:[NSString stringWithFormat:@"?%@=%@", kFirstname, firstname]];
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kLastname, lastname]];
        
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kOrganization, organization]];
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kPhonenumber, phonenumber]];
        
        
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kId, eye]];
        
        
        
        [postString setString:[postString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        [request setHTTPMethod:@"POST"];
        
        
        postConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
        
        
        
        
    
    } }







- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"cancelInput"]) {
    } }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { if ([[segue identifier] isEqualToString:@"editDetail"]) {
    NSArray *navigationControllers = [[segue destinationViewController] viewControllers];
    EditViewController *editViewController = [navigationControllers objectAtIndex:0];
    [editViewController setDetailItem:self.detailItem]; }
}



- (void)configureView {
    if (self.detailItem &&
        [self.detailItem isKindOfClass:[Person class]])
    {
        NSString *name = [NSString stringWithFormat:@"%@ %@",[self.detailItem firstName],[self.detailItem lastName]];
        self.nameLabel.text = name;
        self.organizationLabel.text = [self.detailItem organization];
        self.phoneNumberLabel.text = [self.detailItem phoneNumber];
}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
