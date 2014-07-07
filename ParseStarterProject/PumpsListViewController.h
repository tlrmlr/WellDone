//
//  PumpsListViewController.h
//  WellDoneListMap
//
//  Created by Aparna Jain on 7/6/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface PumpsListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *pumps;
@property (weak, nonatomic) id <LoginProtocol> delegate;

@end
