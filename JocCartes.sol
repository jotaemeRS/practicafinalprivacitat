// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Joc is ERC1155 {
    //NUMERO MAXIM DE CARTES QUE HI HA A LA COLECCIO
    uint256 MAX_ID_CARTES = 45;
    // Adreça fixa del game master
    address public constant GAME_MASTER_ADDRESS = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
    //Estructura de les cartes: el nom, la vida que tenen, l'element al qual pertanyen i la raresa.

    struct CardAttributes {
        string name;
        uint256 life;
        string element;
        uint256 power;
        string rarity;
    }
    //MAPPINGS
    // ID ---------> Atributs cartes
    mapping(uint256 => CardAttributes) private _cardAttributes;
    // Quantitat de cartes que posseeix una adreça
    mapping(address => mapping(uint256 => uint256)) private _balancePerCarta;

    // Identificadors de cartes predefinides

    // Identificadores de cartes predefinides per a "fuego"
    uint256 constant CARTA_FUEGO_1 = 1;
    uint256 constant CARTA_FUEGO_2 = 2;
    uint256 constant CARTA_FUEGO_3 = 3;
    uint256 constant CARTA_FUEGO_4 = 4;
    uint256 constant CARTA_FUEGO_5 = 5;
    uint256 constant CARTA_FUEGO_6 = 6;
    uint256 constant CARTA_FUEGO_7 = 7;
    uint256 constant CARTA_FUEGO_8 = 8;
    uint256 constant CARTA_FUEGO_9 = 9;
    uint256 constant CARTA_FUEGO_10 = 10;
    uint256 constant CARTA_FUEGO_11 = 11;
    uint256 constant CARTA_FUEGO_12 = 12;
    uint256 constant CARTA_FUEGO_13 = 13;
    uint256 constant CARTA_FUEGO_14 = 14;
    uint256 constant CARTA_FUEGO_15 = 15;

    // Identificadors de cartes predefinides per a "agua"
    uint256 constant CARTA_AGUA_1 = 16;
    uint256 constant CARTA_AGUA_2 = 17;
    uint256 constant CARTA_AGUA_3 = 18;
    uint256 constant CARTA_AGUA_4 = 19;
    uint256 constant CARTA_AGUA_5 = 20;
    uint256 constant CARTA_AGUA_6 = 21;
    uint256 constant CARTA_AGUA_7 = 22;
    uint256 constant CARTA_AGUA_8 = 23;
    uint256 constant CARTA_AGUA_9 = 24;
    uint256 constant CARTA_AGUA_10 = 25;
    uint256 constant CARTA_AGUA_11 = 26;
    uint256 constant CARTA_AGUA_12 = 27;
    uint256 constant CARTA_AGUA_13 = 28;
    uint256 constant CARTA_AGUA_14 = 29;
    uint256 constant CARTA_AGUA_15 = 30;

    // Identificadors de cartes predefinides per a "bosque"
    uint256 constant CARTA_BOSQUE_1 = 31;
    uint256 constant CARTA_BOSQUE_2 = 32;
    uint256 constant CARTA_BOSQUE_3 = 33;
    uint256 constant CARTA_BOSQUE_4 = 34;
    uint256 constant CARTA_BOSQUE_5 = 35;
    uint256 constant CARTA_BOSQUE_6 = 36;
    uint256 constant CARTA_BOSQUE_7 = 37;
    uint256 constant CARTA_BOSQUE_8 = 38;
    uint256 constant CARTA_BOSQUE_9 = 39;
    uint256 constant CARTA_BOSQUE_10 = 40;
    uint256 constant CARTA_BOSQUE_11 = 41;
    uint256 constant CARTA_BOSQUE_12 = 42;
    uint256 constant CARTA_BOSQUE_13 = 43;
    uint256 constant CARTA_BOSQUE_14 = 44;
    uint256 constant CARTA_BOSQUE_15 = 45;

    // CONTRUCTOR
    constructor() ERC1155("uri_placeholder") {
    // Definición de atributos para cada carta predefinida para "fuego"
        _cardAttributes[CARTA_FUEGO_1] = CardAttributes("Inferno Dracon", 700, "fuego", 480, "Common");
        _cardAttributes[CARTA_FUEGO_2] = CardAttributes("Llamarada Salamandra", 600, "fuego", 890, "Common");
        _cardAttributes[CARTA_FUEGO_3] = CardAttributes("Emberfury Elemental", 800, "fuego", 720, "Epic");
        _cardAttributes[CARTA_FUEGO_4] = CardAttributes("Pyro Fenix", 550, "fuego", 300, "Common");
        _cardAttributes[CARTA_FUEGO_5] = CardAttributes("Demonio Igins", 750, "fuego", 420, "Rare");
        _cardAttributes[CARTA_FUEGO_6] = CardAttributes("Golem Sofoco", 900, "fuego", 610, "Common");
        _cardAttributes[CARTA_FUEGO_7] = CardAttributes("Chispa Duende", 500, "fuego", 980, "Epic");
        _cardAttributes[CARTA_FUEGO_8] = CardAttributes("Quiemera Abrasadora", 650, "fuego", 750, "Rare");
        _cardAttributes[CARTA_FUEGO_9] = CardAttributes("Vortice de Lava", 720, "fuego", 840, "Epic");
        _cardAttributes[CARTA_FUEGO_10] = CardAttributes("Incendio Dragon", 680, "fuego", 550, "Common");
        _cardAttributes[CARTA_FUEGO_11] = CardAttributes("Salto de Fuego", 620, "fuego", 480, "Common");
        _cardAttributes[CARTA_FUEGO_12] = CardAttributes("Espectro Fusion", 550, "fuego", 720, "Rare");
        _cardAttributes[CARTA_FUEGO_13] = CardAttributes("Hidra", 780, "fuego", 600, "Common");
        _cardAttributes[CARTA_FUEGO_14] = CardAttributes("Llama de Ataque", 820, "fuego", 880, "Legendary");
        _cardAttributes[CARTA_FUEGO_15] = CardAttributes("Quemadura Sierpe", 720, "fuego", 950, "Rare");



        // Definición de atributos para cada carta predefinida para "agua"
        _cardAttributes[CARTA_AGUA_1] = CardAttributes("Leviatan", 800, "agua", 500, "Common");
        _cardAttributes[CARTA_AGUA_2] = CardAttributes("Torrente de Triton", 720, "agua", 650, "Epic");
        _cardAttributes[CARTA_AGUA_3] = CardAttributes("Sirena Malva", 880, "agua", 450, "Common");
        _cardAttributes[CARTA_AGUA_4] = CardAttributes("Vapor Nereida", 600, "agua", 780, "Legendary");
        _cardAttributes[CARTA_AGUA_5] = CardAttributes("Yeti Glacial", 950, "agua", 550, "Rare");
        _cardAttributes[CARTA_AGUA_6] = CardAttributes("Coral", 480, "agua", 900, "Common");
        _cardAttributes[CARTA_AGUA_7] = CardAttributes("Espejismo", 540, "agua", 720, "Common");
        _cardAttributes[CARTA_AGUA_8] = CardAttributes("Dragon de Mar", 720, "agua", 680, "Rare");
        _cardAttributes[CARTA_AGUA_9] = CardAttributes("Aqua Espectro", 820, "agua", 750, "Common");
        _cardAttributes[CARTA_AGUA_10] = CardAttributes("Iceberg", 690, "agua", 800, "Rare");
        _cardAttributes[CARTA_AGUA_11] = CardAttributes("Ballena", 500, "agua", 920, "Common");
        _cardAttributes[CARTA_AGUA_12] = CardAttributes("Invierno", 880, "agua", 600, "Epic");
        _cardAttributes[CARTA_AGUA_13] = CardAttributes("Tsunami Triturador", 760, "agua", 680, "Common");
        _cardAttributes[CARTA_AGUA_14] = CardAttributes("Hidra de la fuente", 920, "agua", 720, "Rare");
        _cardAttributes[CARTA_AGUA_15] = CardAttributes("Cascada Kraken", 980, "agua", 800, "Common");


        // Definición de atributos para cada carta predefinida para "bosque"
        _cardAttributes[CARTA_BOSQUE_1] = CardAttributes("Rafaga Verde", 650, "bosque", 420, "Rare");
        _cardAttributes[CARTA_BOSQUE_2] = CardAttributes("Sombra Elfica", 500, "bosque", 600, "Common");
        _cardAttributes[CARTA_BOSQUE_3] = CardAttributes("Silvana Centauro", 720, "bosque", 480, "Epic");
        _cardAttributes[CARTA_BOSQUE_4] = CardAttributes("Hada Fronda", 550, "bosque", 700, "Common");
        _cardAttributes[CARTA_BOSQUE_5] = CardAttributes("Raiz Eterna", 800, "bosque", 550, "Rare");
        _cardAttributes[CARTA_BOSQUE_6] = CardAttributes("Brote", 480, "bosque", 800, "Common");
        _cardAttributes[CARTA_BOSQUE_7] = CardAttributes("Brisa Pegaso", 720, "bosque", 620, "Common");
        _cardAttributes[CARTA_BOSQUE_8] = CardAttributes("Zafiro Unicornio", 680, "bosque", 750, "Common");
        _cardAttributes[CARTA_BOSQUE_9] = CardAttributes("Gigante Forestal", 820, "bosque", 700, "Legendary");
        _cardAttributes[CARTA_BOSQUE_10] = CardAttributes("Secoya Gigante", 600, "bosque", 880, "Common");
        _cardAttributes[CARTA_BOSQUE_11] = CardAttributes("Cervatillo", 480, "bosque", 980, "Common");
        _cardAttributes[CARTA_BOSQUE_12] = CardAttributes("Serpiente Arborea", 720, "bosque", 720, "Rare");
        _cardAttributes[CARTA_BOSQUE_13] = CardAttributes("Oso voraz", 780, "bosque", 850, "Rare");
        _cardAttributes[CARTA_BOSQUE_14] = CardAttributes("Arco Iris Dragon", 920, "bosque", 900, "Epic");
        _cardAttributes[CARTA_BOSQUE_15] = CardAttributes("Enredadera fatal", 850, "bosque", 980, "Common");
 }

    //MODIFIER GAME MASTER
    modifier onlyGameMaster() {
        require(msg.sender == GAME_MASTER_ADDRESS, "Domes el game master pot cridar aquesta funcio");
        _;
    }

    // EVENTS
    event NovaCartaGenerada(
        address indexed creador,
        uint256 indexed idCarta,
        uint256 quantitat
    );
    event CartaInfo(
        uint256 tokenId,
        string name,
        uint256 life,
        string element,
        uint256 power,
        string rarity
    );
    event IntercanviExitos(
        address direccio1,
        uint256 idCarta1,
        address direccio2,
        uint256 idCarta2
    );

    //  packOpening: Simula l'obertura d'un paquet de cartes en el joc i li atorga al jugador cinc cartes aleatòries.

    function packOpening() external {
        uint256[5] memory idCarta = getRandomNumbers();
        uint256 quantitat = 1;

        for (uint256 i = 0; i < 5; i++) {
            require(idCarta[i] <= MAX_ID_CARTES, "ID de carta no valid");
            _mint(msg.sender, idCarta[i], quantitat, "");

           if (_balancePerCarta[msg.sender][idCarta[i]] == 0) {
            _balancePerCarta[msg.sender][idCarta[i]] = quantitat;
        } else { _balancePerCarta[msg.sender][idCarta[i]] += quantitat;
        
        }

            emit NovaCartaGenerada(msg.sender, idCarta[i], quantitat);
        }
    }

    // obtenirDadesCartes: La funció permet a un cridador extern obtenir dades específiques sobre una carta si posseeix almenys una instància d'aquella carta.

    function obtenirDadesCarta(uint256 idCarta)
        external
        view
        returns (
            string memory name,
            uint256 life,
            uint256 power,
            string memory element,
            string memory rarity,
            uint256 quantitat
        )
    {
        require(idCarta <= MAX_ID_CARTES, "ID de carta no valid");
        require(
            _balancePerCarta[msg.sender][idCarta] > 0,
            "No poseeixes aquesta carta"
        );

        // Obtenir els atributs de la carta
        CardAttributes memory atributs = _cardAttributes[idCarta];

        uint256 quantitatCartas = _balancePerCarta[msg.sender][idCarta];

        // Retornar les dades específiques de la carta
        return (
            atributs.name,
            atributs.life,
            atributs.power,
            atributs.element,
            atributs.rarity,
            quantitatCartas
        );
    }

    // Funció per generar 5 ID de carta aleatori entre 1 y 45
    function getRandomNumbers() public view returns (uint256[5] memory) {
        uint256[5] memory randomNumbers;

        for (uint256 i = 0; i < 5; i++) {
            uint256 blockValue = uint256(blockhash(block.number - i - 1));
            randomNumbers[i] = (blockValue % 45) + 1;
        }

        return randomNumbers;
    }

    function obtenirIdsDeCartesPerDireccio(address direccio)
        public
        view
        returns (uint256[] memory)
    {
        uint256[] memory ids = new uint256[](MAX_ID_CARTES);
        uint256 contador = 0;

        for (uint256 i = 0; i <= MAX_ID_CARTES; i++) {
            if (_balancePerCarta[direccio][i] > 0) {
                ids[contador] = i;
                contador++;
            }
        }

        // Redimensionar l'array per eliminar entrades no utilizades
        assembly {
            mstore(ids, contador)
        }

        return ids;
    }

   // obtenirInformacioCartesPerDireccio: Obtenir una llista dels IDs de les cartes que pertanyen a una adreça (direcció) específica

    function obtenirInformacioCartesPerDireccio(address direccio) public {
        uint256[] memory ids = obtenirIdsDeCartesPerDireccio(direccio);

        for (uint256 i = 0; i < ids.length; i++) {
            uint256 tokenId = ids[i];

            // Verificar que el tokenId sigui válid i existesqui en _cardAttributes
            require(
                tokenId > 0 && tokenId <= MAX_ID_CARTES,
                "Token ID no valid"
            );

            emit CartaInfo(
                tokenId,
                _cardAttributes[tokenId].name,
                _cardAttributes[tokenId].life,
                _cardAttributes[tokenId].element,
                _cardAttributes[tokenId].power,
                _cardAttributes[tokenId].rarity
            );
        }
    }

    //  intercanviarCartes: gestiona l'intercanvi de cartes entre dues adreces diferents.
    function intercanviarCartes(
        address direccio1,
        uint256 idCarta1,
        address direccio2,
        uint256 idCarta2
    ) external {
        // Verificar que les direccions no siguin la mateixa
        require(direccio1 != direccio2, "Les direccions han de ser diferents");

        // Verificar que els IDs de las cartes son válids
        require(
            idCarta1 <= MAX_ID_CARTES && idCarta2 <= MAX_ID_CARTES,
            "ID de carta no valid"
        );

        // Verificar que ambdues direccions tenguin les cartes que intercambiaran
        require(
            _balancePerCarta[direccio1][idCarta1] > 0,
            "La primera direccio no te la carta especificada"
        );
        require(
            _balancePerCarta[direccio2][idCarta2] > 0,
            "La segona direccio no te la carta especificada"
        );

        // Es realitza l'intercanvi real de les cartes. 
        //Es redueix en una unitat la quantitat de la carta idCarta1 a la col·lecció de direccio1 
        // i s'incrementa en una unitat a la col·lecció de direccio2. Es realitza la mateixa operació per a la carta idCarta2.
        _balancePerCarta[direccio1][idCarta1]--;
        _balancePerCarta[direccio1][idCarta2]++;
        _balancePerCarta[direccio2][idCarta1]++;
        _balancePerCarta[direccio2][idCarta2]--;



        // Emitir event intercanvi exitós
        emit IntercanviExitos(direccio1, idCarta1, direccio2, idCarta2);
    }

    // simularBatallaEntreJugadors: Simula una batalla entre dos jugadors amb les seves respectives cartes.
    function simularBatallaEntreJugadors(
        address direccioJugador1,
        uint256 idCartaJugador1,
        address direccioJugador2,
        uint256 idCartaJugador2
    ) external view returns (string memory resultat) {
        // Obtener los atributs de ambas cartas
        CardAttributes memory cartaJugador1 = _cardAttributes[idCartaJugador1];
        CardAttributes memory cartaJugador2 = _cardAttributes[idCartaJugador2];

        // Verificar que ambas direcciones posean las cartas que van a pelear
        require(
            _balancePerCarta[direccioJugador1][idCartaJugador1] > 0,
            "El Jugador 1 no te la carta especificada"
        );
        require(
            _balancePerCarta[direccioJugador2][idCartaJugador2] > 0,
            "El Jugador 2 no te la carta especificada"
        );

        // Inicialitzar variables de vida
        uint256 vidaJugador1 = cartaJugador1.life;
        uint256 vidaJugador2 = cartaJugador2.life;

        // Determinar qui comença primer
        bool turnoJugador1 = (getRandomNumbers()[0] % 2 == 0);

        while (vidaJugador1 > 0 && vidaJugador2 > 0) {
            // Calcular el mal que infligeix cada jugador en el seu torn
            uint256 malJugador1 = cartaJugador1.power;
            uint256 malJugador2 = cartaJugador2.power;

            // Aplicar bonificació afinitat
            if (
                keccak256(abi.encodePacked((cartaJugador1.element))) ==
                keccak256(abi.encodePacked("agua")) &&
                keccak256(abi.encodePacked((cartaJugador2.element))) ==
                keccak256(abi.encodePacked("fuego"))
            ) {
                malJugador1 *= 2; // El poder de aigua es doble contra foc
            } else if (
                keccak256(abi.encodePacked((cartaJugador1.element))) ==
                keccak256(abi.encodePacked("fuego")) &&
                keccak256(abi.encodePacked((cartaJugador2.element))) ==
                keccak256(abi.encodePacked("bosque"))
            ) {
                malJugador1 *= 2; // El poder de foc es doble contra bosc
            } else if (
                keccak256(abi.encodePacked((cartaJugador1.element))) ==
                keccak256(abi.encodePacked("bosque")) &&
                keccak256(abi.encodePacked((cartaJugador2.element))) ==
                keccak256(abi.encodePacked("agua"))
            ) {
                malJugador1 *= 2; // El poder de bosc es doble contra aigua
            }

            if (
                keccak256(abi.encodePacked((cartaJugador2.element))) ==
                keccak256(abi.encodePacked("agua")) &&
                keccak256(abi.encodePacked((cartaJugador1.element))) ==
                keccak256(abi.encodePacked("fuego"))
            ) {
                malJugador2 *= 2; // El poder de aigua es doble contra foc
            } else if (
                keccak256(abi.encodePacked((cartaJugador2.element))) ==
                keccak256(abi.encodePacked("fuego")) &&
                keccak256(abi.encodePacked((cartaJugador1.element))) ==
                keccak256(abi.encodePacked("bosque"))
            ) {
                malJugador2 *= 2; // El poder de foc es doble contra bosc
            } else if (
                keccak256(abi.encodePacked((cartaJugador2.element))) ==
                keccak256(abi.encodePacked("bosque")) &&
                keccak256(abi.encodePacked((cartaJugador1.element))) ==
                keccak256(abi.encodePacked("agua"))
            ) {
                malJugador2 *= 2;  // El poder de bosc es doble contra aigua
            }
          // Aplicar el mal a l'oponent
            if (turnoJugador1) {
                vidaJugador2 = (vidaJugador2 > malJugador1)
                    ? (vidaJugador2 - malJugador1)
                    : 0;
            } else {
                vidaJugador1 = (vidaJugador1 > malJugador2)
                    ? (vidaJugador1 - malJugador2)
                    : 0;
            }

            // Alternar el torn
            turnoJugador1 = !turnoJugador1;
        }

        // Determinar el resultat de la batalla
        if (vidaJugador1 == 0 && vidaJugador2 == 0) {
            resultat = "Empate";
        } else if (vidaJugador1 == 0) {
            resultat = string(
                abi.encodePacked(
                    "Jugador 2 guanya amb ",
                    _cardAttributes[idCartaJugador2].name
                )
            );
        } else {
            resultat = string(
                abi.encodePacked(
                    "Jugador 1 guanya amb ",
                    _cardAttributes[idCartaJugador1].name
                )
            );

            return resultat;
        }
    }
    // Funcio que permet modificar atribtus cartes
     function modificarAtributsCarta(
        uint256 idCarta,
        string memory newName,
        uint256 newLife,
        uint256 newPower,
        string memory newElement,
        string memory newRarity
    ) external onlyGameMaster {
        require(idCarta <= MAX_ID_CARTES, "ID de carta no valid");

        CardAttributes storage atributs = _cardAttributes[idCarta];
        atributs.name = newName;
        atributs.life = newLife;
        atributs.power = newPower;
        atributs.element = newElement;
        atributs.rarity = newRarity;
    }

}
