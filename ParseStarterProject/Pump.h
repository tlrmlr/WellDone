//
//  Pump.h
//  ParseStarterProject
//
//  Created by Steve Huffman on 7/6/14.
//
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <parse/Parse.h>

typedef const NSString PumpStatusType;

PumpStatusType *PumpStatusGood;
PumpStatusType *PumpStatusBrokenTemp;

@interface Pump : PFObject<PFSubclassing, MKAnnotation>

@property (retain) NSString *name;
@property (retain) PFGeoPoint *location;
@property (retain) NSString *status;

+ (NSString *)parseClassName;
+ (Pump *)pumpWithName:(NSString *)name location:(PFGeoPoint *)location status:(PumpStatusType *)status;

@end
