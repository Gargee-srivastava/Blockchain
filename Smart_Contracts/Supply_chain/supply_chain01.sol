pragma solidity ^0.4.24;

contract supply_chain01{
 
 
 address owner;
 
struct product{
    
    bool isuidgenerated;
    uint pid;
    string p_name;
    string transitstatus;
    uint orderstatus;  //1=ordered,2=in-transit,3=delivered,4=canceled
    
    address customer;
    uint ordertime;
    
    //assuming three carriers are involved in the supplychain
    address carrier1;
    uint carrier1_time;
    
    address carrier2;
    uint carrier2_time;
    
    address carrier3;
    uint carrier3_time;
}    
mapping(address=>product) public products;
mapping(address=>bool) public carriers;


/////////////////////////////////////////////////modifier/////////////////////////////////////////////////////////////////////////////////////


constructor(){
    owner=msg.sender;//one who deploys the code in blockchain will b the owner
}


////authorised owner///
modifier onlyowner(){
    
    require(msg.sender==owner);
    _;                           /////validating if the requesting person is owner or not
}


///////////////////////////////////////////managing carriers//////////////////////////////////////////////////////////////////
/////////////////////////////////////for assigning role of carrier to any account by owner//////////////////////////////////////////////////

function managecarriers(address _carrieraddress) onlyowner public returns(string){
    
    if(!carriers[_carrieraddress]){
        carriers[_carrieraddress]=true;
    }
    else{
    carriers[_carrieraddress]=false;
    }
    
    return "carrier has been updated!";
}

//////////////////////////////////////////order product//////////////////////////////////////////
function orderproduct(uint _pid,string _p_name) public returns(address){
    address uniqueid= address(sha256(msg.sender,now)); //to differentiate between two users and one user ordering products at different time
    products[uniqueid].isuidgenerated=true;
    products[uniqueid].pid=_pid;
    products[uniqueid].p_name=_p_name;
    products[uniqueid].transitstatus="your product is ordered and is under processing!!";
    products[uniqueid].orderstatus=1;
    products[uniqueid].customer=msg.sender;
    products[uniqueid].ordertime=now;

    return uniqueid;
    
}
    

///////////////////////////////////cancel order/////////////////////////////////////////////////////
function cancelorder(address _uniqueid,uint _pid) public returns(string){
    
    require(products[_uniqueid].isuidgenerated); //check if address is valid
    require(products[_uniqueid].customer== msg.sender); //authenticating the customer requesting cancellation
    require(products[_uniqueid].orderstatus!=3); //check if order is not delivered
    
    products[_uniqueid].orderstatus=4;
    products[_uniqueid].transitstatus="order has been cancelled!!";
    
    return "your order has been cancelled successfully!!!";
}
    
    
///////tracking product from carrier1 report////////////
function carrier1report(address _uniqueid ,string _transitstatus){
    require(products[_uniqueid].isuidgenerated);
    require(carriers[msg.sender]);
    require(products[_uniqueid].orderstatus==1);
    
    products[_uniqueid].carrier1=msg.sender;
    products[_uniqueid].carrier1_time=now;
    products[_uniqueid].transitstatus=_transitstatus;
    
    products[_uniqueid].orderstatus=2;
    
    
}
///////tracking product from carrier2 report////////////
function carrier2report(address _uniqueid ,string _transitstatus){
    require(products[_uniqueid].isuidgenerated);
    require(carriers[msg.sender]);
    require(products[_uniqueid].orderstatus==2);
    
    products[_uniqueid].carrier2=msg.sender;
    products[_uniqueid].carrier2_time=now;
    products[_uniqueid].transitstatus=_transitstatus;
    
    //products[_uniqueid].orderstatus=2;
    
    
}///////tracking product delivery from carrier3 report////////////
function carrier3report(address _uniqueid ,string _transitstatus){
    require(products[_uniqueid].isuidgenerated);
    require(carriers[msg.sender]);
    require(products[_uniqueid].orderstatus==2);
    
    products[_uniqueid].carrier3=msg.sender;
    products[_uniqueid].carrier3_time=now;
    products[_uniqueid].transitstatus=_transitstatus;
    
    products[_uniqueid].orderstatus=3;
    
    
}
}
