//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

interface IERC20 {
  //aprovar
  function approve(address _spender, uint _value) external returns (bool);
  //retirar tokens del contrato
    function transfer(address _to, uint256 _value) external returns (bool);
  //recibir tokens al contrato
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    //obtener balance del contrato
    function balanceOf(address account) external view returns (uint256);
    
}

contract MyContract {
  mapping(address => mapping (address => uint256)) allowed; 
  event Approval(address indexed owner, address indexed spender, uint256 value);
  function recibirTokens( uint256 _amount) external {
    IERC20 token = IERC20(address(0x326C977E6efc84E512bB9C30f76E30c160eD06FB));
    require(token.transferFrom(msg.sender, address(this), _amount), "Token transfer failed");
  }
    // Do not use in production
    // This function can be executed by anyone
  function retirarUSDT(address _to, uint256 _amount) external {

        IERC20 usdt = IERC20(address(0x326C977E6efc84E512bB9C30f76E30c160eD06FB));// This is the Goerli LINK contract address
        // transfers USDT that belong to your contract to the specified address
        usdt.transfer(_to, _amount);
  }
    //obtenemos el balance de token link 
  function getContractBalance() public view returns(uint){
         return IERC20(address(0x326C977E6efc84E512bB9C30f76E30c160eD06FB)).balanceOf(address(this));
  }


  /*
function approve(address spender, uint256 value)  external  returns (bool) {
    require(spender != address(0), "Error: invalid spender address");
    allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}*/
}