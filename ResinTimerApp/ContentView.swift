//
//  ContentView.swift
//  ResinTimerApp
//
//  Created by Эрхаан Говоров on 09.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home(  )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct Home : View {
    @State private var animationAmount = 1.0
    @State var start = false
    @State var showDetail = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var countDown = 480 // восстановление одной смолы
    @State var countDownFull = 76800
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   
    
    var body: some View {
        
        ZStack {
            
           // Color(red: 231 / 255, green: 226 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
            // Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255).edgesIgnoringSafeArea(.all)
            Color(red: 229 / 255, green: 238 / 255, blue: 255 / 255).edgesIgnoringSafeArea(.all)
            
            VStack {
        
                
                ZStack {
                    
                   /* Circle()
                        .frame(width: 280, height: 235)
                        .foregroundColor(Color(red: 224 / 255, green: 214 / 255, blue: 198 / 255))
                    */
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.indigo.opacity(0.3), style: StrokeStyle(lineWidth: 45, lineCap: .round)) // окружность его цвет и толщина
                        .frame(width: 280, height: 300)
                        .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 15, x: -20, y: -20)
                        .shadow(color: .white, radius: 20, x: 20, y: 20)
                    

                       

                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke(Color(red: 74 / 255, green: 83 / 255, blue: 106 / 255), style: StrokeStyle(lineWidth: 39, lineCap: .round))
                        .frame(width: 280, height: 280)
                        .rotationEffect(.init(degrees: -90))
                                            
                    VStack(spacing: 10) {
                        
                        Text("\(self.count / 480)")
                            .font(.custom("HYWenHei", size: 55))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 74 / 255, green: 83 / 255, blue: 106 / 255))
                            .shadow(radius: 3)
                             
                        Button(action: {
                            self.showDetail.toggle()
                        }) {
                        Image("resin")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .shadow(color: (Color(red: 166 / 255, green: 200 / 255, blue: 240 / 255)), radius: 8)
                            
                            
                        }
                   
                    }
                }
                .padding()
                
                
                HStack {
                    
                    Button(action: {
                        self.start.toggle()
                        if self.count == 76800 {
                            
                            self.count = 0
                            withAnimation(.default) {

                                self.to = 0
                            }
                        }
                       
                        
                    }) {
                        
                        HStack {
                               Image(systemName: "circle")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(.yellow)
                                .frame(width: 25, height: 25)
                                .background(Color(red: 52 / 255, green: 60 / 255, blue: 64 / 255))
                                .clipShape(Circle())
                                .padding(.trailing,5)
                            
                            Text(self.start ? "Pause" : "Start")
                                .font(.custom("HYWenHei", size: 15))
                                .foregroundColor(Color(red: 231 / 255, green: 226 / 255, blue: 219 / 255))
                                .padding(.trailing)
                            }
                        .frame(width: 135, height: 40)
                        .background(RoundedRectangle(cornerRadius: 40))
                        .foregroundColor(Color(red: 74 / 255, green: 83 / 255, blue: 106 / 255))
                         .padding()
                         
                       
    
                    }
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: .white, radius: 20, x: -20, y: -20)
                    
                    Button(action: {
                        
                        self.count = 0
                        self.countDown = 480
                        self.countDownFull = 76800
                        
                        withAnimation(.default) {
                            
                            self.to = 0
                            
                        }
                        
                    }) {
                        
                        HStack {
                            Image(systemName: "arrow.clockwise")
                                .foregroundColor(.blue)
                                .font(.system(size: 15, weight: .bold))
                                .frame(width: 25, height: 25)
                                .background(Color(red: 52 / 255, green: 60 / 255, blue: 64 / 255))
                                .clipShape(Circle())
                               // .padding(.trailing)
                            
                            Text("Restart")
                                .font(.custom("HYWenHei", size: 15))
                                .foregroundColor(Color(red: 231 / 255, green: 226 / 255, blue: 219 / 255))
                               // .padding(.trailing)
                            }
                        .frame(width: 135, height: 40)
                        .background(RoundedRectangle(cornerRadius: 40))
                        .foregroundColor(Color(red: 74 / 255, green: 83 / 255, blue: 106 / 255))
                        .padding()
                    }
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                    .shadow(color: .white, radius: 20, x: -20, y: -20)
                }

                .padding()
                    
            
        }
        
        .onReceive(self.time) { (_) in
            
            if self.start == true {
                
                if self.count != 76800 {
                    
                    self.count += 1
            
                    }
                    
                    print("\(count)")
                    
                    withAnimation(.default)
                    {
                       
                        self.to = CGFloat(self.count) / 76800
                    
                    }
                }
                else {
                    
                    withAnimation(.default) {
      
                        self.to = 0
                        self.count = 0
                    }
                    
                   // self.start.toggle()
                    
                }
               
            }
        
            
        .onReceive(self.time) { (_) in
            
            if self.start {
            
                if self.countDownFull == 0 {
                    self.countDownFull = 76800
            }
            else {
                self.countDownFull -= 1
            }
                if self.countDown == 0 {
                self.countDown = 480
                } else {
                        self.countDown -= 1
                    }
                
            }
        }
        
            
            
            DetailView(showDetail: $showDetail, countDown: $countDown, countDownFull: $countDownFull)
                .offset(y: showDetail ? 300 : 600)
            
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
        }
        .onTapGesture {
            self.showDetail = false
        }
    }
}



struct DetailView: View {
    @Binding var showDetail: Bool
    @Binding var countDown: Int
    @Binding var countDownFull: Int
    func convertSecondToTime(timeInSeconds: Int) -> String {
        let hours = timeInSeconds / 3600
        let minutes = timeInSeconds / 60 % 60
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i:%02i",
                      hours,
                      minutes,
                      seconds)
    }

    
    
    var body: some View {
        
        VStack(spacing: 10) {
                            HStack {
                            Text("След. восстановление через:  ")             .foregroundColor(Color(red: 193 / 255, green: 184 / 255, blue: 155 / 255))
                            Text("\(convertSecondToTime(timeInSeconds: countDown))")
                                    .foregroundColor(.white)
                            }
                            .font(.custom("HYWenHei", size: 15))
                           
                            HStack {
                            Text("Полное восстановление через:")
                                .foregroundColor(Color(red: 193 / 255, green: 184 / 255, blue: 155 / 255))
                            Text("\(convertSecondToTime(timeInSeconds: countDownFull))")
                                    .foregroundColor(.white)
                            }
                            .font(.custom("HYWenHei", size: 15))
                        
            /* HStack {
                       Image(systemName: "xmark")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.yellow)
                        .frame(width: 25, height: 25)
                        .background(Color(red: 52 / 255, green: 60 / 255, blue: 64 / 255))
                        .clipShape(Circle())
                        .padding(.trailing,5)
                    
                    Text("Close")
                        .font(.custom("HYWenHei", size: 15))
                        .foregroundColor(Color(red: 231 / 255, green: 226 / 255, blue: 219 / 255))
                        .padding(.trailing)
                    }
                .frame(width: 135, height: 40)
                .background(RoundedRectangle(cornerRadius: 40))
                .foregroundColor(Color(red: 74 / 255, green: 83 / 255, blue: 106 / 255))
                .onTapGesture {
                    self.showDetail = false
                }
             */
                        }
                .padding()
                .frame(width: 380, height: 175)
                .background(Color.black.opacity(0.75))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .onTapGesture {
                    self.showDetail = false
                }
        
                
            
            
            
            
                    
                
            
        
    }
}

// .trailing отступ справа
