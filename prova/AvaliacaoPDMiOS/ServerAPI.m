//
//  ServerAPI.m
//  AvaliacaoPDMiOS
//
//  Created by Ribamar on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "ServerAPI.h"
#import "AFHTTPRequestOperationManager.h"
#import "AppDelegate.h"

NSString * const kAFSFCAPIBaseURLString = @"https://teste-aula-ios.herokuapp.com/";

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
// get comments
-(void)getComments: (NSInteger )page andSuccessBlock: (void (^)(NSArray *comments)) successBlock
     andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock {
    
    [ServerAPI startNetworkIndicator];
    
    [self.api GET:@"comments.json"
       parameters:@{@"page":@(page)}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [ServerAPI stopNetworkIndicator];
              successBlock(responseObject);
              
          }    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              [ServerAPI stopNetworkIndicator];
              errorBlock(error, operation);
              
          }];
}
// add new Comment
-(void)addComment:(NSDictionary	*)comentario imageComment: (NSData *)imageData andSuccessBlock: (void (^)(NSArray *comments)) successBlock
     andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock {
    NSString * fileName = [self getCurrentDate];
    
    [ServerAPI startNetworkIndicator];
    
    [self.api POST:@"comments.json"
       parameters:comentario
       constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
           [ServerAPI stopNetworkIndicator];
           [formData appendPartWithFileData:imageData name:@"comment[picture]" fileName:[NSString stringWithFormat:@"img_%@.jpg",fileName ] mimeType:@"image/jpeg" ];
       } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
           [ServerAPI stopNetworkIndicator];
           successBlock(responseObject);
           
       } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
           [ServerAPI stopNetworkIndicator];
           errorBlock(error, operation);
       }];
}

//delete comment
-(void)deleteComment:(NSInteger	*)idComment  andSuccessBlock: (void (^)(NSArray *comments)) successBlock
    andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock {
    NSString * urlDelete  = [ NSString stringWithFormat:@"comments/%d.json", idComment];
    
    [ServerAPI startNetworkIndicator];
    [self.api DELETE: urlDelete
             parameters:nil
             success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                 [ServerAPI stopNetworkIndicator];
                 successBlock(responseObject);
    
             } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                 [ServerAPI stopNetworkIndicator];
                 errorBlock(error, operation);
             }];
}

// login
-(void)login:(NSString	*)login andPassWord:(NSString * ) senha andSuccessBlock: (void (^)(NSArray *comments)) successBlock
andErrorBlock: (void (^)(NSError *error, AFHTTPRequestOperation *operation)) errorBlock{
    
    [ServerAPI startNetworkIndicator];
    [ self.api POST:@"users/sign_in.json"
         parameters:@{ @"user" : @{ @"email":  login,
                                    @"password": senha} }
               success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                   [ServerAPI stopNetworkIndicator];
                   successBlock(responseObject);
                   
               } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                   [ServerAPI stopNetworkIndicator];
                   errorBlock(error, operation);
               }];
}

-(NSString * ) getCurrentDate{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"ddMMYYHHmmss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}


@end
