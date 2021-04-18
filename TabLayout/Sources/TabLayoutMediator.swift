import SwiftUI

public class TabLayoutMediator: ObservableObject {
    
    @Published var currentIndex: Int
    
    public init(currentIndex: Int = 0) {
        self.currentIndex = currentIndex
    }
}
