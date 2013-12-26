#import <XCTest/XCTest.h>
#import "Graph.h"

@interface GraphADT_Tests : XCTestCase

@end

@implementation GraphADT_Tests

Node* node(id label) {
    return [[Node alloc] initWithLabel:label];
}

Node* node2(id label) {
    return [Node nodeWithLabel:label];
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPass
{
    XCTAssertTrue(1==1, @"");
}

- (void)testNodeCtor
{
    XCTAssertNoThrow(node([NSNumber numberWithInt:1]));
    XCTAssertNoThrow(node([NSNumber numberWithDouble:3.5]));
    XCTAssertNoThrow(node(@"A"));
    XCTAssertNoThrow(node(@"First Node"));
    
    XCTAssertThrows(node(nil), @"");
}

- (void)testNodeConvenienceCtor
{
    XCTAssertNoThrow(node2([NSNumber numberWithInt:1]));
    XCTAssertNoThrow(node2([NSNumber numberWithDouble:3.5]));
    XCTAssertNoThrow(node2(@"A"));
    XCTAssertNoThrow(node2(@"First Node"));
    
    XCTAssertThrows(node2(nil), @"");
}

- (void)testNodeIsEqual
{
    XCTAssertTrue([node([NSNumber numberWithInt:5]) isEqual:node2(@5)], @"The two nodes should be equal");
    XCTAssertTrue([node([NSNumber numberWithInt:5]) isEqual:node2(@5.0)], @"The two nodes should be equal");
    XCTAssertTrue([node(@"Node 1") isEqual:node2(@"Node 1")], @"The two nodes should be equal");
    
    XCTAssertFalse([node([NSNumber numberWithInt:5]) isEqual:node2(@1)], @"The two nodes should not be equal");
    XCTAssertFalse([node(@"Five") isEqual:node2([NSNumber numberWithDouble:5.0])], @"The two nodes should not be equal");
    XCTAssertFalse([node(@5) isEqual:node2(@-5)], @"The two nodes should not be equal");
    XCTAssertFalse([node(@"Node 1") isEqual:node2(@"Node1")], @"The two nodes should not be equal");
    XCTAssertFalse([node(@"A") isEqual:node2(@"a")], @"The two nodes should not be equal");
    XCTAssertFalse([node(@"A") isEqual:node2(@"AB")], @"The two nodes should not be equal");
}

- (void)testEdgeCtor
{
    Node* validNode1 = node(@1);
    Node* validNode2 = node(@"A");
    
    XCTAssertNoThrow([[Edge alloc] initWithSource:validNode1 andDestination:validNode2]);
    XCTAssertNoThrow([[Edge alloc] initWithSource:validNode1 andDestination:validNode2 andWeight:@5]);
    XCTAssertNoThrow([[Edge alloc] initWithSource:validNode1 andDestination:validNode2 andWeight:@10.5]);
    XCTAssertNoThrow([[Edge alloc] initWithSource:validNode1 andDestination:validNode2 andWeight:@0]);
    
    XCTAssertThrows([[Edge alloc] initWithSource:nil andDestination:validNode2]);
    XCTAssertThrows([[Edge alloc] initWithSource:validNode1 andDestination:nil]);
    XCTAssertThrows([[Edge alloc] initWithSource:nil andDestination:validNode2 andWeight:@5]);
    XCTAssertThrows([[Edge alloc] initWithSource:validNode1 andDestination:nil andWeight:@5]);
    XCTAssertThrows([[Edge alloc] initWithSource:validNode1 andDestination:validNode2 andWeight:nil]);
    XCTAssertThrows([[Edge alloc] initWithSource:validNode1 andDestination:validNode2 andWeight:@-2]);
}

- (void)testEdgeConvenienceCtor
{
    Node* validNode1 = node(@1);
    Node* validNode2 = node(@"A");
    
    XCTAssertNoThrow([Edge edgeWithSource:validNode1 andDestination:validNode2]);
    XCTAssertNoThrow([Edge edgeWithSource:validNode1 andDestination:validNode2 andWeight:@5]);
    XCTAssertNoThrow([Edge edgeWithSource:validNode1 andDestination:validNode2 andWeight:@10.5]);
    XCTAssertNoThrow([Edge edgeWithSource:validNode1 andDestination:validNode2 andWeight:@0]);
    
    XCTAssertThrows([Edge edgeWithSource:nil andDestination:validNode2]);
    XCTAssertThrows([Edge edgeWithSource:validNode1 andDestination:nil]);
    XCTAssertThrows([Edge edgeWithSource:nil andDestination:validNode2 andWeight:@5]);
    XCTAssertThrows([Edge edgeWithSource:validNode1 andDestination:nil andWeight:@5]);
    XCTAssertThrows([Edge edgeWithSource:validNode1 andDestination:validNode2 andWeight:nil]);
    XCTAssertThrows([Edge edgeWithSource:validNode1 andDestination:validNode2 andWeight:@-2]);
}

- (void)testEdgeIsEqual
{
    Edge *e1 = [Edge edgeWithSource:node(@1) andDestination:node(@2)];
    Edge *e2 = [Edge edgeWithSource:node(@"A") andDestination:node(@"B")];
    Edge *e3 = [Edge edgeWithSource:node(@1) andDestination:node(@2) andWeight:@1];
    Edge *e4 = [Edge edgeWithSource:node(@"A") andDestination:node(@"B") andWeight:@5];
    
    XCTAssertTrue([e1 isEqual:e1], @"The two edges should be equal");
    XCTAssertTrue([e1 isEqual:e3], @"The two edges should be equal");
    
    XCTAssertFalse([e1 isEqual:e2], @"The two edges should not be equal");
    XCTAssertFalse([e1 isEqual:e4], @"The two edges should not be equal");
    XCTAssertFalse([e2 isEqual:e4], @"The two edges should not be equal");
    XCTAssertFalse([e2 isEqual:e3], @"The two edges should not be equal");
    XCTAssertFalse([e3 isEqual:e4], @"The two edges should not be equal");    
}

@end
