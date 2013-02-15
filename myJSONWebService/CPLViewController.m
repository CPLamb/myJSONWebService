//
//  CPLViewController.m
//  myJSONWebService
//
//  Created by Chris Lamb on 2/1/13.
//  Copyright (c) 2013 Chris Lamb. All rights reserved.
//

#import "CPLViewController.h"

@interface CPLViewController ()

@end

@implementation CPLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
// per YouTube tutorial at - http://www.youtube.com/watch?v=jh0bHASUnvY
	
    NSString *urlString = [NSString stringWithFormat:@"http://ielmo.xtreemhost.com/array.php"];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"%@", [json objectAtIndex:1]);
    
    NSString *imageString = [NSString stringWithFormat:@"%@", [json objectAtIndex:0]];
    NSURL *urlOne = [NSURL URLWithString:imageString];
    NSData *newData = [NSData dataWithContentsOfURL:urlOne];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [imageView setImage:[UIImage imageWithData:newData]];
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

@end
