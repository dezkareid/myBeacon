//
//  BeaconViewController.m
//  myBeacon
//
//  Created by Joel Humberto Gómez Paredes on 27/07/14.
//  Copyright (c) 2014 Joel Humberto Gómez Paredes. All rights reserved.
//

#import "BeaconViewController.h"

@interface BeaconViewController (){
    bool buscando;

}

@end



@implementation BeaconViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    buscando = false;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findBeacon:(id)sender {
    if (!buscando) {
        buscando = true;
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
        
        
        CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                               major:[@"14488" intValue]
                                                                               minor:[@"37491" intValue]
                                                                          identifier:@"beacon"];
        [self.locationManager startMonitoringForRegion:beaconRegion];
        [self.locationManager startRangingBeaconsInRegion:beaconRegion];

    }
}

- (NSString *)nameForProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityUnknown:
            return @"Desconocida";
            break;
        case CLProximityImmediate:
            return @"Ya estas ahi";
            break;
        case CLProximityNear:
            return @"Cerca";
            break;
        case CLProximityFar:
            return @"Lejos";
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"Failed monitoring region: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager failed: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons
               inRegion:(CLBeaconRegion *)region
{
   
    for (CLBeacon *beacon in beacons) {
        NSLog(@" %@ %f %@",[self nameForProximity:beacon.proximity],beacon.accuracy, beacon.proximityUUID);
        self.distancia.text = [NSString stringWithFormat:@"%f",beacon.accuracy];
        self.lejania.text  = [self nameForProximity:beacon.proximity];
    }
    NSLog(@"Number of beacons : %lu", (unsigned long)beacons.count);
    
}

@end
