// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.6;

import {PolicyTestBase} from "contracts/test/policy/PolicyTestBase.sol";
import {Decimals} from "contracts/src/common/libs/Decimals.sol";

contract PolicyTest1 is PolicyTestBase {
	using Decimals for uint256;

	function rewards(uint256 _lockups, uint256 _assets)
		external
		view
		override
		returns (uint256)
	{
		return _lockups + _assets;
	}

	function holdersShare(uint256 _amount, uint256 _lockups)
		external
		view
		override
		returns (uint256)
	{
		uint256 sum = _amount + _lockups;
		uint256 share = _lockups.outOf(sum);
		return _amount - (_amount * share).divBasis();
	}

	function authenticationFee(uint256 _assets, uint256 _propertyLockups)
		external
		view
		override
		returns (uint256)
	{
		return _assets + _propertyLockups - 1;
	}
}
