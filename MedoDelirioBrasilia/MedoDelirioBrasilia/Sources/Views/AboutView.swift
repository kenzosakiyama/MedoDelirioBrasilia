import SwiftUI

struct AboutView: View {

    @State var showPixKeyCopiedAlert: Bool = false
    @State var showUnableToOpenPodcastsAppAlert: Bool = false
    
    let pixKey: String = "918bd609-04d1-4df6-8697-352b62462061"
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? String()
    let buildVersionNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? String()

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 40) {
                        VStack(alignment: .center, spacing: 5) {
                            Text("Esse app é uma homenagem ao brilhante trabalho de **Cristiano Botafogo** e **Pedro Daltro** no podcast **Medo e Delírio em Brasília**. Ouça no seu tocador de podcasts favorito.")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Button(action: {
                                let podcastLinkOnApplePodcasts = "https://podcasts.apple.com/br/podcast/medo-e-del%C3%ADrio-em-bras%C3%ADlia/id1502134265"
                                let podcastAppUrl = URL(string: podcastLinkOnApplePodcasts)!
                                if UIApplication.shared.canOpenURL(podcastAppUrl) {
                                    UIApplication.shared.open(podcastAppUrl)
                                } else {
                                    showUnableToOpenPodcastsAppAlert = true
                                }
                            }) {
                                Text("Ver no Apple Podcasts")
                                    .font(.callout)
                            }
                            .tint(.purple)
                            .controlSize(.large)
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.roundedRectangle)
                            .padding(.top)
                            .alert(isPresented: $showUnableToOpenPodcastsAppAlert) {
                                Alert(title: Text("Não Pôde Abrir o App Podcasts"), message: Text("Por favor, procure pelo app Podcasts no seu iPhone para continuar."), dismissButton: .default(Text("OK")))
                            }
                        }
                        
                        VStack(alignment: .center, spacing: 5) {
                            Text("Dinheiro! Aqui aceitas Pix. Qualquer R$ 1 ajuda o desenvolvedor a manter isso aqui. 💵⬇️")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Button(action: {
                                UIPasteboard.general.string = pixKey
                                showPixKeyCopiedAlert = true
                            }) {
                                Text(pixKey)
                                    .font(.footnote)
                                    .bold()
                            }
                            .tint(.blue)
                            .controlSize(.large)
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.roundedRectangle)
                            .padding(.top)
                            .alert(isPresented: $showPixKeyCopiedAlert) {
                                Alert(title: Text("Chave copiada com sucesso!"), dismissButton: .default(Text("OK")))
                            }
                        }
                        
//                        Text("\(soundData.count) sons")
//                            .padding(.bottom)
                        
                        VStack(alignment: .center, spacing: 5) {
                            Text("🧑‍💻 Quer contribuir ou entender como o app funciona? Acesse o código fonte:")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Button(action: {
                                let githubUrl = URL(string: "https://github.com/rafaelclaycon/MedoDelirioBrasilia")!
                                UIApplication.shared.open(githubUrl)
                            }) {
                                Text("Ver projeto no GitHub")
                            }
                            .tint(.gray)
                            .controlSize(.large)
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.capsule)
                            .padding(.top)
                        }
                        
                        VStack(spacing: 15) {
                            Text("Criado por @claycon_")
                            
                            Text("Versão \(appVersion) Build \(buildVersionNumber)")
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Sobre")
        }
    }

}

struct AboutView_Previews: PreviewProvider {

    static var previews: some View {
        AboutView()
    }

}
