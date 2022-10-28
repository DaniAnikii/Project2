pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;

contract Splitwise{
    struct IOU{
        address debtor;
        address creditor;
        uint32 amount;
        uint256 date;
    }

IOU[] public listIOUs;

function getIOUsArray() public view returns (IOU[] memory){
return listIOUs;
}

function lookup(address debtor, address creditor) public view returns (uint32 ret){
    for (uint i = 0; i < listIOUs.length; i++)
    {
    if(listIOUs[i].debtor == debtor && listIOUs[i].creditor == creditor)
    {
    ret += listIOUs[i].amount;
    }
}
}

function add_IOU(address creditor, uint32 amount, uint256 date) public{
    IOU memory newIOU;
    newIOU.debtor = msg.sender;
    newIOU.creditor = creditor;
    newIOU.amount = amount;
    newIOU.date = date;
    listIOUs.push(newIOU);

}

}
