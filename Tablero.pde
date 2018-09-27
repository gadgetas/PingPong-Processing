class Tablero
{
  int alto, ancho;
  int x, y;
  color colorFondo, colorContorno;
  int anchoContorno;
  Pelota pelotita;
  Pod podIzq, podDer;
  Marcador marcaPuntos;
  private boolean finJuego;

  public Tablero() {
    this(65, 50, 500, 300);
  }

  public Tablero(int x, int y, int ancho, int alto) {
    this.x=x;
    this.y=y;
    this.alto=alto;
    this.ancho=ancho;
    colorFondo=color(#55AA0C);
    colorContorno=color(#0B13D6);
    anchoContorno=4;
    pelotita=new Pelota(x+ancho/2, y+alto/2);
    podIzq = new Pod(x+anchoContorno+2, y+anchoContorno, alto/4, 10);
    podIzq.limSup=y+anchoContorno;
    podIzq.limInf=y+alto-anchoContorno;
    podDer = new Pod(x+ancho-(anchoContorno*4), y+anchoContorno, alto/4, 10);
    podDer.limSup=y+anchoContorno;
    podDer.limInf=y+alto-anchoContorno;
    marcaPuntos = new Marcador();
    pelotita.detener=true;
  }

  private void saque() {
    pelotita.x=x+ancho/2;
    pelotita.y=y+alto/2;
    if (pelotita.velX<0)
      pelotita.velX--;
    else
      pelotita.velX++;  
    if (pelotita.velY<0)
      pelotita.velY--;
    else
      pelotita.velY++;
  }

  public void Pausar() {
    // pelotita.detener=!pelotita.detener;
  }

  public void IniciarJuego() {
    // Detenemos la pelota
    pelotita.detener=false;
  }

  public void FinJuego() {
    // Detenemos la pelota
    pelotita.detener=true;
    marcaPuntos.mostrarGanador=true;
    finJuego=true;
  }

  public void Reiniciar() {
    if (finJuego) {
      marcaPuntos.mostrarGanador=false;
      pelotita.velAzar();
      marcaPuntos.visitante.puntos=0;
      marcaPuntos.local.puntos=0;
      pelotita.detener=false;
      finJuego=false;
    }
  }

  public void dibujar()
  {
    dibujarTablero(); 
    checarRebote();
    checarPods();
    checarPuntos();
    pelotita.dibujar();
    podIzq.dibujar();
    podDer.dibujar();
    marcaPuntos.dibujar();
  }

  private void dibujarTablero() {
    fill(colorFondo);
    stroke(colorContorno); // Define el contorno del rectangulo
    strokeWeight(anchoContorno); // Ancho del contorno
    rect(x, y, ancho, alto);
    strokeWeight(anchoContorno/2); // MitAncho del contorno 
    line(x+ancho/2, y, x+ancho/2, y+alto);
    if (finJuego) {
      // Si es el fin del juego dibujamos FIN
    }
  }

  private void checarRebote() {
    if (pelotita.y+pelotita.radio >= this.y+alto 
      || pelotita.y-(pelotita.radio) <= this.y) {
      //println(pelotita.y);
      pelotita.velY*=(-1);
    }
  }

  private void checarPuntos() {
    // PUNTO LOCAL
    if (pelotita.x+pelotita.radio >= this.x+ancho) {
      //println(pelotita.x);
      pelotita.velX*=(-1);
      marcaPuntos.local.puntos++;
      saque();
      return;
    }

    // PUNTO VISITANTE
    if (pelotita.x-pelotita.radio <= this.x) {
      //println(pelotita.x);
      pelotita.velX*=(-1);
      marcaPuntos.visitante.puntos++;
      saque();
    }

    // Finaliza el juego si alguien llega a tres puntos
    if (marcaPuntos.local.puntos==5) {
      marcaPuntos.local.juegosJugados++; 
      marcaPuntos.local.juegosGanados++;      
      marcaPuntos.visitante.juegosJugados++;
      FinJuego();
    } else if (marcaPuntos.visitante.puntos==5) {
      marcaPuntos.local.juegosJugados++; 
      marcaPuntos.visitante.juegosGanados++;      
      marcaPuntos.visitante.juegosJugados++;
      FinJuego();
    }
  }

  private void checarPods() {
    // LADO IZQUIERDO
    if (pelotita.velX < 0 && (pelotita.x-pelotita.radio)<(podIzq.x+podIzq.ancho))
    {
      if ( ((pelotita.y+pelotita.radio)>podIzq.y && (pelotita.y+pelotita.radio)<(podIzq.y+podIzq.alto))
        || ((pelotita.y-pelotita.radio) < (podIzq.y+podIzq.alto) && (pelotita.y-pelotita.radio)>podIzq.y))
      {
        println("Golpe pod Izq en y:", pelotita.y);
        pelotita.velX*=(-1);
      }
    }
    // LADO DERECHO
    if (pelotita.velX > 0 && (pelotita.x+pelotita.radio)>podDer.x)
    {
      if ( ((pelotita.y+pelotita.radio)>podDer.y && (pelotita.y+pelotita.radio)<(podDer.y+podDer.alto))
        || ((pelotita.y-pelotita.radio) < (podDer.y+podDer.alto) && (pelotita.y-pelotita.radio)>podDer.y))
      {
        println("Golpe pod Der en y:", pelotita.y);
        pelotita.velX*=(-1);
      }
    }
  }
}
