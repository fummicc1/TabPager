import SwiftUI
import UIKit

public struct TabLayout: View {
    
    var children: [Element]
    let tintColor: Color
    let backgroundColor: Color
    
    @ObservedObject var mediator: TabLayoutMediator
    
    public init(
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
    
    public var body: some View {
        VStack {
            ViewPager(
                mediator: mediator,
                size: children.count) { index -> AnyView in
                return children[index].content()
            }
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
}

extension TabLayout {
    public struct Element: Identifiable {
        public var id: Int {
            index
        }
        let name: String
        let index: Int
        let content: () -> AnyView
        
        public init(
            index: Int,
            name: String,
            content: @escaping () -> AnyView
        ) {
            self.index = index
            self.name = name
            self.content = content
        }
    }
}
