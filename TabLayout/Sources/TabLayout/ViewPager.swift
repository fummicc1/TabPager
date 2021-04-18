import Foundation
import SwiftUI

struct ViewPager: View {
    
    @ObservedObject var mediator: TabLayoutMediator
    
    let size: Int
    let content: (Int) -> AnyView
    
    var body: some View {
        TabView(
            selection: Binding(get: {
                mediator.currentIndex
            }, set: { index in
                mediator.currentIndex = index
            }),
            content:  {
                ForEach(0..<size) { index in
                    content(index)
                }
            }
        ).tabViewStyle(PageTabViewStyle())
    }
}
