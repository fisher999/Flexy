//
//  DMMultiDelegatesProxy.m
//  MultiDelegatesProxyExample
//
//  Created by Daniele Margutti on 05/02/14.
//  Copyright (c) 2014 danielemargutti. All rights reserved.
//

#import "MultiDelegatesProxy.h"

@interface MultiDelegatesProxy () { }

@property (nonatomic,strong)	NSPointerArray *delegatesPointerArray;

@end

@implementation MultiDelegatesProxy



+ (id) newProxyWithMainDelegate:(id) aMainDelegate other:(NSArray *) aDelegates {
    return [[MultiDelegatesProxy alloc] initWithMainDelegate:aMainDelegate other:aDelegates];
}

- (id)initWithMainDelegate:(id) aMainDelegate other:(NSArray *) aDelegates {
    [self setDelegates:aDelegates];
    [self setMainDelegate:aMainDelegate];
    return self;
}

- (id) newProxyWithDelegates:(NSArray *) aDelegates {
    [self setDelegates:aDelegates];
    return self;
}



- (NSMethodSignature *) methodSignatureForSelector:(SEL)selector {
	return [[self.mainDelegate class] instanceMethodSignatureForSelector:selector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
	if ([self.mainDelegate respondsToSelector:aSelector])
		return YES;
    for (id delegateObj in self.delegatesPointerArray.allObjects)
        if ([delegateObj respondsToSelector:aSelector])//{
            /*SEL sel = NSSelectorFromString(@"tableView:cellForRowAtIndexPath:");
            if (sel == aSelector) {
                return NO;
            }
        }
            else*/
                return YES;
    return NO;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
	
    BOOL methodReturnSomething = (![[NSString stringWithCString:invocation.methodSignature.methodReturnType encoding:NSUTF8StringEncoding] isEqualToString:@"v"]);
 
    if ([self.mainDelegate respondsToSelector:invocation.selector])
        [invocation invokeWithTarget:self.mainDelegate];
    
	
	
	NSInvocation *targetInvocation = invocation;
	if (methodReturnSomething) {
		targetInvocation = [NSInvocation invocationWithMethodSignature:invocation.methodSignature];
		[targetInvocation setSelector:invocation.selector];
	}
	SEL sel = NSSelectorFromString(@"tableView:cellForRowAtIndexPath:");
	for (id delegateObj in self.delegatesPointerArray.allObjects) {
		if ([delegateObj respondsToSelector:invocation.selector] && invocation.selector != sel)
			[targetInvocation invokeWithTarget:delegateObj];
    }
}

- (void)setDelegates:(NSArray *)aNewDelegates {
    self.delegatesPointerArray = [NSPointerArray weakObjectsPointerArray];
    [aNewDelegates enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.delegatesPointerArray addPointer:(void *)obj];
    }];
}

- (NSArray *) delegates {
    return self.delegatesPointerArray.allObjects;
}

- (void)addDelegate:(id) delegate {
    
}



@end
