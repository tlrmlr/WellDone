//
//  Pump.m
//  ParseStarterProject
//
//  Created by Steve Huffman on 7/6/14.
//
//

#import <Parse/PFObject+Subclass.h>
#import "Pump.h"

const PumpStatusType *PumpStatusGood = @"GOOD";
const PumpStatusType *PumpStatusBrokenTemp = @"BROKEN_TEMP";

@interface Pump ()

@end

@implementation Pump

@dynamic name;
@dynamic location;
@dynamic status;

+ (NSString *)parseClassName {
    return @"Pump";
}

- (void)setLocation:(PFGeoPoint *)location {
    NSLog(@"set location!");
    [self setObject:location forKey:@"location"];
}

+ (Pump *)pumpWithName:(NSString *)name location:(PFGeoPoint *)location status:(PumpStatusType *)status {
    Pump *p = [[Pump alloc] init];
    p.name = name;
    p.location = location;
    p.status = (NSString *) status;
    return p;
}

- (CLLocationCoordinate2D)coordinate {
    // A little hacky for now. Ideally we'd create this once, but I don't know when objects are instantiated by Parse yet
    return CLLocationCoordinate2DMake(self.location.latitude, self.location.longitude);
}

- (NSString *)title {
    return self.name;
}

@end