import SwiftUI

struct NodeDiagram: View {
    @State var value: Int?
    var body: some View {
        if(value != nil){
            Text("\(value!)")
                .frame(width: 50, height: 50)
                .background(Circle().stroke())
                .background(Circle().fill(.white))
                .padding(5)
        }
        
    }
}
