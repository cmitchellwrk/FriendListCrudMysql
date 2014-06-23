//
//  DetailViewController.h
//  FriendList
//
//  Created by Macbook Pro on 5/4/13.
//  Copyright (c) 2013 Ryan Hodson. All rights reserved.
//

#import <UIKit/UIKit.h>





#define kPOSTUrlUpdate @"http://localhost/tutorialTestUpdate.php"



#define kFirstname @"firstname"

#define kLastname @"lastname"

#define kOrganization @"organization"

#define kPhonenumber @"phonenumber"

#define kId @"id"







@interface DetailViewController : UITableViewController{
    
    
    NSURLConnection *postConnection;
    
    
    
}



@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *organizationLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;










- (IBAction)save:(UIStoryboardSegue *)sender;


- (IBAction)cancel:(UIStoryboardSegue *)sender;





@end
