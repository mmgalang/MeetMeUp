//
//  WebViewController.m
//  MeetMeUp
//
//  Created by Sonam Mehta on 1/20/14.
//  Copyright (c) 2014 Sonam Mehta. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
{
    __weak IBOutlet UIWebView *myWebView;
    __weak IBOutlet UIActivityIndicatorView *spinner;
}

@end

@implementation WebViewController
@synthesize url;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
	
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [spinner startAnimating];

}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    
    
    NSLog (@"Finished");
    [spinner stopAnimating];
    spinner.hidden = YES;
    
}


@end
