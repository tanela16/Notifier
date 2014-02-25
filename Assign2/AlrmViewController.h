//
//  AlrmViewController.h
//  Assign2
//
//  Created by Cynosure on 4/29/13.
//  Copyright (c) 2013 Cynosure. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlrmViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *selectDate;//The alarms created are stored in this tableview

}


@property(strong,nonatomic) UITableView *selectDate;

-(IBAction)btnAdd:(id)sender;//add alarm
-(IBAction)btnDel:(id)sender;//delete alarm

    


@end
