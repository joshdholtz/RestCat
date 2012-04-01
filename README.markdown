RestCat
=========

Basic Examples
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
