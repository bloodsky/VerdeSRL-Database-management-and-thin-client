#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_init_screen() { // 0

	system("@cls||clear");
	printf("\n");
	printf("                                             VerdeSRL \n");
	printf("|****************************************************|\n");
	printf("| 1) Login                                           |\n");
	printf("| 2) Esci                                            |\n");
	printf("******************************************************\n");
	printf("\n");
	printf("> ");
}


void print_S_screen() { // 1

	system("@cls||clear");
	printf("\n");
	printf("                                             VerdeSRL \n");
	printf("|****************************************************|\n");
	printf("| 1) Lista clienti privati                           |\n");
	printf("| 2) Lista clienti rivenditori                       |\n");
	printf("| 3) Contatti ed indirizzi recenti                   |\n");
	printf("| 4) Modifica indirizzo spedizione                   |\n");
	printf("| 5) Logout                                          |\n");
	printf("******************************************************\n");
	printf("\n");
	printf("> ");
}

void print_O_screen() { // 2

	system("@cls||clear");
	printf("\n");
	printf("                                             VerdeSRL \n");
	printf("|****************************************************|\n");
	printf("| 1) Lista Piante                                    |\n");
	printf("| 2) Controlla lo stato di un pacco (per un cliente) |\n");
	printf("| 3) Aggiungi pianta in un pacco    (per un cliente) |\n");
	printf("| 4) Logout                                          |\n");
	printf("******************************************************\n");	
	printf("\n");
	printf("> ");
}

void print_C_screen() { // 3

	system("@cls||clear");
	printf("\n");
	printf("                                             VerdeSRL \n");
	printf("|****************************************************|\n");
	printf("| 1) Listino                                         |\n");
	printf("| 2) Lista Fornitori                                 |\n");
	printf("| 3) Aggiorna il prezzo di una pianta                |\n");
	printf("| 4) Fluttuazioni prezzi piante (con data)           |\n");
	printf("| 5) Logout                                          |\n");
	printf("******************************************************\n");
	printf("\n");
	printf("> ");
}



int get_choice(int num_screen_choice) {
	
	char *p, s[100];
    int c;

    if (num_screen_choice == 2) {

	    while (fgets(s, sizeof(s), stdin)) {
	        c = strtol(s, &p, 10);
	        if ((p == s || *p != '\n') || (c != 1 && c != 2)) {

	        	if (strcmp(p,"\n") == 0 && strcmp(s,"\n") == 0) {
	        	} else {
	        		printf("L'input non corrisponde a nessuna delle scelte indicate, riprova: \n");
	            	printf("> ");
	        	}
	        } else break;
	    }
	} else if (num_screen_choice == 4) {

		while (fgets(s, sizeof(s), stdin)) {

	        c = strtol(s, &p, 10);
	        if ((p == s || *p != '\n') || (c != 1 && c != 2 && c != 3 && c != 4)) {
	        	if (strcmp(p,"\n") == 0 && strcmp(s,"\n") == 0) {
	        	} else {
	        		printf("L'input non corrisponde a nessuna delle scelte indicate, riprova: \n");
	            	printf("> ");
	        	}
	        } else break;
	    }
	} else if (num_screen_choice == 5) {
		
		while (fgets(s, sizeof(s), stdin)) {	        
	        c = strtol(s, &p, 10);

	        if ((p == s || *p != '\n') || (c != 1 && c != 2 && c != 3 && c != 4 && c != 5)) {	            
	 
	        	if (strcmp(p,"\n") == 0 && strcmp(s,"\n") == 0) {
	        	} else {
	        		printf("L'input non corrisponde a nessuna delle scelte indicate, riprova: \n");
	            	printf("> ");
	        	}
	        } else break;
	    }
	} else if (num_screen_choice == 1) {
		while (fgets(s, sizeof(s), stdin)) {	        
	        c = strtol(s, &p, 10);
	        if ((p == s || *p != '\n')) {	            
	 			printf("Parsing Error!\n");
	        } else break;
	    }
	}
	return c;
}