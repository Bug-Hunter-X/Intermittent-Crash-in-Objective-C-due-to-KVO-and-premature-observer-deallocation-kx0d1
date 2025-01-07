To fix this, ensure the observer is removed before it's deallocated.  Here's how you can modify the observer's `dealloc` method:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, weak) NSObject *observedObject;
- (void)dealloc;
@end

@implementation MyObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // ... KVO handling ...
}

- (void)dealloc {
    if (self.observedObject) {
        [self.observedObject removeObserver:self forKeyPath:@