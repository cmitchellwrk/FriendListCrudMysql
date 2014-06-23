//
//  AddNewPersonController.h
//  FriendList
//
//  Created by Chris Mitchell on 6/15/14.
//  Copyright (c) 2014 Ryan Hodson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewPersonController : UITableViewController{
    
    
    
    
    NSURLConnection *postConnection;
    
    

    
    
}



@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UITextField *organizationField;






@end
