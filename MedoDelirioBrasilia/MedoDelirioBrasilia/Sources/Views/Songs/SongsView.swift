import SwiftUI

struct SongsView: View {
    
    @StateObject private var viewModel = SongsViewViewModel()
    @State private var showingHelpScreen = false
    @State private var searchText = ""
    @State private var searchBar: UISearchBar?
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var searchResults: [Song] {
        if searchText.isEmpty {
            return viewModel.songs
        } else {
            return viewModel.songs.filter { sound in
                let searchString = sound.title.lowercased().withoutDiacritics()
                return searchString.contains(searchText.lowercased().withoutDiacritics())
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: HelpView(), isActive: $showingHelpScreen) { EmptyView() }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(searchResults) { song in
                            SongCell(title: song.title)
                                .onTapGesture {
                                    viewModel.playSong(fromPath: song.filename)
                                }
                                .onLongPressGesture {
                                    viewModel.shareSong(withPath: song.filename)
                                }
                        }
                    }
                    .searchable(text: $searchText)
                    .padding(.horizontal)
                    .padding(.top, 7)
                    
                    if searchText.isEmpty {
                        Text("\(viewModel.songs.count) músicas. Atualizado em \(songsLastUpdateDate).")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                            .padding(.bottom, 18)
                    }
                }
            }
            .navigationTitle("Músicas")
            .navigationBarItems(leading:
                Button(action: {
                    showingHelpScreen = true
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                    }
                }
            )
            .onAppear {
                viewModel.reloadList()
            }
        }
    }

}

struct SongsView_Previews: PreviewProvider {

    static var previews: some View {
        SongsView()
    }

}
