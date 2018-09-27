
Tablero mesa;

void setup() {
  size(700, 500);
  mesa=new Tablero();
  print("PING PONG ");
}

void draw() {
  mesa.dibujar();
  if (keyPressed == true) {
    mover();
  }
}


void mover() {  
  if (key == ' ')
    // JUGADOR 1
    mesa.Pausar();
    
  if (key == 'i' || key=='I')
    // Iniciar una partida
    mesa.IniciarJuego();  
    
  if (key == 'R' || key=='r')
    // Reiniciar cuando ha terminado un juego
    mesa.Reiniciar(); 
    
  if (key == 'w' || key=='W')
    // JUGADOR 1
    mesa.podIzq.subir();
  else if (key == 's' || key=='S')
    // JUGADOR 1
    mesa.podIzq.bajar();

  if (key == CODED) {   
    // JUGADOR 2
    if (keyCode == UP) {
      mesa.podDer.subir();
    } else if (keyCode == DOWN) {
      mesa.podDer.bajar();
    } 
  }
}
