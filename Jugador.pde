class Jugador{
  String nombre;
  int puntos;
  int juegosJugados;
  int juegosGanados;
  String ip;
  
  public Jugador(){
    this("local");
  }
  
  public Jugador(String nombre){
    this.nombre=nombre;
    puntos=0;
    juegosJugados=0;
    juegosGanados=0;
    ip="127.0.0.1";
  } 
  
}
