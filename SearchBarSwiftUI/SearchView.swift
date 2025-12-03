import SwiftUI

/// UIViewRepresentable is a Wrapper between view(UIKit i.e. UISearchBar) and SwiftUI
struct SearchView: UIViewRepresentable {
    /// We use searchText for data connection with SwiftUI
    @Binding var searchText: String
    /// Creating a UISearchBar View
    func makeUIView(context: UIViewRepresentableContext<SearchView>) -> UISearchBar {
        let searchbar = UISearchBar()
        searchbar.barStyle = .default
        searchbar.placeholder = "Write here..."
        searchbar.autocapitalizationType = .none
        searchbar.delegate = context.coordinator
        return searchbar
    }
    /// Connecting uiView (UISearchBar) and searchText (SwiftUI string)
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
    /// To use UIKit Delegate methods we make Coordinator to connect with SearchView
    func makeCoordinator() -> Coordinator {
        return SearchView.Coordinator(parent1: self)
    }
    /// Bridging UIKit  searchView to SwiftUI searchView with parent.searchText = searchText
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchView!
        init(parent1: SearchView) {
            parent = parent1
        }
        /// To listen text change we use this Delegate method
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.searchText = searchText
        }
    }
}
