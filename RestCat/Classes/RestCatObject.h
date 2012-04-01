//
//  RestCatObject.h
//  RestCat
//
//  Created by Josh Holtz on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestCatObject : NSObject

- (id) initWithDictionary:(NSDictionary*)dict;

- (NSDictionary*) mapKeysToProperties;

@end
