// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "https://github.com/LayerZero-Labs/solidity-examples/blob/main/contracts/lzApp/NonblockingLzApp.sol";

contract LayerZeroTest is NonblockingLzApp {
    // string public data = "Nothing received yet";
    address[] public addresses;
    uint[] public ids;
    uint16 public destChainId;

    constructor(address _lzEndpoint) NonblockingLzApp(_lzEndpoint) {
        if (_lzEndpoint == 0xf69186dfBa60DdB133E91E9A4B5673624293d8F8)
            destChainId = 10112;
        if (_lzEndpoint == 0x7dcAD72640F835B0FA36EFD3D6d3ec902C7E5acf)
            destChainId = 10109;
    }

    function _nonblockingLzReceive(
        uint16,
        bytes memory,
        uint64,
        bytes memory _payload
    ) internal override {
        (addresses, ids) = abi.decode(_payload, (address[], uint256[]));
    }

    function send(
        address[] memory _addresses,
        uint[] memory _ids
    ) public payable {
        require(_addresses.length == _ids.length);
        bytes memory payload = abi.encode(_addresses, _ids);
        // bytes memory payload = abi.encode(_message);
        _lzSend(
            destChainId,
            payload,
            payable(msg.sender),
            address(0x0),
            bytes(""),
            msg.value
        );
    }

    function trustAddress(address _otherContract) public onlyOwner {
        trustedRemoteLookup[destChainId] = abi.encodePacked(
            _otherContract,
            address(this)
        );
    }
}