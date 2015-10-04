//
//  MapViewController.m
//  menu
//
//  Created by xiangyutao on 15/10/4.
//  Copyright © 2015年 向宇涛. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic,strong)CLLocationManager*mgr;


@end

@implementation MapViewController


-(CLLocationManager *)mgr{
    if (_mgr==nil) {
        _mgr=[CLLocationManager new];
        _mgr.distanceFilter=10;
        _mgr.desiredAccuracy=kCLLocationAccuracyBest;
        _mgr.delegate=self;
    }return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([[UIDevice currentDevice].systemVersion floatValue]>8.0) {
        [self.mgr requestWhenInUseAuthorization];
    }else{
        [self.mgr requestAlwaysAuthorization];
    }
    [self.mgr startUpdatingLocation];
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    // 设置地图类型
    self.mapView.mapType = MKMapTypeStandard;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
