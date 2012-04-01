//
//  RestCat.h
//  RestCat
//
//  Created by Josh Holtz on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestCat : NSObject

@property (nonatomic, strong) NSString *baseURL;
@property (nonatomic, strong) NSMutableDictionary *httpHeaders;

+ (id)sharedInstance;

- (void) setHttpHeader:(NSString*)value forKey:(NSString*)key;
- (void) removeHttpHeaderForKey:(NSString*)key;

- (void) doGetAsJSON:(NSString*)route params:(NSDictionary*)params withBlock:(void(^)(NSUInteger status, id jsonData))block;

- (void) doGet:(NSString*)route params:(NSDictionary*)params withBlock:(void(^)(NSUInteger status, NSData* data))block;

@end
