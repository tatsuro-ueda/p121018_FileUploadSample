//
//  ViewController.m
//  FileUploadSample
//
//  Created by stky on 2012/10/18.
//  Copyright (c) 2012年 stky. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)upload:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://localhost:4567"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"test.jpg"], 0.5);
    NSMutableURLRequest *request = [httpClient multipartFormRequestWithMethod:@"PUT" path:@"/upload" parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"test.jpg" mimeType:@"image/jpg"];
    }];
    
    NSLog(@"%@", request);
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation start];

}
@end
