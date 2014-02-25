//
//  AlrmViewController.m
//  Assign2
//
//  Created by Cynosure on 4/29/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import "AlrmViewController.h"
#import "DetailViewController.h"

@interface AlrmViewController ()

@end

@implementation AlrmViewController


NSString *display;
@synthesize selectDate;


- (void) viewWillAppear:(BOOL)animated {
    
   
    [self.selectDate reloadData];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




//Method to delete Alarm(Select the alarm to delete and click on button Delete. The notification and hence the corresponding row is deleted. By removing the datasource of the cell, we remove that particular alarm.

- (IBAction)btnDel:(id) sender
{
    
    
    NSIndexPath *path = [self.selectDate indexPathForSelectedRow];
    
    NSArray *notices= [[UIApplication sharedApplication] scheduledLocalNotifications ];
    UILocalNotification *notif= [notices objectAtIndex:path.row];
    
    
    [[UIApplication sharedApplication]cancelLocalNotification:notif];
    
    
    [self.selectDate reloadData];
    
}



//This method is used to push the detailview controller onto the stack, so that a new alarm can be set optionally

-(IBAction)btnAdd:(id)sender
{
    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    [self.navigationController pushViewController:detail animated:YES];
    
}




//return the number of sections in tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


//return the number of rows in the tableview;In this case, this is equal to the number of
//notifications.

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
    
}


//Method to add a new alarm to the tableview.A table view maintains a queue or list of UITableViewCell objects that the data source has marked for reuse. Call this method from your data source object when asked to provide a new cell for the table view. This method dequeues an existing cell if one is available or creates a new one using the class or nib file you previously registered. If no cell is available for reuse and you did not register a class or nib file, this method returns nil.


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myidentifier"];
    
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:@"myidentifier" ] ;
    }
    
    
    NSArray *notices= [[UIApplication sharedApplication] scheduledLocalNotifications ];
    UILocalNotification *notif= [notices objectAtIndex:indexPath.row];
    
    NSDate *alrmtime= notif.fireDate;
    
    
    NSDateFormatter *setAlarm= [[NSDateFormatter alloc] init];
    
    
    [setAlarm setDateFormat:@"h:mm a"];//set the time to be displayed as hour:minutes AM/PM
    
    
    NSString *display = [setAlarm stringFromDate:alrmtime];
    
    
    
    cell.textLabel.text = notif.alertBody;
    cell.detailTextLabel.text = display;
    
    
    return cell;
    
}


@end
