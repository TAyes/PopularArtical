
import SwiftUI

struct ArticalDetail<T: ArticalDetailViewModelType>: View {
    
    @ObservedObject var articalDetailViewModel: T//2
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            GeometryReader { g in
                VStack {
                    ZStack(alignment: .top) {
                        if let urlString = articalDetailViewModel.setStringUrl(), let url = URL(string: urlString) {
                            AsyncImage(
                                url: url,
                                placeholder: { ProgressView() },
                                image: { Image(uiImage: $0).resizable() }
                            ) .frame(width: g.size.width, height: g.size.height / 2.3)
                        } else {
                            Image(systemName: "photo").resizable() .frame(width: g.size.width, height: g.size.height / 2.3)
                        }
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .font(.title)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(.white.opacity(0.5))
                                    .cornerRadius(100)
                            })
                            Spacer()
                          
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, g.size.height * 0.07)
                    }.frame(height: g.size.height / 2.3)
                    HStack {
                        Text("Post Updated")
                            .font(.caption)
                            .foregroundColor(.black)
                        Spacer()
                        Text(articalDetailViewModel.article.publishedDate ?? "")
                            .font(.caption)
                            .foregroundColor(.black)
                    }.padding(.horizontal)
                    .padding(.vertical, 10)
                    VStack(alignment: .leading,spacing: 30) {
                        Text(articalDetailViewModel.article.title ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(articalDetailViewModel.article.abstract ?? "").lineSpacing(10)
                    }.padding()
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: [.top,.bottom])
    }
}

struct ArticalDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticalDetail(articalDetailViewModel: ArticalDetailViewModel(artical: Article()))
    }
}
