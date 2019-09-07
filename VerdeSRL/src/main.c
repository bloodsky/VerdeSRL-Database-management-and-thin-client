#include <mysql/mysql.h>
#include <unistd.h> 

#include "constants.h"
#include "function.c"

void set_init_flow(void);
void login(void);
void new_user(void);
void play_secuser(void);
void play_comuser(void);
void play_opuser(void);
void play_suser(void);
void identify_role(void);
void client_list(void);
int check_transaction(void);

static MYSQL *con = NULL;

#define query(Q) do { \
			if (mysql_query(con, Q)) { \
				finish_with_error(con, Q); \
			} \
		 } while(0)

static void finish_with_error(MYSQL *con, char *err)
{
	fprintf(stderr, "%s error: %s\n", err, mysql_error(con));
	mysql_close(con);
	exit(EXIT_FAILURE);        
}


void login() {
	
	char name[20];
	char *password;
	printf("Username:\n");
	printf("> ");
	scanf("%s",name);

    password = getpass("Password:\n");

	con = mysql_init(NULL);
	if (mysql_real_connect(con, "localhost", name, password, NULL, 3306, NULL, CLIENT_MULTI_RESULTS) == NULL) {
		fprintf(stderr, "%s\n", mysql_error(con));
		mysql_close(con);
		exit(EXIT_FAILURE);
	}
	
	query(USE);
	strcpy(password,"");
	name[0] = 0;
}

void new_user() {
	printf("creating new user..\n");
}

void p_client_list() {
	
	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(PRIVATE_CLIENT); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Lista clienti privati:\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("--------------------------------------------------------\n");
		printf("Nome: [%s]\n",row[1]);
		printf("Codice fiscale: [%s]\n",row[0]);
		printf("Mezzo preferito: [%s]\n",row[2]);
		printf("--------------------------------------------------------\n");
	}
	mysql_free_result(result);
}

void r_client_list() {
	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(STOCK_CLIENT); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Lista rivenditori:\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("--------------------------------------------------------\n");
		printf("Nome: [%s]\n",row[4]);
		printf("Partita Iva: [%s]\n",row[0]);
		printf("Mezzo preferito: [%s]\n",row[5]);
		printf("Il referente è: [%s %s]\n",row[1],row[2]);
		printf("Con mezzo preferito: [%s]\n",row[3]);
		printf("--------------------------------------------------------\n");
	}
	mysql_free_result(result);
}

void flower_list() {
	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(PLANTS_TABLE); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Lista piante:\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		

		char *end, *end1;
		long int g = strtol(row[1], &end, 10);  

		if (end == row[1] || *end != '\0') {
		    printf("Non posso convertire '%s' in un long, la stringa rimanente è: '%s'\n", row[1], end);
		}

		long int e = strtol(row[2], &end1, 10);  

		if (end1 == row[2] || *end1 != '\0')
		    printf("Non posso convertire '%s' in un long, l stringa rimanente è: '%s'\n", row[2], end1); 


		if (g == 1 && e == 1) {
			strcat(str,"Da giardino ed esotica");
		} else if (g == 1) {
			strcat(str,"Da giardino");
		} else if (e == 1) {
			strcat(str,"Esotica");
		}

		printf("Codice: [%s], [%s], Nome comune: [%s], Nome latino: [%s]\n",row[0], str, row[3], row[4]);
		strcpy(str,"");
	}
	mysql_free_result(result);

}

void cont_and_addr() {

	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(CONTACT_AND_CLIENT); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Contatti e indirizzi:\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("--------------------------------------------------------\n");
		printf("Nome: [%s]\n",row[1]);
		printf("Contatto: [%s]\n",row[0]);
		printf("Indirizzo di fatturazione: [%s]\n",row[3]);
		printf("Indirizzo di residenza: [%s]\n",row[4]);
		printf("Indirizzo di spedizione: [%s]\n",row[5]);
		printf("--------------------------------------------------------\n");
	}
	mysql_free_result(result);	
}

void modify_addr_transaction(int client, char addr[]) {
	
	MYSQL_RES *result;
	int status;

	char q[256] = {'\0'};
	sprintf(q,"CALL modify_addr(%d,\"%s\",@success);",client, addr);

	status = mysql_query(con,q);
	if (status) {
		printf("Could not execute statement(s)");
		finish_with_error(con,q);
	    mysql_close(con);
	    exit(0);
	}

	/* process each statement result */
	do {
	  /* did current statement return data? */
	  	result = mysql_store_result(con);
	  	if (result) {
		    /* yes; process rows and free the result set */
		    //process_result_set(con, result);
		    mysql_free_result(result);
	  	
	  	} else {
		    if (mysql_field_count(con) == 0) {
		      		//printf("%lld rows affected\n",mysql_affected_rows(con));
		    } else  {
		      		printf("Could not retrieve result set\n");
		      		break;
		    }
	  	}
	  /* more results? -1 = no, >0 = error, 0 = yes (keep looping) */
	  	if ((status = mysql_next_result(con)) > 0)
	    	printf("Could not execute statement\n");
	} while (status == 0);

}

