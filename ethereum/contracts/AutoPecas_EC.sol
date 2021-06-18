pragma solidity ^0.4.17;

contract DeployContracts {

    uint128 n_utilizadores;
    uint128 n_carros;
    uint128 n_pecas;

    //address[] public deployed_USERS_BC;
    address[] public deployed_CARS_BC;
    //address[] public deployed_PARTS_BC;
    address[] public deployed_PARTS_BC;

    function create_New_Car(address) public {
        address new_CAR = new CARS_BC();
        deployed_CARS_BC.push(new_CAR);
        n_carros++;
    }

    function getdeployed_CARS_BC() public view returns (address[]) {
        return deployed_CARS_BC;
    }

    address public admin;
    address[] public users_list;
    mapping(address => bool) public users;

    modifier restricted_admin() {
        require(msg.sender == admin);
        _;
    }

/*
    address[] public users_list;
    mapping(address => bool) public users;

    modifier restricted_admin() {
        require(msg.sender == admin);
        _;
    }

    modifier restricted_IMT() {
        require("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4" == IMT_address);
        _;
    }
*/

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

/*
    function Lista_users() public{
        require(users[msg.sender]);
        users_list.push(msg.sender);

    }
*/
    //users[msg.sender] = true;

}

contract CARS_BC {

    address public IMT_address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    modifier restricted_IMT_address() {
        require(msg.sender == IMT_address);
        _;
    }

    address public Owern_address = msg.sender;
    modifier restricted_Owern_address() {
        require(msg.sender == Owern_address);
        _;
    }

    // Contituição do bloco com informação de carro intruduzido
    struct Car_Properties {
        string marca;
        string modelo;
        string motor;
        string matricula;
        string ano;
        uint32 kilometragem;
        uint32 valor;
        bool acidentado;
        address owner_address;
    }


    // Array com a lista de todos os carros na bloco
    Car_Properties[] public car_list;
    Car_Properties[] public Carros_Validados;

    struct Parts_Properties {
        mapping(address => bool) approvals;

    }

    function Adicionar_Carro(
    string add_marca,
    string add_modelo,
    string add_motor,
    string add_matricula,
    string add_ano,
    uint32 add_kilometragem,
    uint32 add_valor,
    bool add_acidentado) public {

        Car_Properties memory new_Car_Properties = Car_Properties({
        marca: add_marca,
        modelo: add_modelo,
        motor: add_motor,
        matricula: add_matricula,
        ano: add_ano,
        kilometragem: add_kilometragem,
        valor: add_valor,
        acidentado: add_acidentado,
        owner_address: Owern_address
        });

    // adicionar novo carro na lista
    car_list.push(new_Car_Properties);
    }

    function Validadar_Carro_IMT(uint64 ind, bool validadar_IMT) public restricted_IMT_address {
        if (validadar_IMT == true) {
            Carros_Validados.push(car_list[ind]);
        }
    }
}

contract PARTS_BC {

    uint64 etherium = 2000; //Etherium price por €€

    address public MARCA_address = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    modifier restricted_MARCA_address() {
        require(msg.sender == MARCA_address);
        _;
    }

    address public Owern_address = msg.sender;
    modifier restricted_Owern_address() {
        require(msg.sender == Owern_address);
        _;
    }

    // Contituição do bloco com informação de carro intruduzido
    struct Parts_Properties {
        string marca;
        string n_serie;
        string ano;
        bool original;
        string estado;
        uint64 preco;
        address car_adress;
        address owner_address;
    }

    // Array com a lista de todos os carros na bloco
    Parts_Properties[] public parts_list;
    Parts_Properties[] public Pecas_Validados;

    function Adicionar_Peca(
    string add_marca,
    string add_n_serie,
    string add_ano,
    bool add_original,
    string add_estado,
    uint64 add_preco,
    address add_car_adress) public {

        Parts_Properties memory new_Parts_Properties = Parts_Properties({
            marca: add_marca,
            n_serie: add_n_serie,
            ano: add_ano,
            original: add_original,
            estado: add_estado,
            preco: add_preco/etherium,
            car_adress: add_car_adress,
            owner_address: Owern_address
        });

    // adicionar novo carro na lista
    parts_list.push(new_Parts_Properties);
    }

    function Validadar_Peca_Marca(uint64 ind, bool validadar_Marca) public restricted_MARCA_address{
        if (validadar_Marca == true) {
            Pecas_Validados.push(parts_list[ind]);
        }
    }
}

contract BUY_BC {
    /*
        function Comprar_Peca() payable public{
        /*require(msg.value = new_car.preco);
        comprador.push(msg.sender);*/
    //}



     function Comprar_Peca(address peca, uint preco) public {

        address buyer = msg.sender;
        // comprador;
        //preco = price;

    }
/*
    function contribute() public payable {
        require(msg.value > minimumContribution);

        approvers[msg.sender] = true;
        approversCount++;
    }
*/
}
