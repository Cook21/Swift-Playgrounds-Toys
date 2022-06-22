import SwiftUI
typealias Key = CollectDict<Tree.ID, Anchor<CGPoint>>
struct CollectDict<Key: Hashable, Value>: PreferenceKey{
    static var defaultValue: [Key:Value] { [:] }
    static func reduce(value: inout [Key:Value], nextValue: () -> [Key:Value]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}
struct TreeDiagram: View {
    @ObservedObject var tree: Tree
    var body: some View {
        VStack(alignment: .center) {
            NodeDiagram(value: tree.value)
                .anchorPreference(key: Key.self, value: .center, transform: {
                    [self.tree.id: $0]
                })
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(0..<2){ i in
                    if(tree.children[i] != nil){
                        TreeDiagram(tree: tree.children[i]!)
                    }
                }
            }
        }
        .backgroundPreferenceValue(Key.self, { (centers: [Tree.ID: Anchor<CGPoint>]) in
            GeometryReader { proxy in
                ForEach(0..<2)  { i in
                    if(tree.children[i] != nil){
                        EdgeDiagram(
                            from: proxy[centers[self.tree.id]!],
                            to: proxy[centers[tree.children[i]!.id]!]
                        ).stroke()
                    }
                }
            }
        })
    }
}
