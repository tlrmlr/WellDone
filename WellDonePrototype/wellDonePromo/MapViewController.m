//
//  MapViewController.m
//  wellDonePromo
//
//  Created by Tyler Miller on 6/30/14.
//  Copyright (c) 2014 Tyler Miller. All rights reserved.
//

#import "MapViewController.h"
#import "DetailViewController.h"
#import "DashViewController.h"
#import "ReportViewController.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIView *DetailView;
@property (weak, nonatomic) IBOutlet UIImageView *mapView;
- (IBAction)onDetailButton:(UIButton *)sender;
- (IBAction)onListClick:(UIButton *)sender;
- (IBAction)moveUp:(id)sender;

@end

@implementation MapViewController

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
    
UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithTitle:(@"List") style:UIBarButtonItemStylePlain target:self action:@selector(onList:)];
    self.navigationItem.rightBarButtonItem = shareItem;

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDetailButton:(UIButton *)sender {
    ReportViewController *vc = [[ReportViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onList:(id)sender {
    DashViewController *vc = [[DashViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onListClick:(UIButton *)sender {
    DashViewController *vc = [[DashViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)moveUp:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
           self.DetailView.center = CGPointMake(self.DetailView.center.x, 445);
        
        self.mapView.center = CGPointMake(self.mapView.center.x, 200);
    }];

    
}
@end
