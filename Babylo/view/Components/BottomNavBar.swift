//
//  BottomNavBar.swift
//  Babylo
//
//  Created by Babylo  on 12/4/2023.
//

import SwiftUI

struct BottomNavBar: View {
    @Binding var selectedIndex: Int

     var body: some View {
         HStack {
             TabBarButton(selectedIndex: $selectedIndex, assignedIndex: 0, systemImageName: "house")
             TabBarButton(selectedIndex: $selectedIndex, assignedIndex: 1, systemImageName: "music.note")
             Spacer()
             TabBarButton(selectedIndex: $selectedIndex, assignedIndex: 2, systemImageName: "books.vertical")
             TabBarButton(selectedIndex: $selectedIndex, assignedIndex: 3, systemImageName: "gearshape")
         }
         .padding(.horizontal, 16)
         .padding(.bottom,5)
         .padding(.top,5)
         .background(Color.white)
         .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
         .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 4)
         .padding(.horizontal)
         .frame(height: 50) // Set a smaller fixed height for the custom navigation tab
     }
 }

 struct TabBarButton: View {
     @Binding var selectedIndex: Int
     let assignedIndex: Int
     let systemImageName: String

     var body: some View {
         Button(action: {
             withAnimation {
                 selectedIndex = assignedIndex
             }
         }) {
             VStack {
                 if assignedIndex == 1 {
                     Spacer(minLength: 15) // Add smaller spacing for the music button
                 }
                 Image(systemName: systemImageName)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 20, height: 20) // Smaller icon size
                     .foregroundColor(selectedIndex == assignedIndex ? .yellow : .gray)
                 if assignedIndex == 1 {
                     Spacer(minLength: 15) // Add smaller spacing for the music button
                 }
             }
             .frame(maxWidth: .infinity)
         }
     }
 }
