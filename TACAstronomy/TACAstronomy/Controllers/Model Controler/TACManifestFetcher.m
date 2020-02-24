//
//  TACManifestFetcher.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACManifestFetcher.h"
#import "LSILog.h"
#import "LSIErrors.h"
#import "TACMarsMissionManifest.h"

@implementation TACManifestFetcher

//https://api.nasa.gov/mars-photos/api/v1/manifest/curiosity?api_key=vX6pJmz33vRDR9X8rYA6hZiM3nSoThxCSdltKqbQ

static NSString *const baseURLString = @"https://api.nasa.gov/mars-photos/api/v1/manifests";
static NSString *const apiKey = @"vX6pJmz33vRDR9X8rYA6hZiM3nSoThxCSdltKqbQ";

-(void)fetchManifestForRover:(NSString *)rover
                  completion:(TACManifestFetcherCompletion)completion {
    NSURL *baseURL = [[[NSURL alloc] initWithString:baseURLString] URLByAppendingPathComponent:rover];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"api_key" value:apiKey]
    ];
    
    NSURL *url = urlComponents.URL;
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = errorWithMessage(@"Data should not be nil from APIU request", LSIDataNilError);
            completion(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        TACMarsMissionManifest *manifest = [[TACMarsMissionManifest alloc] intitWithDictionary:json];
        if (!manifest) {
            NSError *parsingError = errorWithMessage(@"Unable to parse JSON object", LSIJSONDecodeError);
            completion(nil,parsingError);
            return;
        }
        
        
        completion(manifest, nil);
        
    }] resume];
}

@end
