//
//  EditViewController.m
//  FriendList
//
//  Created by syncmac on 06/05/13.
//  Copyright (c) 2013 Ryan Hodson. All rights reserved.
//

#import "EditViewController.h"
#import "Person.h"
@interface EditViewController ()

@end

@implementation EditViewController

@synthesize detailItem = _detailItem;
@synthesize firstNameField = _firstNameField;
@synthesize lastNameField = _lastNameField;
@synthesize phoneNumberField = _phoneNumberField; @synthesize organizationField = _organizationField;
- (void)setDetailItem:(id)detailItem {
    if (_detailItem != detailItem) {
        _detailItem = detailItem;
        [self configureView];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
if ((textField == self.firstNameField) || (textField == self.lastNameField) || (textField == self.phoneNumberField) || (textField == self.organizationField))
{
    [textField resignFirstResponder];
}
    return YES;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)configureView {
    if (self.detailItem && [self.detailItem isKindOfClass:[Person class]]) {
        self.firstNameField.text = [self.detailItem firstName];
        self.lastNameField.text = [self.detailItem lastName];
        self.phoneNumberField.text = [self.detailItem phoneNumber];
        self.organizationField.text = [self.detailItem organization];
    } }
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
