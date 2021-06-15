pragma solidity ^0.4.17;

contract DeployContracts {

    uint128 n_carros;
    uint128 n_utilizadores;
    uint128 n_pecas;

    //address[] public deployed_USERS_BC;
    address[] public deployed_CARS_BC;
    //address[] public deployed_PARTS_BC;
    address[] public deployed_CARS_BC;

    function create_New_Car(address) public {
        address new_CAR = new CARS_BC();
        deployed_CARS_BC.push(new_CAR);
        n_carros++;
    }

    function getdeployed_CARS_BC() public view returns (address[]) {
        return deployed_CARS_BC;
    }
}

contract CARS_BC {
    
    address public admin;
    address public IMT_address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address[] public users_list;
    mapping(address => bool) public users;
    
    modifier restricted_admin() {
        require(msg.sender == admin);
        _;
    }
    /*
    function Lista_users(uint index) public {
        Lista storage lista = requests[index];

        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);

        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }
    
    function Lista_users(address user) public{
        require(users[msg.sender]);
        users_list.push(msg.sender);
        n_utilizadores++;
    }
*/
    // Contituição do bloco com informação de carro intruduzido
    struct Car_Properties {
        string marca;
        string modelo;
        string motor;
        string n_serie;
        string ano;
        uint32 kilometragem;
        int32 valor;
        bool acidentado;
        address owner_address;
    }
    

    // Array com a lista de todos os carros na bloco
    Car_Properties[] public car_list;
    
    struct Parts_Properties {
        mapping(address => bool) approvals;

    }
    
    /*
    address[] public users_list;
    mapping(address => bool) public users;
    
    modifier restricted_admin() {
        require(msg.sender == admin);
        _;
    }
    */
    /*
    modifier restricted_IMT() {
        require("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4" == IMT_address);
        _;
    }
    */

    function Adicionar_Carro(        
    string add_marca,
    string add_modelo,
    string add_motor,
    string add_n_serie,
    string add_ano,
    uint32 add_kilometragem,
    int32 add_valor,
    bool add_acidentado) public {
        
        Car_Properties memory new_Car_Properties = Car_Properties({
        marca: add_marca,
        modelo: add_modelo,
        motor: add_motor,
        n_serie: add_n_serie,
        ano: add_ano,
        kilometragem: add_kilometragem,
        valor: add_valor,
        acidentado: add_acidentado,
        owner_address: msg.sender
        });
    
    // adicionar novo carro na lista
    car_list.push(new_Car_Properties);
    //users[msg.sender] = true;
    n_carros++;
    }
    
    /*
    function Lista_users() public{
        require(users[msg.sender]);
        users_list.push(msg.sender);
        
    }
    */
    
    function Validadar_Carro_IMT() public{
        
    }
    
    function Comprar_Carro() payable public{
        /*require(msg.value = new_car.preco);
        comprador.push(msg.sender);*/
    }
}
