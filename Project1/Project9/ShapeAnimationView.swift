import SwiftUI

struct ShapeAnimationView: View {
    @State private var isTriangle = true

    var body: some View {
        VStack {
            Button("Toggle Shape") {
                withAnimation {
                    self.isTriangle.toggle()
                    
                }
            }

            if isTriangle {
                TriangleView()
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            } else {
                StarView()
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
            }
        }
    }
}

struct TriangleView: View {
    var body: some View {
        Polygon(sides: 3)
            .fill(Color.green)
            .frame(width: 100, height: 100)
    }
}

struct StarView: View {
    var body: some View {
        Polygon(sides: 5, rotation: .degrees(36))
            .fill(Color.orange)
            .frame(width: 100, height: 100)
    }
}

struct Polygon: Shape {
    var sides: Int
    var rotation: Angle = .zero

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2

        for side in 0..<sides {
            let angle = rotation + .degrees(Double(side) / Double(sides) * 360)
            let point = CGPoint(
                x: center.x + radius * CGFloat(cos(angle.radians)),
                y: center.y + radius * CGFloat(sin(angle.radians))
            )

            if side == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        path.closeSubpath()

        return path
    }
}

struct ShapeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeAnimationView()
    }
}
