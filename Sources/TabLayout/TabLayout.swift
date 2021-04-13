import SwiftUI
import UIKit

struct TabLayout: View {
    
    var children: [Element]
    let tintColor: Color
    let backgroundColor: Color
    
    @ObservedObject var mediator: TabLayoutMediator
    
    init(
        children: [Element],
        tintColor: Color,
        backgroundColor: Color = Color(UIColor.systemBackground),
        mediator: TabLayoutMediator
    ) {
        self.mediator = mediator
        self.children = children
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        HStack {
            ForEach(children.indices) { index in
                let currentIndex = mediator.currentIndex
                let child = children[index]
                let backgroundColor = currentIndex == index ? self.tintColor : self.backgroundColor
                let tintColor = currentIndex == index ? self.backgroundColor : self.tintColor
                
                Button(child.name) {
                    mediator.currentIndex = index
                }
                .background(backgroundColor)
                .foregroundColor(tintColor)
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
