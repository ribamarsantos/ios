//
//  ServerAPI.h
//  AvaliacaoPDMiOS
//
//  Created by Ribamar on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface ServerAPI : NSObject
+(ServerAPI *) sharedClient;

-(void)getComments: (NSInteger )page andSuccessBlock: (void (^)(NSArray *comments)) successBlock
     andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock;

-(void)addComment:(NSDictionary	*)comentario imageComment: (NSData *)imageData andSuccessBlock: (void (^)(NSArray *comments)) successBlock
    andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock;

-(void)login:(NSString	*)login andPassWord:(NSString * ) senha andSuccessBlock: (void (^)(NSArray *comments)) successBlock
andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock;


-(void)deleteComment:(NSInteger	*)idComment  andSuccessBlock: (void (^)(NSArray *comments)) successBlock
       andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock;
@end

