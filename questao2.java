public class Main {
public static  void main(String[] args) {
for (int numero = 0; numero <100; numero ++){
    
 if (numero %3 == 0) {
System.out.print ( "Foo ");
}
if (numero % 5 == 0 ) {
System.out.print ( "Baa ");
}
  if ((numero % 3 == 0) && (numero %5 == 0)){
   System.out.print ( " FooBaa");
  }
}
}
}
