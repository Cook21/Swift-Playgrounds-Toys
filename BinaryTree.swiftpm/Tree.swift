import SwiftUI
class Tree : Identifiable, ObservableObject{
    var id = UUID()
    @Published var value: Int
    @Published var children: [Tree?] = []
    init(_ value: Int, children: [Tree?] = [nil,nil]) {
        self.value = value
        self.children = children
    }
    func insert(newValue: Int){ //BST
        var i: Int
        if(newValue<self.value){
            i=0
        }else{
            i=1
        }
        if(children[i] != nil){
            self.children[i]?.insert(newValue: newValue)
        }else{
            self.children[i] = Tree(newValue)
        }
    }
}
