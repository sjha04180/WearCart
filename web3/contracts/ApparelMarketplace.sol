// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ApparelMarketplace
 * @dev A simple e-commerce contract for HackFiesta
 */
contract ApparelMarketplace {
    struct Product {
        uint256 id;
        string name;
        uint256 price; // In Wei
        uint256 stock;
        bool exists;
    }

    // State Variables
    address public owner;
    uint256 public productCount;
    mapping(uint256 => Product) public products;

    // Events
    event ProductListed(uint256 indexed id, string name, uint256 price, uint256 stock);
    event ItemSold(address indexed buyer, uint256 indexed productId, uint256 quantity);
    event StockUpdated(uint256 indexed productId, uint256 newStock);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function listProduct(string memory _name, uint256 _price, uint256 _stock) public onlyOwner {
        productCount++;
        products[productCount] = Product(productCount, _name, _price, _stock, true);
        emit ProductListed(productCount, _name, _price, _stock);
    }

    function updateStock(uint256 _id, uint256 _newStock) public onlyOwner {
        require(products[_id].exists, "Product does not exist");
        products[_id].stock = _newStock;
        emit StockUpdated(_id, _newStock);
    }

    function buyProduct(uint256 _id, uint256 _quantity) public payable {
        require(products[_id].exists, "Product does not exist");
        require(products[_id].stock >= _quantity, "Out of stock");
        require(msg.value >= products[_id].price * _quantity, "Insufficient ETH sent");

        // Deduct stock
        products[_id].stock -= _quantity;

        // Emit sold event
        emit ItemSold(msg.sender, _id, _quantity);
    }

    function withdraw() public onlyOwner {
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    // Function to get product details
    function getProduct(uint256 _id) public view returns (Product memory) {
        return products[_id];
    }
}
