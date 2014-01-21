//
//  EventNameControllerViewController.m
//  MeetMeUp
//
//  Created by Sonam Mehta on 1/20/14.
//  Copyright (c) 2014 Sonam Mehta. All rights reserved.
//

#import "EventNameControllerViewController.h"
#import "WebViewController.h"


@interface EventNameControllerViewController ()
{
   
    __weak IBOutlet UILabel *rsvpLabel;
    __weak IBOutlet UILabel *hostLabel;
    __weak IBOutlet UITextView *descriptionTextView;
   
}

@end

@implementation EventNameControllerViewController
@synthesize event;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationItem.title = event[@"name"];
    rsvpLabel.text = [NSString stringWithFormat:@"%@", event[@"yes_rsvp_count"]];
    hostLabel.text = event[@"group"][@"who"];
    descriptionTextView.text = event[@"description"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebViewController *viewController = segue.destinationViewController;
    viewController.url = [NSURL URLWithString:event[@"event_url"]];
}


@end
