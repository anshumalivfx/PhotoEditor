//
//  PhotoEditorViewController.m
//  PhotoEditing
//
//  Created by Anshumali Karna on 07/02/23.
//

#include "PhotoEditorViewController.h"
#include<stdio.h>
#include<stdlib.h>
#include<string.h>



@interface PhotoEditorViewController ()
@property (nonatomic) UIButton *button;
@end



@implementation PhotoEditorViewController

- (void)hello:(NSString *)newOk: (NSNumber *)newNumber {
    NSLog(@"%@", newOk);
}

- (IBAction)didPressed:(id)sender{
    printf("Hello world");
    [self hello:@"20" :@10];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    UIButton *saturationButton = [[UIButton alloc] init];
    [saturationButton setFrame:CGRectMake(0, 0, 200, 100)];
    [saturationButton setTitle:@"Saturation" forState:UIControlStateNormal];
    [saturationButton setBackgroundColor:[UIColor blueColor]];
    saturationButton.layer.cornerRadius = 30;
    [saturationButton setTintColor:[UIColor whiteColor]];
    [saturationButton setCenter:[self.view center]];
    [saturationButton addTarget:self action:@selector(didPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saturationButton];
    // Do any additional setup after loading the view.
}
/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


