import SwiftUI

struct SoundCell: View {

    @State var soundId: String
    @State var title: String
    @State var author: String
    @Binding var favorites: Set<String>
    var isFavorite: Bool {
        favorites.contains(soundId)
    }
    
    let gradiente = LinearGradient(gradient: Gradient(colors: [.darkGreen, .darkGreen, .brightYellow]), startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(gradiente)
                .frame(height: 90)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .foregroundColor(.white)
                        .font(title.count > 26 ? .callout : .body)
                        .bold()
                    
                    Text(author)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.leading, 20)
            
            if isFavorite {
                HStack {
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                        .foregroundColor(.red)
                        .offset(y: -22)
                }
                .padding(.trailing, 10)
            }
        }
    }

}

struct SoundRow_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            // Regular
            SoundCell(soundId: "ABC", title: "A gente vai cansando", author: "Soraya Thronicke", favorites: .constant(Set<String>()))
            SoundCell(soundId: "ABC", title: "Funk do Xandão", author: "Roberto Jeferson", favorites: .constant(Set<String>()))
            
            // Favorite
            SoundCell(soundId: "DEF", title: "A gente vai cansando", author: "Soraya Thronicke", favorites: .constant(Set<String>(arrayLiteral: "DEF")))
            SoundCell(soundId: "GHI", title: "Funk do Xandão", author: "Roberto Jeferson", favorites: .constant(Set<String>(arrayLiteral: "GHI")))
        }
        .previewLayout(.fixed(width: 170, height: 100))
    }

}
