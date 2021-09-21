// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.7;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {IAddressRegistry} from "../../../interface/IAddressRegistry.sol";

/**
 * Module for using AddressRegistry contracts.
 */
contract InitializableUsingRegistry is Initializable {
	address private _registry;

	/**
	 * Initialize the argument as AddressRegistry address.
	 */
	/* solhint-disable func-name-mixedcase */
	function __UsingRegistry_init(address _addressRegistry)
		internal
		initializer
	{
		_registry = _addressRegistry;
	}

	/**
	 * Returns the latest AddressRegistry instance.
	 */
	function registry() internal view returns (IAddressRegistry) {
		return IAddressRegistry(_registry);
	}

	/**
	 * Returns the AddressRegistry address.
	 */
	function registryAddress() external view returns (address) {
		return _registry;
	}
}
