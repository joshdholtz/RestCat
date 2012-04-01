//
//  Member.m
//  RestCat
//
//  Created by Josh Holtz on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Member.h"

@implementation Member

@synthesize firstName = _firstName;

- (NSDictionary *)mapKeysToProperties {
    return [[NSDictionary alloc] initWithObjectsAndKeys:
            @"firstName", @"first_name",
            nil ];
}

@end