void modify_addr() {

	int client;
	char new_addr[256];
	printf("Di quale cliente vuoi modificare l'indirizzo di spedizione?\n");
	client_list();
	client = get_choice(1);
	printf("Inserisci il nuovo indirizzo:\n");
	scanf("%s",new_addr);
	
	modify_addr_transaction(client,new_addr);

	if(check_transaction()) {
		printf("Indirizzo correttamente modificato!\n");
	} else {
		printf("Attenzione non è stato possibile modificare l'indirizzo!\n");
	}
}


void play_secuser() {
	
	int c = 0;
	while(c != 1) {
		switch (get_choice(5)) {
			case 1:
				p_client_list();
				break;
			case 2:
				r_client_list();
				break;
			case 3:
				cont_and_addr();
				break;
			case 4:
				modify_addr();
				break;
			case 5:
				mysql_close(con);
				con = NULL;
				set_init_flow();
				break;
		}
		if (c == 0) {
			printf("\n");
			printf("> ");
		}
	}
}

void flut_price_flower() {

	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(UPDATED_COSTS); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Fluttuazione dei prezzi:\n");
	printf("\n");

	while ((row = mysql_fetch_row(result)) != 0) {
		printf("Prima del [%s] il prezzo della pianta [%s] era: [%s] Euro\n", row[2], row[8],row[3]);
		printf("È stato aggiornato a [%s] Euro\n",row[4]);
		printf("\n");
	}
	mysql_free_result(result);

}

void business_list() {

	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(LIST_COSTS); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Listino dei prezzi:\n");
	printf("\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("Nome comune: %s, Nome latino: %s, Prezzo: %s Euro \n", row[1], row[2], row[0]);
	}
	mysql_free_result(result);

}


void client_list() {
	
	MYSQL_RES *result;
	MYSQL_ROW row;

	query(CLIENTS);
	result = mysql_store_result(con);
		
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Lista clienti:\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("Codice cliente: [%s], Nome: [%s]\n", row[0], row[1]);
	}
	mysql_free_result(result);

}

void cli_pkt(int client_code) {

	MYSQL_RES *result;
	MYSQL_ROW row;
	
	char q[256] = {'\0'};
    snprintf(q, sizeof(q), "%s%d", CLIENTS_PACKET, client_code);
	
	query(q);
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Pacchi del cliente:\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("Codice pacco: [%s]\n", row[0]);
	}
	mysql_free_result(result);	

}


void plants_in_pkt(int packet_code) {
	MYSQL_RES *result;
	MYSQL_ROW row;
	
	char q[256] = {'\0'};
    //sprintf(q,"SELECT CodPianta, NomeComune, NomeLatino, COUNT(*) AS Count from PianteContenute pc join Piante p on pc.CodPianta = p.CodicePianta where CodicePacco = %d GROUP BY CodPianta, NomeComune, NomeLatino ORDER BY count DESC", packet_code);
	sprintf(q,"select i.* from (select @p2:=%d x) parm , inside_piante i;",packet_code);
	query(q);
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Piante contenute nel pacco selezionato:\n");
	while ((row = mysql_fetch_row(result)) != 0) {

		char *end;
		long int g = strtol(row[3], &end, 10);  

		if (end == row[3] || *end != '\0') {
		    printf("Non posso convertire '%s' in un long, la stringa rimanente è: '%s'\n", row[3], end);
		}

		if (g == 1) {
			printf("Codice pianta: [%s], NomeComune: [%s], NomeLatino: [%s]\n", row[0], row[1], row[2]);
		} else {
			printf("Codice pianta: [%s], NomeComune: [%s], NomeLatino: [%s] (X %s)\n",row[0], row[1], row[2], row[3]);
		}
	}
	mysql_free_result(result);	

}

