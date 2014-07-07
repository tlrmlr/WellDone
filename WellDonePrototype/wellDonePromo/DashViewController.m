//
//  DashViewController.m
//  wellDonePromo
//
//  Created by Tyler Miller on 6/30/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "DashViewController.h"
#import "MapViewController.h"
#import "DetailViewController.h"
#import "ReportViewController.h"
#import "historyViewController.h"

@interface DashViewController ()
- (IBAction)onMapView:(UIButton *)sender;
- (IBAction)onDetailClick:(UIButton *)sender;
- (IBAction)onButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewBottom;
- (IBAction)onHistory:(id)sender;

@end

@implementation DashViewController

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
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithTitle:(@"Map") style:UIBarButtonItemStylePlain target:self action:@selector(onMapView:)];
    self.navigationItem.rightBarButtonItem = shareItem;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onMapView:(UIButton *)sender {
    MapViewController *vc = [[MapViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
   }

- (IBAction)onDetailClick:(UIButton *)sender {
    ReportViewController *vc = [[ReportViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onButton:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        self.viewBottom.center = CGPointMake(self.viewBottom.center.x, 650);
        self.viewBottom.alpha = 0.4;
    }];
}
- (IBAction)onHistory:(id)sender {
    historyViewController *vc = [[historyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    self.viewBottom.alpha = 1;


}
@end
