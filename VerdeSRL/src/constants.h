#define SIMPLEUSER           "simpleuser"
#define OPERATORE  	         "operatore"
#define COMMERCIALISTA       "commercialista"
#define SEGRETERIA           "segreteria"
#define INIT_WIN              0
#define SEGRETARIA_WIN        1
#define OPERATORE_WIN         2
#define COMMERCIALISTA_WIN    3
#define USER_WIN              4
#define DB_NAME               "VerdeSRL" 
#define CURRENT_ROLE          "SELECT CURRENT_ROLE()"
#define PLANTS_TABLE          "SELECT * FROM Piante"
#define UPDATED_COSTS         "SELECT * FROM Listino_Update l JOIN Piante p ON l.product_id = p.CodicePianta"
#define LIST_COSTS            "SELECT * FROM listino_prezzi"
#define STOCK_PLANTS          "SELECT * FROM fornitori_piante"
#define CLIENTS               "SELECT * FROM Clienti"
#define CLIENTS_PACKET        "SELECT CodicePacco FROM Pacchi WHERE CodiceCliente ="
#define PRIVATE_CLIENT        "SELECT * FROM private_client"
#define STOCK_CLIENT          "SELECT * FROM stock_client"
#define CONTACT_AND_CLIENT    "SELECT * FROM contact_and_address"

char USE[128] = "USE ";

