//
//  HomeModel.m
//  FriendList
//
//  Created by Chris Mitchell on 5/25/14.
//  Copyright (c) 2014 Ryan Hodson. All rights reserved.
//

#import "HomeModel.h"
#import "Person.h"


@interface HomeModel()
{
    NSMutableData *_downloadedData;
}
@end




@implementation HomeModel




- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost/getjsontwo.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}



#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}




- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_locations = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        Person *newLocation = [[Person alloc] init];
        newLocation.iD =jsonElement[@"id"];
        newLocation.firstName = jsonElement[@"Firstname"];
        newLocation.lastName = jsonElement[@"Lastname"];
        newLocation.organization = jsonElement[@"Organization"];
        newLocation.phoneNumber = jsonElement[@"Phonenumber"];
        
        // Add this question to the locations array
        [_locations addObject:newLocation];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_locations];
    }
}















@end
