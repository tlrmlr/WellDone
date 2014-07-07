//
//  LoginViewController.h
//  ParseStarterProject
//
//  Created by Steve Huffman on 7/6/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@protocol LoginProtocol <NSObject>

- (void)handleLoginWithUser:(PFUser *)user;
- (void)handleLogout;

@end

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <LoginProtocol> delegate;

@end
