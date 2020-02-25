//
//  TACFetchPhotoOperation.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACFetchPhotoOperation.h"
#import "NSURL+NSURL_TACUsingHTTPS.h"

typedef NS_ENUM(NSUInteger, TACFetchOperationState) {
    TACFetchOperationReady,
    TACFetchOperationIsExecuting,
    TACFetchOperationIsFinished
};

NSString *photoRawValue(TACFetchOperationState state) {
    switch (state) {
        case TACFetchOperationReady:
            return @"isReady";
        case TACFetchOperationIsExecuting:
            return @"isExecuting";
        case TACFetchOperationIsFinished:
            return @"isFinished";
    }
}

@interface TACFetchPhotoOperation () {
    TACFetchOperationState _state;
}

@property (atomic) TACFetchOperationState state;
@property (atomic, nonnull) NSLock *lock;
@property (nonatomic, nullable) NSURLSessionDataTask *dataTask;


@end


@implementation TACFetchPhotoOperation

-(instancetype) initWithSol:(TACMarsSol *)sol {
    self = [super init];
    if (self) {
        _sol = sol;
        _state = TACFetchOperationReady;
    }
    return self;
}


-(TACFetchOperationState)state {
    [self.lock lock];
    TACFetchOperationState result = _state;
    [self.lock unlock];
    return result;
}

-(void)setState:(TACFetchOperationState)state {
    [self.lock lock];
    TACFetchOperationState oldState = _state;
    [self willChangeValueForKey:photoRawValue(oldState)];
    [self willChangeValueForKey:photoRawValue(state)];
    _state = state;
    [self didChangeValueForKey:photoRawValue(oldState)];
    [self didChangeValueForKey:photoRawValue(state)];
    [self.lock unlock];
}


-(BOOL) isAsynchronous {
    return YES;
}

-(BOOL) isReady {
    return (self.state == TACFetchOperationReady);
}

-(BOOL) isExecuting {
    return (self.state == TACFetchOperationIsExecuting);
}

-(BOOL) isFinished {
    return (self.state == TACFetchOperationIsFinished);
}

-(void)start {
    self.state = TACFetchOperationIsExecuting;
    NSURL *url = [[NSURL URLWithString:self.sol.imageURL] urlUSingHTTPS];
    self.dataTask = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (self.cancelled) {
            self.state = TACFetchOperationIsFinished;
            return;
        }
        
        if (error) {
            self.state = TACFetchOperationIsFinished;
            return;
        }
        
        self.image = [UIImage imageWithData:data];
        self.state = TACFetchOperationIsFinished;
    }];
    [self.dataTask resume];
}

-(void) cancel {
    [self.dataTask cancel];
    [super cancel];
}

@end
