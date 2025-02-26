import SwiftUI

struct TrafficLight: View {
    private let trafficLights = ["red", "orange", "green"]
    @State private var lightIndex = 0
    
    private var currentLight: String {
        trafficLights[lightIndex]
    }
    
    private var actionMessage: String {
        switch currentLight {
        case "red":
            return "STOP"
        case "orange":
            return "SLOW DOWN"
        case "green":
            return "GO"
        default:
            return ""
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Button("Next light") {
                nextLight()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Text("Light is: \(currentLight)")
                .font(.headline)
            
            Text("You must \(actionMessage)")
                .font(.title)
                .foregroundColor(colorForLight(currentLight))
        }
        .padding()
    }
    
    private func nextLight() {
        lightIndex = (lightIndex + 1) % trafficLights.count
    }
    
    private func colorForLight(_ light: String) -> Color {
        switch light {
        case "red":
            return .red
        case "orange":
            return .orange
        case "green":
            return .green
        default:
            return .black
        }
    }
}
