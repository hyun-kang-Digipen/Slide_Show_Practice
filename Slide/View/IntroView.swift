//
//  IntroView.swift
//  Slide
//
//  Created by 강현 on 2022/11/21.
//

import SwiftUI
import SpriteKit

struct IntroView: View {
    
    @State var showWalkThroughScreens: Bool = false
    
    @State var currentIndex: Int = 0
    
    @ObservedObject var slideView: IntroViewModel
    
    var scene: SKScene { // scene 생성
        let scene = GameScene()
        scene.size = CGSize(width: 50, height: 50)
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {
        
        ZStack{
            
            Color(.orange)
                .ignoresSafeArea()
            
            IntroScreen()
            
            WalkThroughScreen()

            NavBar()
                       
            TimerView()

//            SpriteView(scene: scene, options: [.allowsTransparency])
//               .frame(width: 70, height: 70)

        }
        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
    }
    
    @ViewBuilder
    func WalkThroughScreen() -> some View {
        GeometryReader{
            let size = $0.size
  
            ZStack {
                ForEach(slideView.shapeArray.indices, id:\.self){ index in
                    ScreenView(size: size, index: index)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // MARK: next button
            .overlay(alignment: .bottom) {
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 55, height: 55)
                    .foregroundColor(.orange)
                    .background {
                        RoundedRectangle(cornerRadius: 30, style: .circular)
                            .fill(Color.black)
                    }
                    .onTapGesture {
                        currentIndex += 1
                    }
                    .offset(y: -30)
                    
            }
            .offset(y: showWalkThroughScreens ? 0 : size.height)
        }
        .padding(60)
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize, index: Int) -> some View {
        let intro = slideView.shapeArray[index]
        
        VStack(spacing: 10) {

            
            Text(intro.text)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: currentIndex)
            
            Text("fuck")
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 1.3, dampingFraction: 0.85, blendDuration: 0.85), value: currentIndex)
            
            Text("fuck")
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 1.5, dampingFraction: 0.85, blendDuration: 0.85), value: currentIndex)
            
            RoundedRectangle(cornerRadius: 20)
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height / 2)
                .foregroundColor(.black)
                .padding(.vertical, 50)
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: currentIndex)

        }
    }
    
    @ViewBuilder
    func NavBar() -> some View {
        HStack{
            Button {
                if currentIndex > 0 {
                    currentIndex -= 1
                } else {
                    showWalkThroughScreens.toggle()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
            }
            
            Spacer()
            
            Button("SKIP"){
                
            }
            .foregroundColor(Color.black)
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }
    
    @ViewBuilder
    func IntroScreen() -> some View {
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 20)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height / 2)
                    .foregroundColor(.black)
                    .padding(.vertical, 50)
                
                Text("MINSOO")
                    .font(.largeTitle.weight(.bold))
                
                Text("cute as fuck")
                    .padding(.horizontal)
                
                Text("go see minsoo")
                    .foregroundColor(.orange)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background{
                        Capsule()
                            .fill(Color.black)
                    }
                    .onTapGesture{
                        showWalkThroughScreens.toggle()
                    }
                    .padding(.top,30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            // MARK: moving Up When Clicked
            .offset(y:showWalkThroughScreens ? -size.height : 0)
        }
        .padding(60)
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        let game = IntroViewModel()
        IntroView(slideView: game)
    }
}
