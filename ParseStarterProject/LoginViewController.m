//
//  LoginViewController.m
//  ParseStarterProject
//
//  Created by Steve Huffman on 7/6/14.
//
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginTap:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.passwordField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginTap:(id)sender {
    NSString *userName = self.userNameField.text;
    NSString *password = self.passwordField.text;
    [self attemptLoginWithUserName:userName password:password];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.passwordField) {
        [textField resignFirstResponder];
        [self loginTap:textField];
        return NO;
    }
    return YES;
}

- (void)attemptLoginWithUserName:(NSString *)userName password:(NSString *)password {
    [PFUser logInWithUsernameInBackground:userName
                                 password:password
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self loginDoneWithUser:user];
                                        } else {
                                            [self attemptRegisterWithUserName:userName
                                                                     password:password];
                                        }
                                    }];
}

- (void)attemptRegisterWithUserName:(NSString *)userName password:(NSString *)password {
    PFUser *user = [PFUser user];
    user.username = userName;
    user.password = password;

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self loginDoneWithUser:user];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@", errorString);
        }
    }];
}

- (void)loginDoneWithUser:(PFUser *)user {
    [self.delegate handleLoginWithUser:user];
}

@end
