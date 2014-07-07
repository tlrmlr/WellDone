#import <Parse/Parse.h>
#import "ParseStarterProjectAppDelegate.h"
#import "LoginViewController.h"
#import "Pump.h"

#import "PumpsListViewController.h"

@interface ParseStarterProjectAppDelegate ()

@property (strong, nonatomic) UINavigationController *navVC;
@property (strong, nonatomic) LoginViewController *loginVC;
@property (strong, nonatomic) PumpsListViewController *pumpVC;

@end

@implementation ParseStarterProjectAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Parse stuff
    [Pump registerSubclass];

    [Parse setApplicationId:@"AFAHbFnBBMRWBl8A1BynRocSsRJfopRDC7pkPuEO"
                  clientKey:@"azgmOiqrSKjiSaKzn0x9nODajWJEGH6A90t1Yfew"];


    PFACL *defaultACL = [PFACL ACL];

    // If you would like all objects to be private by default, remove this line.
    [defaultACL setPublicReadAccess:YES];

    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];

    self.loginVC = [[LoginViewController alloc] init];
    self.loginVC.delegate = self;

    self.pumpVC = [[PumpsListViewController alloc] init];
    self.pumpVC.delegate = self;

    self.navVC = [[UINavigationController alloc] initWithRootViewController:self.loginVC];
    self.navVC.navigationBar.translucent = NO;
    self.navVC.navigationBar.barTintColor = [UIColor colorWithRed:64/255.0 green:153/255.0 blue:1 alpha:1];
    self.navVC.navigationBar.tintColor = [UIColor whiteColor];
    [self.navVC.navigationBar setBarStyle:UIBarStyleBlack];

    self.window.rootViewController = self.navVC;

    // check login
    PFUser *user = [PFUser currentUser];
    if (user) {
        NSLog(@"alreayd have user %@", user);
        [self handleLoginWithUser:user];
    }

    [self fetchPumps];

    [self.window makeKeyAndVisible];

    if (application.applicationState != UIApplicationStateBackground) {
        // Track an app open here if we launch with a push, unless
        // "content_available" was used to trigger a background push (introduced
        // in iOS 7). In that case, we skip tracking here to avoid double
        // counting the app-open.
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
            [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
    }
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
                                                    UIRemoteNotificationTypeAlert|
                                                    UIRemoteNotificationTypeSound];

    return YES;
}

- (void)fetchPumps {
    PFQuery *query = [Pump query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            self.pumpVC.pumps = objects;
        }
    }];
}

- (void)handleLoginWithUser:(PFUser *)user {
    NSLog(@"logged in!, %@", user.username);
    [self.navVC pushViewController:self.pumpVC animated:NO];
}

- (void)handleLogout {
    [PFUser logOut];
    [self.navVC popToRootViewControllerAnimated:NO];
}

/*
 
///////////////////////////////////////////////////////////
// Uncomment this method if you are using Facebook
///////////////////////////////////////////////////////////
 
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
} 
 
*/

/*
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    [PFPush storeDeviceToken:newDeviceToken];
    [PFPush subscribeToChannelInBackground:@"" target:self selector:@selector(subscribeFinished:error:)];
}
 */

/*
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"Push notifications are not supported in the iOS Simulator.");
    } else {
        // show some alert or otherwise handle the failure to register.
        NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
	}
}
 */

/*
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];

    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}
 */

/*
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}
*/

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark - ()

- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    if ([result boolValue]) {
        NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
    } else {
        NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
    }
}

- (void)makePumps {
    NSArray *points = @[[PFGeoPoint geoPointWithLatitude:37.7916 longitude:-122.4121],
                        [PFGeoPoint geoPointWithLatitude:37.7625 longitude:-122.4365],
                        [PFGeoPoint geoPointWithLatitude:37.7828 longitude:-122.4218],
                        [PFGeoPoint geoPointWithLatitude:37.7879 longitude:-122.4108],
                        [PFGeoPoint geoPointWithLatitude:37.7881 longitude:-122.4103],
                        [PFGeoPoint geoPointWithLatitude:37.7808 longitude:-122.4702],
                        [PFGeoPoint geoPointWithLatitude:37.8053 longitude:-122.4176],
                        [PFGeoPoint geoPointWithLatitude:37.7972 longitude:-122.4578],
                        [PFGeoPoint geoPointWithLatitude:37.7837 longitude:-122.4108],
                        [PFGeoPoint geoPointWithLatitude:37.7869 longitude:-122.4114],
                        [PFGeoPoint geoPointWithLatitude:37.5568 longitude:-122.3003],
                        [PFGeoPoint geoPointWithLatitude:37.6974 longitude:-122.1880],
                        [PFGeoPoint geoPointWithLatitude:37.6558 longitude:-122.4017],
                        [PFGeoPoint geoPointWithLatitude:37.7750 longitude:-122.4180],
                        [PFGeoPoint geoPointWithLatitude:37.7866 longitude:-122.4047],
                        [PFGeoPoint geoPointWithLatitude:37.7870 longitude:-122.4117],
                        [PFGeoPoint geoPointWithLatitude:37.7858 longitude:-122.4079],
                        [PFGeoPoint geoPointWithLatitude:37.5922 longitude:-122.3627],
                        [PFGeoPoint geoPointWithLatitude:37.7872 longitude:-122.4105],
                        [PFGeoPoint geoPointWithLatitude:37.7923 longitude:-122.4430]];

    for (int x = 0; x < points.count; x++) {
        NSString *name = [NSString stringWithFormat:@"Pump%d", x];
        Pump *p = [Pump pumpWithName:name location:points[x] status:PumpStatusGood];
        [p saveInBackground];
    }
}
@end
