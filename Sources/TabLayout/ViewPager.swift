import Foundation
import SwiftUI

struct ViewPager: View {
    
    @Binding var selection: Int
    
    let size: Int
    let content: (Int) -> AnyView
    
    var body: some View {
        TabView(
            selection: _selection,
            content:  {
                ForEach(0..<size) { index in
                    content(index)
                }
            }
        ).tabViewStyle(DefaultTabViewStyle())
    }
}
