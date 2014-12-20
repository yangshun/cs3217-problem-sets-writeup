/*
    String extension that provides encrypt and decrypt functionalities.
*/


extension String {
    
    //  Return a string encrypted by using `key`.
    func encrypt(key: Int) -> String {
        return self.breadthFirstToTreeWithNumberOfChildren(key).depthFistToString()
    }
    
    //  Return a string decrypted by using `key`.
    func decrypt(key: Int) -> String {
        return self.depthFirstToTreeWithNumberOfChildren(key).breadthFirstToString()
    }
    
    //  Return a tree with String labels such that when performing a breath-first traversal
    //  on this tree, its labels appear in the same order that they appear from left to
    //  right of the string `self`.
    //
    //  In other words,
    //  str.breadthFirstToTreeWithNumberOfChildren(n).breadthFirstToString() == str
    func breadthFirstToTreeWithNumberOfChildren(numberOfChildren: Int) -> Tree<String> {
        
        return Tree<String>(isDirected: false) // Please remove this line in actual implementation
    }
    
    //  Return a tree with String labels such that when performing a depth-first traversal
    //  on this tree, its labels appear in the same order that they appear from left to
    //  right of the string `self`.
    //
    //  In other words,
    //  str.depthFirstToTreeWithNumberOfChildren(n).depthFirstToString() == str
    func depthFirstToTreeWithNumberOfChildren(numberOfChildren: Int) -> Tree<String> {
        
        return Tree<String>(isDirected: false) // Please remove this line in actual implementation
    }
}
