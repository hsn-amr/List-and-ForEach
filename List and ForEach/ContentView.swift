//
//  ContentView.swift
//  List and ForEach
//
//  Created by administrator on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(persons, id: \.id){
            person in
            HStack{
                Image(systemName: person.gender.rawValue)
                Text(person.name)
            }
        }
        VStack(alignment:.center, spacing: 10 ){
            
            // lazyVStack & LazyHStack they don't load all view at once, they load based on what view are visibel now to user
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(persons, id: \.id){
                        person in
                        VStack{
                            Image(systemName: person.gender.rawValue)
                            Text(person.name)
                                .onAppear{print(person.name)}
                        }
                    }
                }
            }
            
            ScrollView(.vertical){
                LazyVStack(alignment: .center, spacing: 20){
                    ForEach(0..<100){
                        number in
                        Text("\(number)")
                            .onAppear{
                                print(number)
                            }
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Person: Hashable/*, Identifiable (if we use it we don't need "id" in list parameters) */ {
    
        enum Gender: String {
            case male = "mustache"
            case female = "mouth"
        }
        
        let id: UUID
        let name: String
        let gender: Gender
    }
let persons = [
        Person(id: UUID(), name: "Hussein", gender: .male),
        Person(id: UUID(), name: "Kevin", gender: .male),
        Person(id: UUID(), name: "Nadia", gender: .female),
        Person(id: UUID(), name: "James", gender: .male),
        Person(id: UUID(), name: "Sara", gender: .female),
        Person(id: UUID(), name: "Danny", gender: .male),
        Person(id: UUID(), name: "Chris", gender: .male),
        Person(id: UUID(), name: "Joanna", gender: .female),
        Person(id: UUID(), name: "Qoot", gender: .female),
        Person(id: UUID(), name: "Wasan", gender: .female),
        Person(id: UUID(), name: "Madison", gender: .female),
        Person(id: UUID(), name: "Todd", gender: .male)
    ]

