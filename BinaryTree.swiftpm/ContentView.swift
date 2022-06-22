import SwiftUI

struct ContentView: View {
    @StateObject var binaryTree = Tree(50, children: [
        Tree(17, children: [
            Tree(12),
            Tree(23)
        ]),
        Tree(72, children: [
            Tree(54),
            Tree(72)
        ])
    ])
    var body: some View {
        VStack{
            TreeDiagram(tree: binaryTree)
            Spacer().frame(width: 0, height: 40.0, alignment: .center)
            Button("Add Random Node") {
                withAnimation{
                    binaryTree.insert(newValue: Int.random(in: 0...100))
                }
                
            }
        }
    }
}
