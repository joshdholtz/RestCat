RestCat
=========

Examples - Basic
-----------

###Set base url
	
	[[RestCat sharedInstance] setBaseURL:@"http://example.com"];

### Make request
	[[RestCat sharedInstance] doGet:@"/member" params:nil withBlock:^(NSUInteger status, NSData *data){

	} ];

###Make JSON request
	[[RestCat sharedInstance] doGetAsJSON:@"/member/2" params:nil withBlock:^(NSUInteger status, id jsonData){
		        
		if ([jsonData isKindOfClass:[NSDictionary class]]) {

		} else if ([jsonData isKindOfClass:[NSArray class]]) {

		}
	} ];


Examples - Models
-----------
###Model - Member.h
	#import "RestCatObject.h"

	@interface Member : RestCatObject

	@property (nonatomic, strong) NSString* firstName;

	@end

###Model - Member.m
	#import "Member.h"

	@implementation Member

	@synthesize firstName = _firstName;

	- (NSDictionary *)mapKeysToProperties {
		return [[NSDictionary alloc] initWithObjectsAndKeys:
			@"firstName", @"first_name",
			nil ];
	}

	@end

###Creating and Using Model - SomeOtherClass.m
	[[RestCat sharedInstance] doGetAsJSON:@"/member/2" params:nil withBlock:^(NSUInteger status, id jsonData){

		if ([jsonData isKindOfClass:[NSDictionary class]]) {
			Member *member = [[Member alloc] initWithDictionary:jsonData];
			NSLog(@"First Name - %@", [member firstName]);
		}

	} ];
