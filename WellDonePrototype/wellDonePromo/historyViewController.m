//
//  historyViewController.m
//  wellDonePromo
//
//  Created by Mario C. Delgado Jr. on 7/6/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "historyViewController.h"
#import "reportDetailViewController.h"

@interface historyViewController ()
- (IBAction)onhistoryDetail:(id)sender;

@end

@implementation historyViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onhistoryDetail:(id)sender {
    reportDetailViewController *vc = [[reportDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
