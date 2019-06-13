#include <stdio.h>
#include <stdlib.h>

// Size of vectors.
#ifndef N
#define N 1048576
#endif
// Entrada e saída.
float h_a[N];
float h_b[N];
float h_c[N];

void init_array() {
  fprintf(stdout, "Inicializando os arrays.\n");
  int i;
  // Initialize vectors on host.
	for (i = 0; i < N; i++) {
	  h_a[i] = 0.5;
	  h_b[i] = 0.5;
	}
}

void print_array() {
  int i;
  for (i = 0; i < N; i++) {
	fprintf(stdout, "h_c[%07d]: %f\n", i, h_c[i]);
  }
}

void check_result(){
  // Soma dos elementos do array C e divide por N, o valor deve ser igual a 1.
  int i;
  float sum = 0;
  fprintf(stdout, "Verificando o resultado.\n");  
  
  for (i = 0; i < N; i++) {
	  sum += h_c[i];
	}
	
	fprintf(stdout, "Resultado Final: (%f, %f)\n", sum, (float)(sum / (float)N));
}

int main(int argc, char **argv) {
  int i;
  /* Inicialização  dos vetores. */
  init_array();
  
  /* Calculo. */
  for (i = 0; i < N; i++) {
    h_c[i] = h_a[i] + h_b[i];
  }
  
  /* Resultados. */
  print_array();
  check_result();
  
  return 0;
}
