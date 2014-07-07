//
//  AuthViewController.m
//  wellDonePromo
//
//  Created by Tyler Miller on 6/30/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "AuthViewController.h"
#import "DashViewController.h"

@interface AuthViewController ()
- (IBAction)onTapAuth:(id)sender;
- (IBAction)onLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *LoginView;
@property (weak, nonatomic) IBOutlet UIView *loginMasterView;

@end

@implementation AuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapAuth:(id)sender {
    
    DashViewController *vc = [[DashViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onLogin:(id)sender {
    [UIView animateWithDuration:.3
                     animations:^{
                         self.loginMasterView.center = CGPointMake(self.loginMasterView.center.x, 284);
                     }];
}
@end
