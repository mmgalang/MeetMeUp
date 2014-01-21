//
//  ViewController.m
//  MeetMeUp
//
//  Created by Sonam Mehta on 1/20/14.
//  Copyright (c) 2014 Sonam Mehta. All rights reserved.
//

#import "ViewController.h"
#import "EventNameControllerViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

{
    NSArray *events;
    __weak IBOutlet UITableView *eventTableView;
    __weak IBOutlet UITextField *searchTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad



{
    [super viewDidLoad];
	NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=2639b7212564c67463433b20793"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         events = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError][@"results"];
         [eventTableView reloadData];
     }

     ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return events.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Events"];
    NSDictionary *event = [events objectAtIndex:indexPath.row];
   
    cell.textLabel.text = event[@"name"];
    cell.detailTextLabel.text = event[@"venue"][@"address_1"];
    
  
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EventNameControllerViewController *viewController = segue.destinationViewController;
    NSIndexPath *indexPath = [eventTableView indexPathForSelectedRow];
    viewController.event = events[indexPath.row];
    
}

- (IBAction)onSearchButtonPressed:(id)sender {

    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.meetup.com/2/open_events.json?zip=60604&text=%@&time=,1w&key=2639b7212564c67463433b20793", searchTextField.text]];
    
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
[NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
 {
     events = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError][@"results"];
     
     [eventTableView reloadData];
 }
 
 ];
}



@end
