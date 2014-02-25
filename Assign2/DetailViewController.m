//
//  DetailViewController.m
//  Assign2
//
//  Created by Cynosure on 4/30/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import "DetailViewController.h"
#import "AlrmViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize datepicker,NameAlrm;
NSString *display;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




//load the view
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.datepicker setDate:[NSDate date]];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*The following method contains code is used to save an alarm setting declared using notification
 The variable notifi used to save the settings of the alarm including alarm time,time zone, name,alarm sound */

-(IBAction)btnSave:(id)sender
{
    
    [NameAlrm resignFirstResponder];
    
    NSDate *alrmtime= [self.datepicker date];
    
    
    NSDateFormatter *setAlarm= [[NSDateFormatter alloc] init];
    
    
    [setAlarm setDateFormat:@"h:mm a"];
    
    
    display = [setAlarm stringFromDate:alrmtime];
    
    UILocalNotification *notifi= [[UILocalNotification alloc] init];
    
    notifi.fireDate= alrmtime;
    
    notifi.hasAction=YES;
    notifi.alertBody= [NameAlrm text];
    notifi.timeZone= [NSTimeZone systemTimeZone];
    notifi.soundName= @"extreme_clock_alarm.caf";
    notifi.repeatInterval= NSDayCalendarUnit ;
    
   
    
    UIAlertView *alert= [[UIAlertView alloc] initWithTitle:[NameAlrm text ]  message:display
                                                  delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    [alert show];
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notifi];
    
    
    [self.NameAlrm setText:@""];
    [self.datepicker setDate:[NSDate date]];
}





@end
