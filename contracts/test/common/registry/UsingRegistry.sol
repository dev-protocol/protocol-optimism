// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.7;

import {UsingRegistry} from "../../../src/common/registry/UsingRegistry.sol";

contract UsingRegistryTest is UsingRegistry {
	constructor(address _registry) UsingRegistry(_registry) {}

	function getToken() external view returns (address) {
		return registry().registries("Dev");
	}
}
