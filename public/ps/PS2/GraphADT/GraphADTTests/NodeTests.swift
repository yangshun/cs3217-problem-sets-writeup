//
//  NodeTests.swift
//  GraphADT
//
//  Copyright (c) 2014 NUS CS3217. All rights reserved.
//

import XCTest


class NodeTests : XCTestCase {
    
    func testConstruct() {
        let node = Node(id: 1, label: "A")
        
        XCTAssertEqual(node.label, "A", "Node label is not correct")
    }
    
    func testEqual_nodesWithSameID_isEqual() {
        let node1 = Node(id: 1, label: "A")
        let node2 = Node(id: 1, label: "AAA")
        
        XCTAssertEqual(node1, node2, "Nodes with same ID should be equal")
    }
    
    func testEqual_nodeWithDifferentIDs_isNotEqual() {
        let node1 = Node(id: 1, label: "A")
        let node2 = Node(id: 2, label: "A")
        
        XCTAssertNotEqual(node1, node2, "Nodes with different IDs should not be equal")
    }
    
    func testHashValue_equalNodes_sameHashValue() {
        let node1 = Node(id: 1, label: "A")
        let node2 = Node(id: 1, label: "AAA")
        
        XCTAssertEqual(node1.hashValue, node2.hashValue, "Equal nodes should have the same hash value")
    }
    
    func testHashValue_unequalNodes_differentHashValues() {
        let node1 = Node(id: 1, label: "A")
        let node2 = Node(id: 2, label: "B")
        
        XCTAssertNotEqual(node1.hashValue, node2.hashValue, "Unequal nodes should have different hash values")
    }
}
