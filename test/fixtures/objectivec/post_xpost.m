#import <Foundation/Foundation.h>

NSURL *url = [NSURL URLWithString:@"http://localhost:28139/api/xxxxxxxxxxxxxxxx"];
NSDictionary *headers = @{
    @"Content-Type": @"application/x-www-form-urlencoded"
};

NSMutableData *data = [[NSMutableData alloc] initWithData:[@"{\"keywords\":\"php\",\"page\":1,\"searchMode\":1}" dataUsingEncoding:NSUTF8StringEncoding]];

NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
[request setHTTPMethod:@"POST"];
[request setAllHTTPHeaderFields:headers];
[request setHTTPBody:data];

NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
        NSLog(@"%@", error);
    } else {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSLog(@"%@", httpResponse);
    }
}];
[dataTask resume];
