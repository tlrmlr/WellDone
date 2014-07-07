//
//  PumpsMapViewController.m
//  WellDoneListMap
//
//  Created by Aparna Jain on 7/6/14.
//  Copyright (c) 2014 FOX. All rights reserved.
//

#import "PumpsMapViewController.h"
#import "Pump.h"

#define METERS_PER_MILE 1609.344

@interface PumpsMapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation PumpsMapViewController

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

    UIBarButtonItem *listButton = [[UIBarButtonItem alloc] initWithTitle:@"List" style:UIBarButtonItemStyleDone target:self action:@selector(onListButtonClick)];
    [listButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = listButton;
    
    [self prepareMapLoad];

    for (Pump *p in self.pumps) {
        [self plotPump:p];
    }
}

- (void)prepareMapLoad {
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 37.79159;
    coordinate.longitude = -122.41212;
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, 0.25*METERS_PER_MILE, 0.25*METERS_PER_MILE)];
}
-(void)onListButtonClick{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)plotPump:(Pump *)pump {
    //NSLog(@"%f %f", pump.coordinate.latitude, pump.coordinate.longitude);
    [self.mapView addAnnotation:pump];
}

@end
