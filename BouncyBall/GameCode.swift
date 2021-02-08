import Foundation

let ball = OvalShape(width: 40, height: 40)

var barriers: [Shape] = []
var targets: [Shape] = []

let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)

/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

fileprivate func setupBall() {
    ball.position = Point(x: 250, y: 400)
    ball.fillColor = .blue
    ball.hasPhysics = true
    ball.isDraggable = false
    ball.bounciness = 0.6
    scene.add(ball)

    ball.onCollision = ballCollided(with:)
    ball.onTapped = resetGame
    
    scene.trackShape(ball)
    ball.onExitedScene = ballExitScene

}

fileprivate func addBarrier(at position: Point, width: Double, height: Double, angle: Double) {
    
    let barrierPoints = [
        Point(x: 0, y: 0),
        Point(x: 0, y: height),
        Point(x: width, y: height),
        Point(x: width, y: 0)
    ]
    
    let barrier = PolygonShape(points: barrierPoints)
    barriers.append(barrier)
    
    // Adiciona uma barreira à cena
    barrier.position = position
    barrier.fillColor = .brown
    barrier.hasPhysics = true
    barrier.isImmobile = true
    barrier.angle = angle
    scene.add(barrier)
}

fileprivate func setupFunnel() {
    // Adicionar um funil à cena
    funnel.position = Point(x: 200, y: scene.height - 25)
    funnel.fillColor = .gray
    funnel.isDraggable = false
    scene.add(funnel)
    
    // Associa a função de callback ao evento do usuário
    funnel.onTapped = dropBall
}

fileprivate func addTarget(at position: Point) {
    
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]
    
    let target = PolygonShape(points: targetPoints)
    targets.append(target)
    
    
    target.position = position
    target.fillColor = .yellow
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
//    target.isDraggable = false
    target.name = "target"
    scene.add(target)
}

func setup() {
    setupBall()
    
    addBarrier(at: Point(x: 200, y: 150), width: 80, height: 25, angle: 0.1)
    addBarrier(at: Point(x: 100, y: 150), width: 30, height: 15, angle: 0.2)
    addBarrier(at: Point(x: 300, y: 150), width: 100, height: 25, angle: 0.3)

    
    setupFunnel()
    
    addTarget(at: Point(x: 133, y: 614))
    addTarget(at: Point(x: 111, y: 474))
    addTarget(at: Point(x: 256, y: 280))
    addTarget(at: Point(x: 151, y: 242))
    addTarget(at: Point(x: 165, y: 40))
    
    scene.onShapeMoved = printPosition(of:)
    
    resetGame()
}

// Reinicia o jogo removendo a bola abaixo da cena, o que desbloqueará as barreiras
func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

func printPosition(of shape: Shape) {
    print(shape.position)
}

// Funções de callbacks

// Liberar a bola movendo-a para a mesma posição do funil
func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    
    for barrier in barriers {
        barrier.isDraggable = false
    }
    
    for target in targets {
        target.fillColor = .yellow
    }
}

// Processar colisões entre a bola e os alvos
func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    
    otherShape.fillColor = .green
}

func ballExitScene() {
    var hitTargets = 0
    
    for target in targets {
        if target.fillColor == .green {
            hitTargets += 1
        }
    }
    if hitTargets == targets.count {
        print("Vitória!")
        scene.presentAlert(text: "Você ganhou!", completion: alertDismissed)
    }
    
    for barrier in barriers {
        barrier.isDraggable = true
    }
}

func alertDismissed() {
    
}
