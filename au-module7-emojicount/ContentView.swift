//
//  ContentView.swift
//  au-module7-emojicount
//
//  Created by user280687 on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Emoji Counter")
                .bold()
                .font(.title)
            Spacer()
            DisplayItem()
        }
        .background(Color.yellow)
    }
}

struct EmojiItem : Identifiable {
    let id = UUID()
    var count : Int = 0
    var emoji : String
}

struct DisplayItem: View {
    
    @State var emojis : [EmojiItem] =
    [EmojiItem(emoji: "😜"),
     EmojiItem(emoji: "😭"),
     EmojiItem(emoji: "😴"),
     EmojiItem(emoji: "🥹"),
     EmojiItem(emoji: "😎")]
    
    var body: some View {
        List {
            ForEach($emojis) { $emoji in
                HStack {
                    Text("\(emoji.emoji) Counter: \(emoji.count)")
                    Spacer()
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .padding(0)
                        .foregroundColor(Color.green)
                        .onTapGesture {
                            emoji.count += 1
                        }
                    Image(systemName: "minus.circle")
                        .imageScale(.large)
                        .padding(15)
                        .foregroundColor(Color.red)
                        .onTapGesture {
                            emoji.count -= 1
                        }
                }
            }
        }
        .background(Color.blue)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ContentView()
}
