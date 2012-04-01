//
//  ViewController.m
//  RestCat
//
//  Created by Josh Holtz on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "RestCat.h"
#import "Member.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[RestCat sharedInstance] setBaseURL:@"http://kingofti.me"];
    
    [[RestCat sharedInstance] doGet:@"/member" params:nil withBlock:^(NSUInteger status, NSData *data){
        
    } ];
    
    [[RestCat sharedInstance] doGetAsJSON:@"/member/2" params:nil withBlock:^(NSUInteger status, id jsonData){
        
        if ([jsonData isKindOfClass:[NSDictionary class]]) {
            Member *member = [[Member alloc] initWithDictionary:jsonData];
            NSLog(@"First Name - %@", [member firstName]);
        }
    } ];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
