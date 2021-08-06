// SPDX-License-Identifier: MPL-2.0
pragma solidity =0.8.6;

interface IDevMinter {
	function mint(address account, uint256 amount) external returns (bool);

	function renounceMinter() external;
}
