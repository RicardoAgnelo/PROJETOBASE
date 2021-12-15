//
//  ContentView.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 15/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(alignment:.top, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
            Image("Captura de Tela 2021-12-09 às 12.39.44")
                .resizable()
                .scaledToFit()
                .frame(height:100)
                .cornerRadius(35)
            VStack(alignment: .leading, spacing: 5){
            Text("Nome do Repositorio")
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
                Text("Nome do autor")
                    .fontWeight(.semibold)
                HStack{
                    Text("Stars  ")
                        .fontWeight(.semibold)
                        
                    Text("12379")
                }
                HStack{
                    Text("Forks  ")
                        .fontWeight(.semibold)
                    Text("50")
                }
            }
            VStack{
                Text("Descricao")
                    .fontWeight(.bold)
                Text("KKKKKKKJKJKJKJKJKJKJKJJKJNKJNKJBKHBKHBKHBKHBKHBKHBKHBKHBKHBKHBKHBKHBKHBKBKHBKHBKHBKHB")
                    .lineLimit(4)
                    .minimumScaleFactor(0.3)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
