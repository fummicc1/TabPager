import SwiftUI

struct TabLayout: View {
    
    var children: [Element]
    
    init(children: [Element]) {
        self.children = children
    }
    
    var body: some View {
        HStack {
            ForEach(children) { child in
                Text(child.name)
            }
        }
    }
}

extension TabLayout {
    struct Element: Identifiable {
        var id: Int {
            index
        }
        let name: String
        let index: Int
    }
}