void plants_not_in_pkt(int packet_code) {
	
	MYSQL_RES *result;
	MYSQL_ROW row;
	
	char q[256] = {'\0'};
    //sprintf(q,"SELECT CodPianta, NomeComune, NomeLatino, COUNT(*) AS Count from PianteDaInserire pi join Piante p on pi.CodPianta = p.CodicePianta where CodicePacco = %d GROUP BY CodPianta, NomeComune, NomeLatino ORDER BY count DESC", packet_code);

	sprintf(q,"SELECT s.* FROM (SELECT @p1:=%d p) parm , insert_piante s;",packet_code);
	query(q);
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Possibili piante da aggiungere al pacco selezionato:\n");
	while ((row = mysql_fetch_row(result)) != 0) {

		char *end;
		long int g = strtol(row[3], &end, 10);  

		if (end == row[3] || *end != '\0') {
		    printf("Non posso convertire '%s' in un long, la stringa rimanente è: '%s'\n", row[3], end);
		}

		if (g == 1) {
			printf("Codice pianta: [%s], NomeComune: [%s], NomeLatino: [%s]\n", row[0], row[1], row[2]);
		} else {
			printf("Codice pianta: [%s], NomeComune: [%s], NomeLatino: [%s] (X %s)\n",row[0], row[1], row[2], row[3]);
		}
	}
	mysql_free_result(result);	

}

void packet_status() {
	int c, p;
	printf("Inserisci codice cliente su qui stai lavorando:\n");
	
	client_list();
	
	printf("\n");
	printf("> ");
	
	c = get_choice(1);
	
	printf("Su quale pacco del cliente stai lavorando?\n");
	
	cli_pkt(c);
	
	printf("\n");
	printf("> ");
	
	p = get_choice(1);

	plants_not_in_pkt(p);
	plants_in_pkt(p);

}


void move_plant_transaction(int cod_pkt, int cod_plant) {

	MYSQL_RES *result;
	int status;

	char q[256] = {'\0'};
	sprintf(q,"CALL move_plant(%d,%d,@success);",cod_pkt, cod_plant);

	status = mysql_query(con,q);
	if (status) {
		printf("Could not execute statement(s)");
		finish_with_error(con,q);
	    mysql_close(con);
	    exit(0);
	}

	/* process each statement result */
	do {
	  /* did current statement return data? */
	  	result = mysql_store_result(con);
	  	if (result) {
		    /* yes; process rows and free the result set */
		    //process_result_set(con, result);
		    mysql_free_result(result);
	  	
	  	} else {
		    if (mysql_field_count(con) == 0) {
		      		//printf("%lld rows affected\n",mysql_affected_rows(con));
		    } else  {
		      		printf("Could not retrieve result set\n");
		      		break;
		    }
	  	}
	  /* more results? -1 = no, >0 = error, 0 = yes (keep looping) */
	  	if ((status = mysql_next_result(con)) > 0)
	    	printf("Could not execute statement\n");
	} while (status == 0);
}

int check_transaction() {
	
	MYSQL_RES *result;
	MYSQL_ROW row;

	char *end;
	long int g;	
	
	query("SELECT @success");
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	while ((row = mysql_fetch_row(result)) != 0) {

		g = strtol(row[0], &end, 10);  

		if (end == row[0] || *end != '\0') {
		    printf("Non posso convertire '%s' in un long, la stringa rimanente è: '%s'\n", row[3], end);
		}
	}

	mysql_free_result(result);

	if (g == 1) {
		return 1;
	} else {
		return 0;
	}	

}

void add_plants() {
	
	int c, p, plant;
	printf("Inserisci codice cliente su qui stai lavorando:\n");
	
	client_list();
	
	printf("\n");
	printf("> ");
	
	c = get_choice(1);
	
	printf("Su quale pacco del cliente vuoi aggiungere una pianta?\n");
	
	cli_pkt(c);
	
	printf("\n");
	printf("> ");
	
	p = get_choice(1);

	printf("Scegli il codice della pianta da aggiungere:\n");
	plants_not_in_pkt(p);
	
	printf("\n");
	printf("> ");
	
	plant = get_choice(1);

	move_plant_transaction(p,plant);
	
	if(check_transaction()) {
		printf("Pianta correttamente trasferita!\n");
	} else {
		printf("Attenzione non è stato possibile trasferire la pianta!\n");
	}
}

void stock_list() {

	MYSQL_RES *result;
	MYSQL_ROW row;
	char str[64] = "";
	query(STOCK_PLANTS); 
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Fornitori piante:\n");
	printf("\n");
	while ((row = mysql_fetch_row(result)) != 0) {
		printf("Nome fornitore: %s, Indirizzo fornitore: %s, \n Fornisce: \n Nome comune: %s, Nome latino: %s \n", row[0], row[1], row[2], row[3]);
	}
	mysql_free_result(result);
}  



