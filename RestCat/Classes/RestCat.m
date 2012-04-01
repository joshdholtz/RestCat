//
//  RestCat.m
//  RestCat
//
//  Created by Josh Holtz on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RestCat.h"

#import <Foundation/NSJSONSerialization.h> 

@implementation RestCat

@synthesize baseURL = _baseURL;
@synthesize httpHeaders = _httpHeaders;

static RestCat *sharedInstance = nil;

#pragma mark - Public Singleton

+ (RestCat *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    return sharedInstance;
}

#pragma mark - Private Singleton

- (id)init
{
    self = [super init];
    
    if (self) {
        _httpHeaders = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

#pragma mark - Headers

- (void)addHttpHeader:(NSString *)value forKey:(NSString *)key {
    if (value != nil && key != nil) {
        [_httpHeaders setObject:value forKey:key];
    }
}

- (void)removeHttpHeaderForKey:(NSString *)key {
    [_httpHeaders removeObjectForKey:key];
}

#pragma mark - Send Requests For JSON
- (void) doGetAsJSON:(NSString*)route params:(NSDictionary*)params withBlock:(void(^)(NSUInteger status, id jsonData))block {
    
    [self doGet:route params:params withBlock:^(NSUInteger status, NSData *data){
        
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        block(status, jsonData);
        
    }];
    
}

#pragma mark - Send Requests
//- (void) doGet:(NSString*)route params:(NSDictionary*) withBlock:(void(^)(RKObjectLoader*))block {
- (void) doGet:(NSString*)route params:(NSDictionary*)params withBlock:(void(^)(NSUInteger status, NSData* data))block {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setAllHTTPHeaderFields:_httpHeaders];
    [request setURL:[NSURL URLWithString:[self fullRoute:route]]];
    [request setHTTPMethod:@"GET"];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //Capturing server response
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        int status = [((NSHTTPURLResponse*) response) statusCode];
        NSLog(@"Status: %d", status);
        
        block(status, data);
        
    }];
}

#pragma mark - Private

- (NSString*)fullRoute:(NSString*)route {
    return [[NSString alloc] initWithFormat:@"%@%@", _baseURL, route];
}

@end
