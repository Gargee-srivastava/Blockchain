App = {
  web3Provider: null,
  contracts: {},
  account:'0x0',

  init: async function() {
 

    return App.initWeb3();
  },

  initWeb3: async function() {
    /*
     * Replace me...
     */
    if(typeof web3 !=='undefined') {
//if a web3 instance is already provided by Metamask
     App.web3Provider=web3.currentProvider;
     web3 = new Web3(web3.currentProvider);
     }
     else
       {
         App.web3Provider= new Web3.providers.HttpProvider('http://localhost:7545');
                          //App.web3Provider=new web3.setProvider(new Web3.providers.HttpProvider('http://localhost:7545'));
         web3=new Web3(App.web3Provider);
       }
     
    return App.initContract();
  },

  initContract: function() {
    /*
     * Replace me...
     */
    $.getJSON("Election.json",function(election){
        App.contracts.Election=TruffleContract(election);
        App.contracts.Election.setProvider(App.web3Provider);
      
    return App.render();
    });
 },
 voteforc1_js:function(){
		 App.contracts.Election.deployed().then(function(instance){
			 return instance.vote(1 , { from: App.account });
		 }).catch(function(err){
			 console.log(err);
		 });
	 },
  voteforc2_js:function(){
		 App.contracts.Election.deployed().then(function(instance){
			 return instance.vote(2 , { from: App.account });
		 }).catch(function(err){
			 console.log(err);
		 });
	 },
  
  render: function(){
          var electionInstance;
    var loader = $("#loader");
    var content = $("#content");

    loader.show();
    content.hide();

    // Load account data
    web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        App.account = account;
        $("#accountAddress").html("Your Account: " + account);
      }
    });

   //web3.eth.getCoinbase(function(err,account) {
     // if (err == null){
       // App.acount=account;
         // }
          //});
    // Load contract data
    App.contracts.Election.deployed().then(function(instance) {
      electionInstance = instance;
      return electionInstance.candidates(1);
    }).then(function(candidate) {
      console.log("candidate id :",candidate[0].toNumber());
      console.log("candidate name :",candidate[1]);
      console.log("candidate votes :",candidate[2].toNumber());
      document.getElementById("candidate1id").innerHTML=candidate[1];
      document.getElementById("candidate1voteid").innerHTML=candidate[2];



    });
	   App.contracts.Election.deployed().then(function(instance) {
      electionInstance = instance;
      return electionInstance.candidates(2);
    }).then(function(Candidate) {
      console.log("candidate id :",Candidate[0].toNumber());
      console.log("candidate name :",Candidate[1]);
      console.log("candidate votes :",Candidate[2].toNumber());
	  
                 

      document.getElementById("candidate2id").innerHTML=Candidate[1];
       document.getElementById('candidate2voteid').innerHTML = Candidate[2];
      //document.getElementById("candidate2voteid").innerHTML=candidate[2].toNumber;
	



    });
  }
};
$(function() {
  $(window).load(function() {
    App.init();
  });
});


  //bindEvents: function() {
    //$(document).on('click', '.btn-adopt', App.handleAdopt);
  //},

//  markAdopted: function(adopters, account) {
    /*
     * Replace me...
     */
  //},

  //handleAdopt: function(event) {
    //event.preventDefault();

    //var petId = parseInt($(event.target).data('id'));

    /*
     * Replace me...
     */
  //}

//};
