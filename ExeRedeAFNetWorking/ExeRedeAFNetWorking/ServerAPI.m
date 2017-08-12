//
//  ServerAPI.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ServerAPI.h"
#import "AFHTTPRequestOperationManager.h"
#import "AppDelegate.h"

NSString * const kAFSFCAPIBaseURLString = @"http://teste-aula-ios.herokuapp.com/";

int networkIndicatorStack = 0;

@interface ServerAPI()

@property (nonatomic, strong) AFHTTPRequestOperationManager *api;

@end



@implementation ServerAPI

+ (void) stopNetworkIndicator {
    if (--networkIndicatorStack == 0) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}

+ (void) startNetworkIndicator {
    if (++networkIndicatorStack == 1)
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (AFHTTPRequestOperationManager *) managerFactory:(NSURL *) url {
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    return manager;
}

+ (ServerAPI *)sharedClient {
    static ServerAPI *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAFSFCAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (void) cancelAllOperations {
    [self.api.operationQueue cancelAllOperations];
}

- (void) cancelAllHTTPOperationsWithMethod: (NSString *) method path:(NSString *)path {
    AFHTTPRequestOperationManager *manager = self.api;
    for (NSOperation *operation in manager.operationQueue.operations) {
        AFHTTPRequestOperation *op = (AFHTTPRequestOperation *)operation;
        if ([op.request.HTTPMethod caseInsensitiveCompare:method] == NSOrderedSame && [op.request.URL.description rangeOfString:path].location != NSNotFound) {
            [op cancel];
        }
    }
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.api = [self managerFactory:url];
        [self.api setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self.api setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [self.api.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
    }
    return self;
}

+ (NSURL *)serverURL {
    return [NSURL URLWithString:kAFSFCAPIBaseURLString];
}

-(void)getComments:(void (^)(NSArray *comments)) successBlock
     andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock {
    
    [ServerAPI startNetworkIndicator];
    
    [self.api GET:@"comments.json"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             [ServerAPI stopNetworkIndicator];
             successBlock(responseObject);
             
         }    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [ServerAPI stopNetworkIndicator];
             errorBlock(error, operation);
          
         }];
}

@end
