//
//  ContentView.swift
//  Lockday10
//
//  Created by Zach Smith on 9/6/21.
//



import SwiftUI

struct ContentView: View {
    
    var body: some View {
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                LockView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


























struct LockView: View {
    
    @State var isLock: Bool = false
    var body: some View {
        
        
        ZStack{
            
            
            ZStack{
            Circle()
                .trim( from: 0, to: 0.5)
                .stroke(isLock ? Color.gray : Color.gray, style: StrokeStyle(lineWidth: 27, lineCap: .square))
                .frame(width: 160, height: 160, alignment: .center)
                .rotationEffect(.degrees(isLock ? 270 : 180))
                .animation(Animation.easeInOut(duration: 1.0).repeatCount(1))
                .onAppear() {
                self.isLock.toggle()
                }.offset(x: 0, y: -133)
                
                
            }
            
            
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.black)
                .foregroundColor(isLock ? .gray : .white)
                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        
        VStack {
            Text( isLock  ? "Unlock" : "Lock")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(isLock ? .gray : .gray)
            Toggle("", isOn: $isLock)
                    
                .labelsHidden()
        }.padding()
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 8)
                .foregroundColor(isLock ? .gray : .gray)
                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        )
    }
    }
}
