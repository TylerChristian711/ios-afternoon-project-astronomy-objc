//
//  TACFetchManifestOperation.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACFetchManifestOperation.h"

typedef NS_ENUM(NSUInteger, TACFetchOperationState) {
    TACFetchOperationReady,
    TACFetchOperationIsExecuting,
    TACFetchOperationIsFinished
};

NSString *rawValue(TACFetchOperationState state) {
    switch (state) {
        case TACFetchOperationReady:
            return @"isReady";
        case TACFetchOperationIsExecuting:
            return @"isExecuting";
        case TACFetchOperationIsFinished:
            return @"isFinished";
    }
}

@interface TACFetchManifestOperation () {
    TACFetchOperationState _state;
}

@property (atomic) TACFetchOperationState state;
@property (atomic, nonnull) NSLock *lock;


@end


@implementation TACFetchManifestOperation

-(instancetype) initWithManifestFetcher:(TACManifestFetcher *)manifestFetcher {
    self = [super init];
    if (self) {
        _manifestFetcher = manifestFetcher;
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
    [self willChangeValueForKey:rawValue(oldState)];
    [self willChangeValueForKey:rawValue(state)];
    _state = state;
    [self didChangeValueForKey:rawValue(oldState)];
    [self didChangeValueForKey:rawValue(state)];
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
    [self.manifestFetcher fetchManifestForRover:@"curiosity" completion:^(TACMarsMissionManifest * _Nullable manifest, NSError * _Nullable error) {
        if (error) {
            self.state = TACFetchOperationIsFinished;
            return;
        }
        self.manifest = manifest;
        self.state = TACFetchOperationIsFinished;
    }];
}



@end
