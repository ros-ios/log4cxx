//
//  ROSViewController.m
//  log4cxx
//
//  Created by Furushchev on 02/14/2016.
//  Copyright (c) 2016 Furushchev. All rights reserved.
//

#import "ROSViewController.h"

#include <log4cxx/logger.h>
#include <log4cxx/xml/domconfigurator.h>

@interface ROSViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ROSViewController

+ (void)testLog4cxx
{
    NSString *logdir = NSTemporaryDirectory();
    setenv("LOG_DIR", [logdir UTF8String], 1);
    std::string configpath = std::string([[[NSBundle mainBundle] pathForResource:@"config" ofType:@"xml"] UTF8String]);
    log4cxx::xml::DOMConfigurator::configure(configpath);
    log4cxx::LoggerPtr log(log4cxx::Logger::getRootLogger());
    
    NSLog(@"Start Logging");
    for (int i = 0; i < 100; i++) {
        LOG4CXX_INFO(log, "logging 100 times");
    }
    NSLog(@"End Logging");
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [ROSViewController testLog4cxx];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"log.txt"];
    NSError *err;
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    self.textView.text = text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
