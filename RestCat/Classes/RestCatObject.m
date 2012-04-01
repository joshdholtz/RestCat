//
//  RestCatObject.m
//  RestCat
//
//  Created by Josh Holtz on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RestCatObject.h"

@implementation RestCatObject

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        
        // Loops through all keys to map to propertiess
        NSDictionary *map = [self mapKeysToProperties];
        for (NSString *key in [map allKeys]) {
        
            NSLog(@"Key to map - %@", key);
            
            // Checks if the key to map is in the dictionary to map
            if ([dict objectForKey:key] != nil) {

                [self setValue:[dict objectForKey:key] forKey:[map objectForKey:key] ];
                
            }
            
        }
    }
    return self;
}

- (NSDictionary *)mapKeysToProperties {
    return [[NSDictionary alloc] init];
}

@end
