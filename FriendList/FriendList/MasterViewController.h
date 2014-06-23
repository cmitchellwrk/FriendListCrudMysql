//
//  MasterViewController.h
//  FriendList
//
//  Created by Macbook Pro on 5/4/13.
//  Copyright (c) 2013 Ryan Hodson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

#define kGETUrlTwo @"http://localhost/deleteSqltwo.php"

#define kName @"name"




#define kPOSTUrlTwo @"http://localhost/tutorialTesttwo.php"



#define kFirstname @"firstname"

#define kLastname @"lastname"

#define kOrganization @"organization"

#define kPhonenumber @"phonenumber"





@interface MasterViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate,  HomeModelProtocol>{
    
    
    NSURLConnection *postConnection;
    
    
}



// @property (weak, nonatomic) IBOutlet UITableView *listTableView;






- (IBAction)cancel:(id)sender;


- (IBAction)save:(UIStoryboardSegue *)sender;





@end
