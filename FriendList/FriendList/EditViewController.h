//
//  EditViewController.h
//  FriendList
//
//  Created by syncmac on 06/05/13.
//  Copyright (c) 2013 Ryan Hodson. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface EditViewController : UITableViewController<UITextFieldDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *organizationField;
@end