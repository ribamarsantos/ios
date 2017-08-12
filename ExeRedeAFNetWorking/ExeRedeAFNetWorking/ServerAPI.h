//
//  ServerAPI.h
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface ServerAPI : NSObject
+(ServerAPI *) sharedClient;

-(void)getComments:(void (^)(NSArray *comments)) successBlock
     andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock;

@end
