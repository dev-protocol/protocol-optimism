// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.6;

<<<<<<< HEAD
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
=======
import {Ownable} from "@openzeppelin/contracts/ownership/Ownable.sol";
>>>>>>> origin/main
import {UsingRegistry} from "contracts/src/common/registry/UsingRegistry.sol";
import {IMarketBehavior} from "contracts/interface/IMarketBehavior.sol";
import {IMarket} from "contracts/interface/IMarket.sol";

contract MarketTest1 is Ownable, IMarketBehavior, UsingRegistry {
	string public schema = "[]";
	address private associatedMarket;
	address private metrics;
	uint256 private lastBlock;
	uint256 private currentBlock;
	mapping(address => string) private keys;
	mapping(string => address) private addresses;

	constructor(address _registry) public UsingRegistry(_registry) {}

	function authenticate(
		address _prop,
		string memory _args1,
		string memory,
		string memory,
		string memory,
		string memory,
		address market,
		address
	) public returns (bool) {
		require(msg.sender == associatedMarket, "Invalid sender");

		bytes32 idHash = keccak256(abi.encodePacked(_args1));
		address _metrics = IMarket(market).authenticatedCallback(_prop, idHash);
		keys[_metrics] = _args1;
		addresses[_args1] = _metrics;
		return true;
	}

	function getId(address _metrics) public view returns (string memory) {
		return keys[_metrics];
	}

	function getMetrics(string memory _id) public view returns (address) {
		return addresses[_id];
	}

	function setAssociatedMarket(address _associatedMarket) external onlyOwner {
		associatedMarket = _associatedMarket;
	}
}
