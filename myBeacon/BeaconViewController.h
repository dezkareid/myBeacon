//
//  BeaconViewController.h
//  myBeacon
//
//  Created by Joel Humberto Gómez Paredes on 27/07/14.
//  Copyright (c) 2014 Joel Humberto Gómez Paredes. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface BeaconViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic,strong) NSString* UUID;
@property (nonatomic,strong) NSString* major;
@property (nonatomic,strong) NSString* minor;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UILabel *distancia;

@property (weak, nonatomic) IBOutlet UILabel *lejania;

- (IBAction)findBeacon:(id)sender;

@end