void info_plant(int plant) {

	MYSQL_RES *result;
	MYSQL_ROW row;
	
	char q[256] = {'\0'};
    //sprintf(q,"SELECT CodPianta, NomeComune, NomeLatino, COUNT(*) AS Count from PianteDaInserire pi join Piante p on pi.CodPianta = p.CodicePianta where CodicePacco = %d GROUP BY CodPianta, NomeComune, NomeLatino ORDER BY count DESC", packet_code);

	sprintf(q,"SELECT s.* FROM (SELECT @u1:=%d p) parm , update_price_plant s;",plant);
	query(q);
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	printf("\n");
	printf("Le informazioni riguardo la pianta selezionata sono:\n");
	printf("\n");

	while ((row = mysql_fetch_row(result)) != 0) {

		//if (strcmp(row[1],"-1")) {
		if (row[1] == NULL) {
			printf("La pianta [%s] con nome latino [%s] dal [%s]\n",row[3], row[4], row[0]);
			printf("Ha uno costo di [%s] Euro\n",row[2]);
		} else {
			printf("Dal [%s] al [%s] la pianta [%s] con nome latino [%s]\n", row[0], row[1], row[3], row[4]);
			printf("Ha avuto un costo di: [%s] Euro\n",row[2]);
		}

	}
	mysql_free_result(result);	

}

void update_price_transaction(double price, int plant) {

	MYSQL_RES *result;
	int status;

	char q[256] = {'\0'};
	sprintf(q,"CALL update_price(%lf,%d,@success);",price, plant);

	status = mysql_query(con,q);
	if (status) {
		printf("Could not execute statement(s)");
	    mysql_close(con);
	    exit(0);
	}

	/* process each statement result */
	do {
	  /* did current statement return data? */
	  	result = mysql_store_result(con);
	  	if (result) {
		    /* yes; process rows and free the result set */
		    //process_result_set(con, result);
		    mysql_free_result(result);
	  	
	  	} else {
		    if (mysql_field_count(con) == 0) {
		      		//printf("%lld rows affected\n",mysql_affected_rows(con));
		    } else  {
		      		printf("Could not retrieve result set\n");
		      		break;
		    }
	  	}
	  /* more results? -1 = no, >0 = error, 0 = yes (keep looping) */
	  	if ((status = mysql_next_result(con)) > 0)
	    	printf("Could not execute statement\n");
	} while (status == 0);
}

void update_plant_price() {

	int plant;

	printf("Su quale pianta stai lavorando?\n");
	flower_list();
	plant = get_choice(1);
	info_plant(plant);
	printf("Inserisci il nuovo prezzo della pianta:\n");
	
	double prezzo; 
    scanf("%lf", &prezzo);

    update_price_transaction(prezzo, plant); 
	if(check_transaction()) {
		printf("Prezzo correttamente aggiornato!\n");
	} else {
		printf("Attenzione non è stato possibile aggiornare il prezzo!\n");
	}
}

void play_comuser() {
	
	int c = 0;
	while(c != 1) {
		switch (get_choice(5)) {
			case 1:
				business_list();
				break;
			case 2:
				stock_list();
				break;
			case 3:
				update_plant_price();
				break;
			case 4:
				flut_price_flower();
				break;
			case 5:
				mysql_close(con);
				con = NULL;
				set_init_flow();
				c = 1;
				break;
		}
		
		if (c == 0) {
			printf("\n");
			printf("> ");
		}
	}
}


void play_opuser() {

	int c = 0;
	while(c != 1) {	
		switch (get_choice(4)) {
			case 1:
				flower_list();			
				break;
			case 2:
				packet_status();
				break;
			case 3:
				add_plants();
				break;
			case 4:
				mysql_close(con);
				con = NULL;
				c = 1;
				set_init_flow();
				break;
		}
		if (c == 0) {
			printf("\n");
			printf("> ");
		}
	}
}


void identify_role() {
	
	MYSQL_RES *result;
	MYSQL_ROW row;

	char role[128] = "";
	query(CURRENT_ROLE);
	
	result = mysql_store_result(con);
	
	if (result == NULL) {
		finish_with_error(con, "Select");
	}

	while ((row = mysql_fetch_row(result)) != 0) {
		strncat(role,row[0],128);
	}
	mysql_free_result(result);
	

	if (strcmp(role,SEGRETERIA) == 0) {
		print_S_screen();
		play_secuser();
	} else if (strcmp(role,COMMERCIALISTA) == 0) {
		print_C_screen();
		play_comuser();
	} else if (strcmp(role,OPERATORE) == 0) {
		print_O_screen();
		play_opuser();
	}

}

void set_init_flow() {

	print_init_screen();
	
	switch (get_choice(2)) {
		case 1:
			login();
			identify_role();
			break;
		case 2:
			printf("Arrivederci!\n");
			break;
	}
}


int main(int argc, char *argv[]) {
	
	if (argc != 1) {
		fprintf(stderr, "Lanciare il programma senza nessun parametro!\n");
		exit(EXIT_FAILURE);
	}

	strcat(USE, DB_NAME);
	USE[127] = '\0';

	set_init_flow();   

	exit(EXIT_SUCCESS);
}