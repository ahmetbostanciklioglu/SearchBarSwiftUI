import SwiftUI
import Combine

struct SearchBar: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        VStack {
            SearchView(searchText: $viewModel.searchText)
             
            List(viewModel.filteredData, id: \.self) {
                Text($0)
            }
        }
    }
}


class ViewModel: ObservableObject {
    @Published var datas = ["hello", "World", "Swift", "UI"]
    @Published var searchText: String = ""
    
    /// Filtering the datas at search time and according to that showing the items in the list.
    var filteredData: [String] {
        datas.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)  }
    }
}

#Preview("Search Bar View Preview") {
    SearchBar()
}
