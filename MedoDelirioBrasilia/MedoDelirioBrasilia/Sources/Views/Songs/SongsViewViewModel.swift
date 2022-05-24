import Combine
import UIKit

class SongsViewViewModel: ObservableObject {
    
    @Published var songs = [Song]()
    @Published var sortOption: Int = 0
    
    func reloadList() {
        if UserSettings.getShowOffensiveSounds() {
            self.songs = songData
        } else {
            self.songs = songData.filter({ $0.isOffensive == false })
        }
        
        self.sortOption = 0 //UserSettings.getArchiveSortOption()
        
        if self.songs.count > 0 {
            self.songs.sort(by: { $0.title.withoutDiacritics() < $1.title.withoutDiacritics() })
        }
    }
    
    func playSong(fromPath filepath: String) {
        guard filepath.isEmpty == false else {
            return
        }
        
        let path = Bundle.main.path(forResource: filepath, ofType: nil)!
        let url = URL(fileURLWithPath: path)

        player = AudioPlayer(url: url, update: { state in
            //print(state?.activity as Any)
        })
        
        player?.togglePlay()
    }

    func shareSong(withPath filepath: String) {
        guard filepath.isEmpty == false else {
            return
        }
        
        let path = Bundle.main.path(forResource: filepath, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }

}
