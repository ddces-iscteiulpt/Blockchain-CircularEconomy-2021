pragma solidity ^0.4.17;

contract DeployContracts {

    uint128 n_users;
    uint128 n_cars;
    uint128 n_parts;

    //address[] public deployed_USERS_BC;
    address[] public deployed_CARS_BC;
    //address[] public deployed_PARTS_BC;
    address[] public deployed_PARTS_BC;

    function create_New_Car(address) public {
        address new_CAR = new CARS_BC();
        deployed_CARS_BC.push(new_CAR);
        n_cars++;
    }

    function getdeployed_CARS_BC() public view returns (address[]) {
        return deployed_CARS_BC;
    }

    function create_New_Part(address) public {
        address new_Part = new PARTS_BC();
        deployed_PARTS_BC.push(new_Part);
        n_parts++;
    }

    function getdeployed_PART_BC() public view returns (address[]) {
        return deployed_PARTS_BC;
    }

    address public Owern;
    address[] public users_list;
    mapping(address => bool) public users;

    modifier restricted_Owern() {
        require(msg.sender == Owern);
        _;
    }

    /*
    function Comprar_Peca(address peca, uint preco) public payable {

        require(msg.value == );

        address buyer = msg.sender;
        // comprador;
        //preco = price;
    }
    */
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
        string brand;
        string model;
        string engine;
        string plate;
        string year;
        uint32 kilometrage;
        uint32 value;
        bool accident;
        address owner_address;
    }


    // Array com a lista de todos os carros na bloco
    Car_Properties[] public car_list;
    Car_Properties[] public Validated_Cars;

    struct Parts_Properties {
        mapping(address => bool) approvals;

    }

    function Add_Car(
    string add_brand,
    string add_model,
    string add_engine,
    string add_plate,
    string add_year,
    uint32 add_kilometrage,
    uint32 add_value,
    bool add_accident) public {

        Car_Properties memory new_Car_Properties = Car_Properties({
        brand: add_brand,
        model: add_model,
        engine: add_engine,
        plate: add_plate,
        year: add_year,
        kilometrage: add_kilometrage,
        value: add_value,
        accident: add_accident,
        owner_address: Owern_address
        });

    // adicionar novo carro na lista
    car_list.push(new_Car_Properties);
    }

    function Validated_Cars_IMT(uint64 ind, bool validated_IMT) public restricted_IMT_address {
        if (validated_IMT == true) {
            Validated_Cars.push(car_list[ind]);
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
        string brand;
        string VIN;
        string year;
        bool original;
        string status;
        uint64 price;
        address car_adress;
        address owner_address;
    }

    // Array com a lista de todos os carros na bloco
    Parts_Properties[] public parts_list;
    Parts_Properties[] public Validated_Parts;

    function Add_Parts(
    string add_brand,
    string add_VIN,
    string add_year,
    bool add_original,
    string add_status,
    uint64 add_price,
    address add_car_adress) public {

        Parts_Properties memory new_Parts_Properties = Parts_Properties({
            brand: add_brand,
            VIN: add_VIN,
            year: add_year,
            original: add_original,
            status: add_status,
            price: add_price/etherium,
            car_adress: add_car_adress,
            owner_address: Owern_address
        });

    // adicionar novo carro na lista
    parts_list.push(new_Parts_Properties);
    }

    function Validated_Parts_Marca(uint64 ind, bool validated_Marca) public restricted_MARCA_address{
        if (validated_Marca == true) {
            Validated_Parts.push(parts_list[ind]);
        }
    }



}

contract BUY_BC {
    /*
        function Comprar_Peca() payable public{
        /*require(msg.value = new_car.preco);
        comprador.push(msg.sender);*/
    //}


    /*
     function Comprar_Peca(address peca, uint preco) public payable {

        require(msg.value == );

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
