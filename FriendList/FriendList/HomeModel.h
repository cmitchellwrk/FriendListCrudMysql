//
//  HomeModel.h
//  FriendList
//
//  Created by Chris Mitchell on 5/25/14.
//  Copyright (c) 2014 Ryan Hodson. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end






@interface HomeModel : NSObject <NSURLConnectionDataDelegate>



@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems;





@end
