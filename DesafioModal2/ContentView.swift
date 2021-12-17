//
//  ContentView.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 15/12/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var repos = RepositoriesFeed()
    var body: some View {
        NavigationView {
            List(repos.items){ i in
                cell(name: i.name, url: i.owner.avatar_url, full_name: i.owner.login, watchers: i.watchers_count, forks: i.forks_count, description: i.description ?? "No content").onAppear {
                    repos.loadMoreContentIfNeeded(currentItem: i)
                    
                }
            }
            .navigationTitle("Repositórios de Swift")
        }
    }
    
    
    struct  cell: View {
        var name : String
        var url : String
        var full_name : String
        var watchers : Int
        var forks : Int
        var description : String
        var body: some View {
            VStack(alignment:.leading){
                HStack{
                    AnimatedImage(url: URL(string: url)!)
                        .resizable()
                        .scaledToFit()
                        .frame(height:100)
                        .cornerRadius(35)
                    VStack(alignment: .leading, spacing: 10){
                        VStack(alignment: .leading, spacing: 10){
                            HStack {
                                Text("  Repositorio :")
                                    .fontWeight(.bold)
                                Text(name)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.8)
                            }
                            HStack{
                                Text("  Autor :")
                                    .fontWeight(.semibold)
                                Text(full_name)
                            }
                            HStack (alignment: .center, spacing:20
                            ){
                            }
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        HStack{
                            Text(Image(systemName: "star")) + Text(" Stars:").fontWeight(.semibold)
                            Text("\(watchers)")
                        }
                        HStack {
                            Text(Image(systemName: "tuningfork")) + Text (" Forks:").fontWeight(.semibold)
                            Text("\(forks)")
                        }
                        
                    }
                    Text("Descricao")
                        .fontWeight(.semibold)
                    Text(description)
                        .lineLimit(2)
                        .minimumScaleFactor(0.9)
                }
            }
        }
    }
}
