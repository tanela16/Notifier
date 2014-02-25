//
//  DetailViewController.h
//  Assign2
//
//  Created by Cynosure on 4/30/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController

{
    IBOutlet UIDatePicker *datepicker;//outlet to connect the DatePicker
  
    IBOutlet UITextField *NameAlrm;//To act as a source of input for (optional) name of alarm    
    
    
}

@property(retain,nonatomic) UIDatePicker *datepicker;

@property(retain,nonatomic) UITextField *NameAlrm;


-(IBAction) btnSave: (id) sender;//save the alarm settings


@end
