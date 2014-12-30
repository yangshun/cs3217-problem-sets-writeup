//
//  NodeTests.swift
//  GraphADT
//
//  Copyright (c) 2014 NUS CS3217. All rights reserved.
//

import XCTest


class NodeTests : XCTestCase {
    
    func testConstruct() {
        let node = Node("A")
        
        XCTAssertEqual(node.label, "A", "Node label is not correct")
    }
    
    func testEqual_nodesWithSameLabel_isEqual() {
        let node1 = Node("A")
        let node2 = Node("A")
        
        XCTAssertEqual(node1, node2, "Nodes with same label should be equal")
    }
    
    func testEqual_nodeWithDifferentLabels_isNotEqual() {
        let node1 = Node("A")
        let node2 = Node("B")
        
        XCTAssertNotEqual(node1, node2, "Nodes with different labels should not be equal")
    }
}
